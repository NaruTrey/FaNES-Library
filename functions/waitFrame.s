.segment "ZEROPAGE"
.import FRAME_WAIT_VAR, FRAME_CNT_VAR

.segment "CODE"

.export _waitFrame
;void fastcall waitFrame(void);
_waitFrame:
	lda #1
	sta <FRAME_WAIT_VAR
	lda <FRAME_CNT_VAR
@1:
    nop
	cmp <FRAME_CNT_VAR
	beq @1
	rts
	
