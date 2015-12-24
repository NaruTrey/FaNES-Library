.zeropage
.import TEMP_VAR, PPU_CTRL_VAR

SX = TEMP_VAR
SY = TEMP_VAR + 1
ADDR1 = SY + 1
ADDR2 = ADDR1 + 1

.code
.import popa, PPU_STATUS, PPU_SCROLL, PPU_ADDR

.export _setBackgroundScrollEventSprite0Hit
;void fastcall setBackgroundScrollEventSprite0Hit(uchar x, uchar y);
_setBackgroundScrollEventSprite0Hit:
    sta <SY
    jsr popa
    sta <SX
    lda <PPU_CTRL_VAR
    and #%00000011
    sta <ADDR1
    lda <SY
    asl
    asl
    and #%11100000
    sta <ADDR2
    lda <SX
    lsr
    lsr
    lsr
    ora <ADDR2
    sta <ADDR2
    ldx <SX
    ldy <SY
    lda <ADDR1
@1:
    bit PPU_STATUS
    bvs @1
@2:
    bit PPU_STATUS
    bvc @2
    sta PPU_ADDR
    sty PPU_SCROLL
    stx PPU_SCROLL
    lda <ADDR2
    sta PPU_ADDR
    rts
