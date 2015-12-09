.segment "ZEROPAGE"
.import TEMP_VAR
TILE_INDEX = TEMP_VAR	; word

.segment "CODE"
.import popax, PPU_ADDR, PPU_DATA

.export _printNametableString
;void fastcall printNametableString(uint coordinates, uchar *string);
_printNametableString:
	sta <TILE_INDEX
	stx <TILE_INDEX+1
	jsr popax
	stx PPU_ADDR
	sta PPU_ADDR
	ldy #0
@1:
    lda (TILE_INDEX), y
    beq @2
	sta PPU_DATA
	iny
	bne @1
@2:
    rts
