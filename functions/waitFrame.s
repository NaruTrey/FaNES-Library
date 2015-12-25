.code
.importzp FRAME_WAIT_VAR, FRAME_CNT_VAR
.import PPU_ADDR

.export _waitFrame
;void fastcall waitFrame(void);
_waitFrame:
    lda #1
    sta FRAME_WAIT_VAR
    lda FRAME_CNT_VAR
@1:
    cmp FRAME_CNT_VAR
    nop
    beq @1
    rts

