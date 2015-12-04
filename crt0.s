.segment "HEADER"
.import NES_MAPPER, NES_PRG_BANKS, NES_CHR_BANKS, NES_MIRRORING
    .byte $4E, $45, $53, $1A	; "NES" + EOF
	.byte <NES_PRG_BANKS
	.byte <NES_CHR_BANKS
	.byte <NES_MIRRORING | (<NES_MAPPER << 4)
	.byte <NES_MAPPER & $F0
	.res 8, 0

.segment "ZEROPAGE"
.export PPU_CTRL_VAR, PPU_MASK_VAR, PALETTE_UPDATE_VAR
.export FRAME_WAIT_VAR, FRAME_CNT_VAR, NAMETABLE_UPDATE_ENABLED_VAR
.export NAMETABLE_UPDATE_ADDRESS_VAR, PPU_SCROLL_X_VAR, PPU_SCROLL_Y_VAR
.export PAD_STATE_VAR, PAD_STATEP_VAR, PAD_STATET_VAR, TEMP_VAR

PPU_CTRL_VAR:					.res 1
PPU_MASK_VAR:               	.res 1
PALETTE_UPDATE_VAR:         	.res 1
FRAME_WAIT_VAR:					.res 1
FRAME_CNT_VAR:					.res 1
NAMETABLE_UPDATE_ENABLED_VAR:   .res 1
NAMETABLE_UPDATE_ADDRESS_VAR:	.res 1
PPU_SCROLL_X_VAR:               .res 1
PPU_SCROLL_Y_VAR:               .res 1
PAD_STATE_VAR: 					.res 2
PAD_STATEP_VAR: 				.res 2
PAD_STATET_VAR:					.res 2
TEMP_VAR:						.res 32

.segment "STARTUP"
.export __STARTUP__: absolute = 1

.import __RAM_START__, __RAM_SIZE__
.import initlib, copydata, zerobss
.import _main

.include "zeropage.inc"
.include "registers.inc"

start:
reset:
    sei
    ldx #$FF
    txs
    inx
    stx PPU_MASK
    stx APU_DMC_FREQ
    stx PPU_CTRL		;no NMI

initPPU:
    bit PPU_STATUS
@1:
    bit PPU_STATUS
    bpl @1
@2:
    bit PPU_STATUS
    bpl @2

clearPalette:
	lda #$3F
	sta PPU_ADDR
	stx PPU_ADDR
	lda #$0F
	ldx #$20
@1:
	sta PPU_DATA
	dex
	bne @1

clearVRAM:
	txa
	ldy #$20
	sty PPU_ADDR
	sta PPU_ADDR
	ldy #$10
@1:
	sta PPU_DATA
	inx
	bne @1
	dey
	bne @1

clearRAM:
    txa
@1:
    sta $000, x
    sta $100, x
    sta $200, x
    sta $300, x
    sta $400, x
    sta $500, x
    sta $600, x
    sta $700, x
    inx
    bne @1

	lda #$0f
	ldx #0
@2:
	sta PALETTE_BUFFER_VAR,x
	inx
	cpx #$20
	bne @2
	stx <PALETTE_UPDATE_VAR
	
	ldx #0
	lda #$ff
@3:
	sta OAM_BUFFER_VAR,x
	inx
	inx
	inx
	inx
	bne @3
	
    jsr	zerobss
	jsr	copydata
	
    lda #<(__RAM_START__ + __RAM_SIZE__)
    sta	sp
    lda	#>(__RAM_START__ + __RAM_SIZE__)
    sta	sp + 1

	jsr	initlib

	lda #%10000000
	sta <PPU_CTRL_VAR
	sta PPU_CTRL		;enable NMI
	lda #%00000110
	sta <PPU_MASK_VAR

waitSync3:
	lda <FRAME_CNT_VAR
@1:
	cmp <FRAME_CNT_VAR
	nop
	beq @1

detectNTSC:
	ldx #52				;blargg's code
	ldy #24
@1:
	dex
	bne @1
	dey
	bne @1

	lda #0
	sta PPU_SCROLL
	sta PPU_SCROLL

	jmp _main
	
.export PPU_OAM_BUFFER_VAR, PALETTE_BUFFER_VAR, OAM_BUFFER_VAR
PPU_OAM_BUFFER_VAR	= $0200
PALETTE_BUFFER_VAR	= $01C0
OAM_BUFFER_VAR		= $0200

nmi:
	pha
	txa
	pha
	tya
	pha
	
	lda <PPU_MASK_VAR	;if rendering is disabled, do not access the VRAM at all
	and #%00011000
	bne @doUpdate
	jmp	@skipAll

@doUpdate:
	ldx #0				;update OAM
	stx PPU_OAM_ADDR
	lda #>PPU_OAM_BUFFER_VAR
	sta PPU_OAM_DMA

	lda <PALETTE_UPDATE_VAR		;update palette if needed
	bne @updPal
	jmp @updVRAM

@updPal:

	stx <PALETTE_UPDATE_VAR

	lda #$3F
	sta PPU_ADDR
	stx PPU_ADDR


	.repeat 4, I
	    lda PALETTE_BUFFER_VAR + I
	    sta PPU_DATA
	.endrepeat

	.repeat 3, J
	    lda PPU_DATA			;skip background color
	    .repeat 3, I
	        lda PALETTE_BUFFER_VAR + 5 + (J * 4) + I
	        sta PPU_DATA
	    .endrepeat
	.endrepeat

	.repeat 4, J
	    lda PPU_DATA			;skip background color
	    .repeat 3,I
	        lda PALETTE_BUFFER_VAR + 17 + (J * 4) + I
	        sta PPU_DATA
	    .endrepeat
	.endrepeat


@updVRAM:

	lda <FRAME_WAIT_VAR
	beq @skipUpd
	stx <FRAME_WAIT_VAR
	
	lda <NAMETABLE_UPDATE_ENABLED_VAR
	beq @skipUpd

@flush_vram_update_nmi:
	ldy #0
@updName:
	lda (NAMETABLE_UPDATE_ADDRESS_VAR),y
	iny
	cmp #$40				;is it a non-sequental write?
	bcs @updNotSeq
	sta PPU_ADDR
	lda (NAMETABLE_UPDATE_ADDRESS_VAR),y
	iny
	sta PPU_ADDR
	lda (NAMETABLE_UPDATE_ADDRESS_VAR),y
	iny
	sta PPU_DATA
	jmp @updName
@updNotSeq:
	tax
	lda <PPU_CTRL_VAR
	cpx #$80				;is it a horizontal or vertical sequence?
	bcc @updHorzSeq
	cpx #$ff				;is it end of the update?
	beq @updDone
@updVertSeq:
	ora #$04
	bne @updNameSeq			;bra
@updHorzSeq:
	and #$fb
@updNameSeq:
	sta PPU_CTRL
	txa
	and #$3f
	sta PPU_ADDR
	lda (NAMETABLE_UPDATE_ADDRESS_VAR),y
	iny
	sta PPU_ADDR
	lda (NAMETABLE_UPDATE_ADDRESS_VAR),y
	iny
	tax
@updNameLoop:
	lda (NAMETABLE_UPDATE_ADDRESS_VAR),y
	iny
	sta PPU_DATA
	dex
	bne @updNameLoop
	lda <PPU_CTRL_VAR
	sta PPU_CTRL
	jmp @updName
@updDone:

@skipUpd:

	lda #0
	sta PPU_ADDR
	sta PPU_ADDR

	lda <PPU_SCROLL_X_VAR
	sta PPU_SCROLL
	lda <PPU_SCROLL_Y_VAR
	sta PPU_SCROLL

	lda <PPU_CTRL_VAR
	sta PPU_CTRL

@skipAll:

	lda <PPU_MASK_VAR
	sta PPU_MASK

	inc <FRAME_CNT_VAR

@skipNtsc:

	;jsr FamiToneUpdate

	pla
	tay
	pla
	tax
	pla
irq:
	rti


.segment "VECTORS"
    .word nmi	;$fffa vblank nmi
    .word reset	;$fffc reset
   	.word irq	;$fffe irq / brk
