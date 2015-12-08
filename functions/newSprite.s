.segment "ZEROPAGE"
.import sp

.segment "CODE"
.import OAM_BUFFER_VAR

.export _newSprite
;uchar fastcall newSprite(uchar x, uchar y, uchar charaster, uchar attributes, uchar spriteID);
_newSprite:
	tax
	ldy #0		;four popa calls replacement
	lda (sp), y
	iny
	sta OAM_BUFFER_VAR + 2, x
	lda (sp), y
	iny
	sta OAM_BUFFER_VAR + 1, x
	lda (sp), y
	iny
	sta OAM_BUFFER_VAR + 0, x
	lda (sp), y
	sta OAM_BUFFER_VAR + 3, x
	lda <sp
	clc
	adc #4
	sta <sp
	bcc @1
	inc <sp + 1
@1:
	txa
	clc
	adc #4
	rts
