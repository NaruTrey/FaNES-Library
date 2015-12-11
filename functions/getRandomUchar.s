.segment "ZEROPAGE"
RAND_SEED: .res 4

.segment "CODE"
.export _getRandomUchar
;uchar fastcall getRandomUchar(void);
_getRandomUchar:
    lda RAND_SEED
    rol a
    rol a
    eor #$41
    rol a   
    rol a   
    eor #$93
    adc <RAND_SEED + 1
    sta <RAND_SEED
    rol a
    rol a
    eor #$12
    rol a   
    rol a   
    adc <RAND_SEED + 2
    sta <RAND_SEED + 1
    adc RAND_SEED
    inc <RAND_SEED + 2
    bne @1
    pha 
    lda <RAND_SEED + 3
    clc 
    adc #$1D
    sta <RAND_SEED + 3
    pla
@1:
    eor <RAND_SEED + 3
    rts
