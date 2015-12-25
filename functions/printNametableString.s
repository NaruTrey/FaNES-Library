.zeropage
.import TEMP_VAR

TILE_INDEX_VAR = TEMP_VAR   ; word

.code
.import popax, PPU_ADDR, PPU_DATA

.export _printNametableString
;void fastcall printNametableString(uint coordinates, uchar *string);
_printNametableString:
    sta TILE_INDEX_VAR
    stx TILE_INDEX_VAR + 1
    jsr popax
    stx PPU_ADDR
    sta PPU_ADDR
    ldy #0
@1:
    lda (TILE_INDEX_VAR), y
    beq @2
    sta PPU_DATA
    iny
    bne @1
@2:
    rts
