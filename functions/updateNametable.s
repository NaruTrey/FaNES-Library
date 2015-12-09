.segment "ZEROPAGE"
.import NAMETABLE_UPDATE_ADDRESS_VAR, NAMETABLE_UPDATE_ENABLED_VAR
.import PPU_CTRL_VAR

.segment "CODE"
.import PPU_ADDR, PPU_DATA, PPU_CTRL

.export _updateNametable
;void fastcall updateNametable(uchar *buffer);
_updateNametable:
	sta <NAMETABLE_UPDATE_ADDRESS_VAR + 0
	stx <NAMETABLE_UPDATE_ADDRESS_VAR + 1
	ora <NAMETABLE_UPDATE_ADDRESS_VAR + 1
	sta <NAMETABLE_UPDATE_ENABLED_VAR
	rts
_flush_vram_update_nmi:
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
	rts
