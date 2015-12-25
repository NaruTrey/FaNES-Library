.zeropage
.import TEMP_VAR

RLE_LOW_VAR = TEMP_VAR
RLE_HIGH_VAR = RLE_LOW_VAR + 1
RLE_TAG_VAR = RLE_HIGH_VAR + 2
RLE_BYTE_VAR = RLE_TAG_VAR + 3

.code
.import popax, PPU_ADDR, PPU_DATA

.export _unpackNametableRLE
;void fastcall unpackNametableRLE(uint nametable, const uchar *data);
_unpackNametableRLE:
    stx PPU_ADDR
    sta PPU_ADDR
    jsr popax
    tay
    stx RLE_HIGH_VAR
    lda #0
    sta RLE_LOW_VAR
    lda (RLE_LOW_VAR),y
    sta RLE_TAG_VAR
    iny
    bne @1
    inc RLE_HIGH_VAR
@1:
    lda (RLE_LOW_VAR),y
    iny
    bne @11
    inc RLE_HIGH_VAR
@11:
    cmp RLE_TAG_VAR
    beq @2
    sta PPU_DATA
    sta RLE_BYTE_VAR
    bne @1
@2:
    lda (RLE_LOW_VAR),y
    beq @4
    iny
    bne @21
    inc RLE_HIGH_VAR
@21:
    tax
    lda RLE_BYTE_VAR
@3:
    sta PPU_DATA
    dex
    bne @3
    beq @1
@4:
    rts
