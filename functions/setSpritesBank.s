.segment "ZEROPAGE"
.import TEMP_VAR, PPU_CTRL_VAR

.segment "CODE"

.export _setSpritesBank
;void fastcall setSpritesBank(uchar bank);
_setSpritesBank:
	and #$01
	asl a
	asl a
	asl a
	sta <TEMP_VAR
	lda <PPU_CTRL_VAR
	and #%11110111
	ora <TEMP_VAR
	sta <PPU_CTRL_VAR
	rts
    
