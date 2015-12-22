.code
.importzp sp
.import OAM_BUFFER_VAR

.export _setSpritePosition
;uchar fastcall setSpritePosition(uchar x, uchar y, uchar spriteID);
_setSpritePosition:
    tax
    ldy #0
    lda (sp), y
    iny
    sta OAM_BUFFER_VAR + 0, x
    lda (sp), y
    sta OAM_BUFFER_VAR + 3, x
    lda <sp
    clc
    adc #2
    sta <sp
    bcc @1
    inc <sp + 1
@1:
    rts
