.if .defined(PALETTE_BRIGHT)
.else
.end
.endif

.CODE
.importzp PALETTE_BACKGROUND_POINTER_VAR, PALETTE_SPRITES_POINTER_VAR
.importzp PALETTE_UPDATE_VAR

.export paletteBrightTableL, paletteBrightTableH

.export _setPaletteBackgroundBright
;void fastcall setPaletteBackgroundBright(uchar level);
_setPaletteBackgroundBright:
	tax
	lda paletteBrightTableL, x
	sta <PALETTE_BACKGROUND_POINTER_VAR
	lda paletteBrightTableH, x
	sta <PALETTE_BACKGROUND_POINTER_VAR + 1
	sta <PALETTE_UPDATE_VAR
	rts

.export _setPaletteSpritesBright
;void fastcall setPaletteSpritesBright(uchar level);
_setPaletteSpritesBright:
	tax
	lda paletteBrightTableL, x
	sta <PALETTE_SPRITES_POINTER_VAR
	lda paletteBrightTableH, x
	sta <PALETTE_SPRITES_POINTER_VAR + 1
	sta <PALETTE_UPDATE_VAR
	rts

.export _setPaletteBright
;void fastcall setPaletteBright(uchar level);
_setPaletteBright:
    tax
	lda paletteBrightTableL, x
	sta <PALETTE_BACKGROUND_POINTER_VAR
    sta <PALETTE_SPRITES_POINTER_VAR
	lda paletteBrightTableH, x
	sta <PALETTE_BACKGROUND_POINTER_VAR + 1
    sta <PALETTE_SPRITES_POINTER_VAR + 1
	sta <PALETTE_UPDATE_VAR
    rts

.RODATA
paletteBrightTableL:
	.byte <paletteBrightTable0, <paletteBrightTable1, <paletteBrightTable2
	.byte <paletteBrightTable3, <paletteBrightTable4, <paletteBrightTable5
	.byte <paletteBrightTable6, <paletteBrightTable7, <paletteBrightTable8

paletteBrightTableH:
	.byte >paletteBrightTable0, >paletteBrightTable1, >paletteBrightTable2
	.byte >paletteBrightTable3, >paletteBrightTable4, >paletteBrightTable5
	.byte >paletteBrightTable6, >paletteBrightTable7, >paletteBrightTable8

paletteBrightTable0:
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
paletteBrightTable1:
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
paletteBrightTable2:
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
paletteBrightTable3:
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
paletteBrightTable4:
	.byte $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0F, $0F, $0F
paletteBrightTable5:
	.byte $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $00, $00, $00
paletteBrightTable6:
	.byte $10, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $10, $10, $10
paletteBrightTable7:
	.byte $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $20, $20, $20
paletteBrightTable8:
	.byte $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30
	.byte $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30
	.byte $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30
	.byte $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30
