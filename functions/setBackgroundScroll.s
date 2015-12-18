.segment "ZEROPAGE"
.import TEMP_VAR, PPU_SCROLL_X_VAR, PPU_SCROLL_Y_VAR

.segment "CODE"
.import popa

.export _setBackgroundScroll
;void fastcall setBackgroundScroll(uchar x, uchar y);
_setBackgroundScroll:
    sta <PPU_SCROLL_Y_VAR
    jsr popa
    sta <PPU_SCROLL_X_VAR
    rts


.export _setBackgroundScrollX
;void fastcall setBackgroundScrollX(uchar x);
_setBackgroundScrollX:
    sta <PPU_SCROLL_X_VAR
    rts


.export _setBackgroundScrollY
;void fastcall setBackgroundScrollY(uchar y);
_setBackgroundScrollY:
    sta <PPU_SCROLL_Y_VAR
    rts
