.code
.importzp TEMP_VAR, PPU_CTRL_VAR

.export _setSpritesBank
;void fastcall setSpritesBank(uchar bank);
_setSpritesBank:
    and #%00000001
    asl a
    asl a
    asl a
    sta TEMP_VAR
    lda PPU_CTRL_VAR
    and #%11110111
    ora TEMP_VAR
    sta PPU_CTRL_VAR
    rts

