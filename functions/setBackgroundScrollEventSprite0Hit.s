.zeropage
.import TEMP_VAR, PPU_CTRL_VAR

SX_VAR = TEMP_VAR
SY_VAR = TEMP_VAR + 1
ADDR1_VAR = SY_VAR + 1
ADDR2_VAR = ADDR1_VAR + 1

.code
.import popa, PPU_STATUS, PPU_SCROLL, PPU_ADDR

.export _setBackgroundScrollEventSprite0Hit
;void fastcall setBackgroundScrollEventSprite0Hit(uchar x, uchar y);
_setBackgroundScrollEventSprite0Hit:
    sta <SY_VAR
    jsr popa
    sta <SX_VAR
    lda <PPU_CTRL_VAR
    and #%00000011
    sta <ADDR1_VAR
    lda <SY_VAR
    asl
    asl
    and #%11100000
    sta <ADDR2_VAR
    lda <SX_VAR
    lsr
    lsr
    lsr
    ora <ADDR2_VAR
    sta <ADDR2_VAR
    ldx <SX_VAR
    ldy <SY_VAR
    lda <ADDR1_VAR
@1:
    bit PPU_STATUS
    bvs @1
@2:
    bit PPU_STATUS
    bvc @2
    sta PPU_ADDR
    sty PPU_SCROLL
    stx PPU_SCROLL
    lda <ADDR2_VAR
    sta PPU_ADDR
    rts
