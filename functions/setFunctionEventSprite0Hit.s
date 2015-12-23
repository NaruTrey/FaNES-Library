.code
.importzp TEMP_VAR, PPU_CTRL_VAR
.import pushax, callax, popa, PPU_SCROLL, PPU_STATUS, PPU_CTRL

.export _setFunctionEventSprite0Hit
;void fastcall setFunctionEventSprite0Hit(void *function);
_setFunctionEventSprite0Hit:
@1:
    bit PPU_STATUS
    bvs @1
@2:
    bit PPU_STATUS
    bvc @2
    sta     TEMP_VAR
    stx     TEMP_VAR + 1
    jmp     (TEMP_VAR)
