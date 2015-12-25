.zeropage

RAND_SEED_VAR: .res 4

.code

.export _getRandomUchar
;uchar fastcall getRandomUchar(void);
_getRandomUchar:
    lda RAND_SEED_VAR
    rol a
    rol a
    eor #%01000001
    rol a
    rol a
    eor #%10010011
    adc RAND_SEED_VAR + 1
    sta RAND_SEED_VAR
    rol a
    rol a
    eor #%00010010
    rol a
    rol a
    adc RAND_SEED_VAR + 2
    sta RAND_SEED_VAR + 1
    adc RAND_SEED_VAR
    inc RAND_SEED_VAR + 2
    bne @1
    pha
    lda RAND_SEED_VAR + 3
    clc
    adc #%00011101
    sta RAND_SEED_VAR + 3
    pla
@1:
    eor RAND_SEED_VAR + 3
    rts
