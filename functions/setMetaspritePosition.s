.zeropage
.import sp, TEMP_VAR

POINTER_VAR = TEMP_VAR
SCROLL_X_VAR = POINTER_VAR + 2
SCROLL_Y_VAR = SCROLL_X_VAR + 1

.code
.import OAM_BUFFER_VAR

.export _setMetaspritePosition
;uchar fastcall setMetaspritePosition(uchar x, uchar y, uchar spriteID, const uchar *data);
_setMetaspritePosition:
    sta POINTER_VAR
    stx POINTER_VAR + 1
    ldy #2
    lda (sp), y
    dey
    sta SCROLL_X_VAR
    lda (sp), y
    dey
    sta SCROLL_Y_VAR
    lda (sp), y
    tax
@1:
    lda (POINTER_VAR), y
    cmp #$80
    beq @2
    iny
    clc
    adc SCROLL_X_VAR
    sta OAM_BUFFER_VAR + 3, x
    lda (POINTER_VAR), y
    iny
    clc
    adc SCROLL_Y_VAR
    sta OAM_BUFFER_VAR + 0, x
    iny
    iny
    inx
    inx
    inx
    inx
    jmp @1
@2:
    lda sp
    adc #2
    sta sp
    bcc @3
    inc sp + 1
@3:
    txa
    rts
