.code
.importzp TEMP_VAR
.import PPU_STATUS

.export _setFunctionEventSprite0Hit
;void fastcall setFunctionEventSprite0Hit(void *function);
_setFunctionEventSprite0Hit:
@1:
    bit PPU_STATUS
    bvs @1
@2:
    bit PPU_STATUS
    bvc @2
    sta TEMP_VAR
    stx TEMP_VAR + 1
    jmp (TEMP_VAR)
