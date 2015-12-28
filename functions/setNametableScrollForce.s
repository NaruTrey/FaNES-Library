.zeropage
.import TEMP_VAR, PPU_CTRL_VAR, PPU_SCROLL_X_VAR, PPU_SCROLL_Y_VAR

SX_VAR = TEMP_VAR + 1
SY_VAR = TEMP_VAR + 3

.code
.import popa, popax, pushax, tosudiva0, tosumoda0, PPU_SCROLL, PPU_ADDR
.import PPU_CTRL

.export _setBackgroundScrollForce
;void fastcall setBackgroundScrollForce(uchar x, uchar y);
_setBackgroundScrollForce:
    sta SY_VAR
    jsr popa
    sta SX_VAR
    lda PPU_CTRL_VAR
    and #%00000011
    sta PPU_ADDR
    lda SY_VAR
    sta PPU_SCROLL
    asl
    asl
    and #%11100000
    ldx SX_VAR
    sta TEMP_VAR
    txa
    lsr
    lsr
    lsr
    ora TEMP_VAR
    stx PPU_SCROLL
    sta PPU_ADDR
    rts


.export _setBackgroundScrollForceI
;void fastcall setBackgroundScrollForceI(uint x, uint y);
_setBackgroundScrollForceI:
    jsr pushax
    jsr pushax
    lda #$F0
    jsr tosumoda0
    sta SY_VAR
    stx SY_VAR + 1
    jsr popax
    jsr pushax
    lda #$F0
    jsr tosudiva0
    and #%00000001
    asl a
    sta TEMP_VAR
    jsr popax
    sta SX_VAR
    stx SX_VAR + 1
    txa
    and #%00000001
    adc TEMP_VAR
    rol
    rol
    sta PPU_ADDR
    lda SY_VAR
    sta PPU_SCROLL
    asl
    asl
    and #%11100000
    ldx SX_VAR
    sta TEMP_VAR
    txa
    lsr
    lsr
    lsr
    ora TEMP_VAR
    stx PPU_SCROLL
    sta PPU_ADDR
    rts
