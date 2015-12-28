.zeropage
.import TEMP_VAR, PPU_CTRL_VAR

SX_VAR = TEMP_VAR + 1
SY_VAR = TEMP_VAR + 3
ADDR1_VAR = SY_VAR + 5
ADDR2_VAR = ADDR1_VAR + 6

.code
.import popa, popax, pushax, tosudiva0, tosumoda0
.import PPU_STATUS, PPU_SCROLL, PPU_ADDR

.export _setBackgroundScrollEventSprite0Hit
;void fastcall setBackgroundScrollEventSprite0Hit(uchar x, uchar y);
_setBackgroundScrollEventSprite0Hit:
    sta SY_VAR
    jsr popa
    sta SX_VAR
    lda PPU_CTRL_VAR
    and #%00000011
    sta ADDR1_VAR
    lda SY_VAR
    asl
    asl
    and #%11100000
    sta ADDR2_VAR
    lda SX_VAR
    lsr
    lsr
    lsr
    ora ADDR2_VAR
    sta ADDR2_VAR
    ldx SX_VAR
    ldy SY_VAR
    lda ADDR1_VAR
@1:
    bit PPU_STATUS
    bvs @1
@2:
    bit PPU_STATUS
    bvc @2
    sta PPU_ADDR
    sty PPU_SCROLL
    stx PPU_SCROLL
    lda ADDR2_VAR
    sta PPU_ADDR
    rts


.export _setBackgroundScrollEventSprite0HitI
;void fastcall setBackgroundScrollEventSprite0HitI(uint x, uint y);
_setBackgroundScrollEventSprite0HitI:
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
    sta ADDR1_VAR
    lda SY_VAR
    asl
    asl
    and #%11100000
    sta ADDR2_VAR
    lda SX_VAR
    lsr
    lsr
    lsr
    ora ADDR2_VAR
    sta ADDR2_VAR
    ldx SX_VAR
    ldy SY_VAR
    lda ADDR1_VAR
@1:
    bit PPU_STATUS
    bvs @1
@2:
    bit PPU_STATUS
    bvc @2
    sta PPU_ADDR
    sty PPU_SCROLL
    stx PPU_SCROLL
    lda ADDR2_VAR
    sta PPU_ADDR
    rts
