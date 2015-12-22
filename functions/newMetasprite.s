.zeropage
.import sp, TEMP_VAR

POINTER = TEMP_VAR
SCROLL_X = POINTER + 2
SCROLL_Y = SCROLL_X + 1

.code
.import OAM_BUFFER_VAR

.export _newMetasprite
;uchar fastcall newMetasprite(uchar x, uchar y, uchar spriteID, const uchar *data);
_newMetasprite:
    sta <POINTER
    stx <POINTER + 1
    ldy #2
    lda (sp), y
    dey
    sta <SCROLL_X
    lda (sp), y
    dey
    sta <SCROLL_Y
    lda (sp), y
    tax
@1:
    lda (POINTER), y
    cmp #$80
    beq @2
    iny
    clc
    adc <SCROLL_X
    sta OAM_BUFFER_VAR + 3, x
    lda (POINTER), y
    iny
    clc
    adc <SCROLL_Y
    sta OAM_BUFFER_VAR + 0, x
    lda (POINTER), y
    iny
    sta OAM_BUFFER_VAR + 1, x
    lda (POINTER), y
    iny
    sta OAM_BUFFER_VAR + 2, x
    inx
    inx
    inx
    inx
    jmp @1
@2:
    lda <sp
    adc #2
    sta <sp
    bcc @3
    inc <sp + 1
@3:
    txa
    rts
