.zeropage
.import TEMP_VAR, PPU_CTRL_VAR, PPU_SCROLL_X_VAR, PPU_SCROLL_Y_VAR

SX_VAR = TEMP_VAR
SY_VAR = TEMP_VAR + 1

.code
.import popa, popax, pushax, tosudiva0, tosumoda0, PPU_SCROLL, PPU_ADDR
.import PPU_CTRL

.export _setBackgroundScrollForce
;void fastcall setBackgroundScrollForce(uchar x, uchar y);
_setBackgroundScrollForce:
    sta <SY_VAR
    jsr popa
    sta <SX_VAR
    lda <PPU_CTRL_VAR
    and #%00000011
    sta PPU_ADDR
    lda <SY_VAR
    sta PPU_SCROLL
    asl
    asl
    and #%11100000
    ldx <SX_VAR
    sta <TEMP_VAR
    txa
    lsr
    lsr
    lsr
    ora <TEMP_VAR
    stx PPU_SCROLL
    sta PPU_ADDR
    rts
