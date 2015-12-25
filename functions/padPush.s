.code
.importzp PAD_STATET_VAR
.import _padPool

.export _padPush
;uchar fastcall padPush(uchar port);
_padPush:
    pha
    jsr _padPool
    pla
    tax
    lda PAD_STATET_VAR, x
    rts

