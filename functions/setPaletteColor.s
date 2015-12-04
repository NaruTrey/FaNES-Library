.segment "ZEROPAGE"
.import PALETTE_UPDATE_VAR, TEMP_VAR
POINTER = TEMP_VAR

.segment "CODE"
.import popa, PALETTE_BUFFER_VAR

.export _setPaletteColor
;void fastcall setPaletteColor(uchar index, uchar color);
_setPaletteColor:
	sta <POINTER
	jsr popa
	and #$1f
	tax
	lda <POINTER
	sta PALETTE_BUFFER_VAR,x
	inc <PALETTE_UPDATE_VAR
	rts
