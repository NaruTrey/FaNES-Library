.zeropage
.import TEMP_VAR, PAD_STATE_VAR, PAD_STATET_VAR, PAD_STATEP_VAR

PAD_BUFFER_VAR = TEMP_VAR + 2

.code
.import CTRL_PORT1

.export _padPool
;uchar fastcall padPool(uchar port);
_padPool:
    tay
    ldx #0
@padPollPort:
    lda #1
    sta CTRL_PORT1
    lda #0
    sta CTRL_PORT1
    lda #8
    sta TEMP_VAR
@padPollLoop:
    lda CTRL_PORT1, y
    lsr a
    ror PAD_BUFFER_VAR, x
    dec TEMP_VAR
    bne @padPollLoop
    inx
    cpx #3
    bne @padPollPort
    lda PAD_BUFFER_VAR
    cmp PAD_BUFFER_VAR + 1
    beq @done
    cmp PAD_BUFFER_VAR + 2
    beq @done
    lda PAD_BUFFER_VAR + 1
@done:
    sta PAD_STATE_VAR, y
    tax
    eor PAD_STATEP_VAR, y
    and PAD_STATE_VAR, y
    sta PAD_STATET_VAR, y
    txa
    sta PAD_STATEP_VAR, y
    rts
