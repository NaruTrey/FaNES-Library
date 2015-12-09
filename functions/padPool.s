.segment "ZEROPAGE"
.import TEMP_VAR, PAD_STATE_VAR, PAD_STATET_VAR, PAD_STATEP_VAR
PAD_BUFFER = TEMP_VAR + 2

.segment "CODE"
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
	sta <TEMP_VAR
@padPollLoop:
	lda CTRL_PORT1, y
	lsr a
	ror <PAD_BUFFER, x
	dec <TEMP_VAR
	bne @padPollLoop
	inx
	cpx #3
	bne @padPollPort
	lda <PAD_BUFFER
	cmp <PAD_BUFFER + 1
	beq @done
	cmp <PAD_BUFFER + 2
	beq @done
	lda <PAD_BUFFER + 1
@done:
	sta <PAD_STATE_VAR, y
	tax
	eor <PAD_STATEP_VAR, y
	and <PAD_STATE_VAR, y
	sta <PAD_STATET_VAR, y
	txa
	sta <PAD_STATEP_VAR, y
	rts
