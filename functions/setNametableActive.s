.code
.importzp PPU_CTRL_VAR, TEMP_VAR

.export _setNametableActive
;void fastcall setNametableActive(uchar nametable);
_setNametableActive:
	and #$03
	sta <TEMP_VAR
	lda <PPU_CTRL_VAR
	and #$FC
	ora <TEMP_VAR
	sta <PPU_CTRL_VAR
    rts
    
