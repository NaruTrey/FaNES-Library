.zeropage
.import TEMP_VAR

RLE_LOW = TEMP_VAR
RLE_HIGH = RLE_LOW + 1
RLE_TAG = RLE_HIGH + 2
RLE_BYTE = RLE_TAG + 3

.code
.import popax, PPU_ADDR, PPU_DATA

.export _unpackNametableRLE
;void fastcall unpackNametableRLE(uint nametable, const uchar *data);
_unpackNametableRLE:
    stx PPU_ADDR
    sta PPU_ADDR
    jsr popax
    tay
    stx <RLE_HIGH
    lda #0
    sta <RLE_LOW
    lda (RLE_LOW),y
    sta <RLE_TAG
    iny
    bne @1
    inc <RLE_HIGH
@1:
    lda (RLE_LOW),y
    iny
    bne @11
    inc <RLE_HIGH
@11:
    cmp <RLE_TAG
    beq @2
    sta PPU_DATA
    sta <RLE_BYTE
    bne @1
@2:
    lda (RLE_LOW),y
    beq @4
    iny
    bne @21
    inc <RLE_HIGH
@21:
    tax
    lda <RLE_BYTE
@3:
    sta PPU_DATA
    dex
    bne @3
    beq @1
@4:
    rts
