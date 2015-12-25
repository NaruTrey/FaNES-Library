.zeropage
.import PALETTE_UPDATE_VAR, TEMP_VAR

POINTER_VAR = TEMP_VAR
LENGTH_VAR = POINTER_VAR + 2

.code
.import popa, PALETTE_BUFFER_VAR

.export _setPalette
;void fastcall setPalette(const uchar *data);
_setPalette:
    sta POINTER_VAR
    stx POINTER_VAR + 1
    ldx #$00
    lda #$20
paletteCopy:
    sta LENGTH_VAR
    ldy #$00
@0:
    lda (POINTER_VAR), y
    sta PALETTE_BUFFER_VAR, x
    inx
    iny
    dec LENGTH_VAR
    bne @0
    inc PALETTE_UPDATE_VAR
    rts


.export _setPaletteBackground
;void fastcall setPaletteBackground(const uchar *data);
_setPaletteBackground:
    sta POINTER_VAR
    stx POINTER_VAR + 1
    ldx #$00
    lda #$10
    bne paletteCopy


.export _setPaletteColor
;void fastcall setPaletteColor(uchar index, uchar color);
_setPaletteColor:
    sta POINTER_VAR
    jsr popa
    and #%00011111
    tax
    lda POINTER_VAR
    sta PALETTE_BUFFER_VAR, x
    inc PALETTE_UPDATE_VAR
    rts


.export _setPaletteSprites
;void fastcall setPaletteSprites(const uchar *data);
_setPaletteSprites:
    sta POINTER_VAR
    stx POINTER_VAR + 1
    ldx #$10
    txa
    bne paletteCopy
