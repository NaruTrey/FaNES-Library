.zeropage
.import TEMP_VAR

LENGTH_VAR = TEMP_VAR
SOURCE_VAR = LENGTH_VAR + 2
DESTINATION_VAR = SOURCE_VAR + 2

.code
.import popax

.export _copy
;void fastcall copy(void * DESTINATION_VAR, void *SOURCE_VAR, uint LENGTH_VAR);
_copy:
    sta LENGTH_VAR
    stx LENGTH_VAR + 1
    jsr popax
    sta SOURCE_VAR
    stx SOURCE_VAR + 1
    jsr popax
    sta DESTINATION_VAR
    stx DESTINATION_VAR + 1
    ldx #0
@1:
    lda LENGTH_VAR + 1
    beq @2
    jsr @3
    dec LENGTH_VAR + 1
    inc SOURCE_VAR + 1
    inc DESTINATION_VAR + 1
    jmp @1
@2:
    ldx LENGTH_VAR
    beq @5
@3:
    ldy #0
@4:
    lda (SOURCE_VAR), y
    sta (DESTINATION_VAR), y
    iny
    dex
    bne @4
@5:
    rts
