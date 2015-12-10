.segment "ZEROPAGE"
.import sp, TEMP_VAR
POINTER = TEMP_VAR
SCROLL_X = POINTER + 2
SCROLL_Y = SCROLL_X + 1

.segment "CODE"
.import OAM_BUFFER_VAR

.export _setMetaspritePosition
;uchar fastcall setMetaspritePosition(uchar x, uchar y, uchar spriteID, const uchar *data);
_setMetaspritePosition:
	sta <POINTER
	stx <POINTER + 1
	ldy #2		;three popa calls replacement, performed in reversed order
	lda (sp), y
	dey
	sta <SCROLL_X
	lda (sp), y
	dey
	sta <SCROLL_Y
	lda (sp), y
	tax
@1:
	lda (POINTER), y		;x offset
	cmp #$80
	beq @2
	iny
	clc
	adc <SCROLL_X
	sta OAM_BUFFER_VAR + 3, x
	lda (POINTER), y		;y offset
	iny
	clc
	adc <SCROLL_Y
	sta OAM_BUFFER_VAR + 0, x
	iny
	iny
	inx
	inx
	inx
	inx
	jmp @1
@2:
	lda <sp
	adc #2			;carry is always set here, so it adds 3
	sta <sp
	bcc @3
	inc <sp + 1
@3:
	txa
	rts
