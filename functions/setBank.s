.code
.importzp TEMP_VAR, PPU_CTRL_VAR

.export _setBankSprites
;void fastcall setBankSprites(uchar bank);
_setBankSprites:
    sta TEMP_VAR
    lda PPU_CTRL_VAR
    and #%11110111
    ora TEMP_VAR
    sta PPU_CTRL_VAR
    rts


.export _setBankBackground
;void fastcall setBankBackground(uchar bank);
_setBankBackground:
    sta TEMP_VAR
    lda PPU_CTRL_VAR
    and #%11101111
    ora TEMP_VAR
    sta PPU_CTRL_VAR
    rts
