.code
.importzp TEMP_VAR, PPU_CTRL_VAR

.export _setSpritesSize
;void fastcall setSpritesSize(uchar size);
_setSpritesSize:
    sta TEMP_VAR
    lda PPU_CTRL_VAR
    and #%11011111
    ora TEMP_VAR
    sta PPU_CTRL_VAR
    rts
