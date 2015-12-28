.code
.importzp PAD_STATE_CHECK_VAR, PAD_STATET_VAR
.import _padPool

.export _padPush
;uchar fastcall padPush(uchar port);
_padPush:
    ldy #0
    cpy PAD_STATE_CHECK_VAR
    bne @1
    inc PAD_STATE_CHECK_VAR
    pha
    jsr _padPool
    pla
@1:
    tax
    lda PAD_STATET_VAR, x
    rts

