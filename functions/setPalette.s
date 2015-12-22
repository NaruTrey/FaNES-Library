.zeropage
.import PALETTE_UPDATE_VAR, TEMP_VAR

POINTER = TEMP_VAR
LENGTH = POINTER + 2

.code
.import popa, PALETTE_BUFFER_VAR

.export _setPalette
;void fastcall setPalette(const uchar *data);
_setPalette:
    sta <POINTER
    stx <POINTER + 1
    ldx #$00
    lda #$20
paletteCopy:
    sta <LENGTH
    ldy #$00
@0:
    lda (POINTER), y
    sta PALETTE_BUFFER_VAR, x
    inx
    iny
    dec <LENGTH
    bne @0
    inc <PALETTE_UPDATE_VAR
    rts


.export _setPaletteBackground
;void fastcall setPaletteBackground(const uchar *data);
_setPaletteBackground:
    sta <POINTER
    stx <POINTER + 1
    ldx #$00
    lda #$10
    bne paletteCopy


.export _setPaletteColor
;void fastcall setPaletteColor(uchar index, uchar color);
_setPaletteColor:
    sta <POINTER
    jsr popa
    and #$1f
    tax
    lda <POINTER
    sta PALETTE_BUFFER_VAR, x
    inc <PALETTE_UPDATE_VAR
    rts


.export _setPaletteSprites
;void fastcall setPaletteSprites(const uchar *data);
_setPaletteSprites:
    sta <POINTER
    stx <POINTER + 1
    ldx #$10
    txa
    bne paletteCopy
