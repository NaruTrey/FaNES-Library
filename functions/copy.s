.segment "ZEROPAGE"
.import TEMP_VAR
LENGTH = TEMP_VAR
SOURCE = LENGTH + 2
DESTINATION = SOURCE + 2

.segment "CODE"
.import popax

.export _copy
;void fastcall copy(void * destination, void *source, uint length);
_copy:
	sta <LENGTH
	stx <LENGTH + 1
	jsr popax
	sta <SOURCE
	stx <SOURCE + 1
	jsr popax
	sta <DESTINATION
	stx <DESTINATION + 1
	ldx #0
@1:
	lda <LENGTH + 1
	beq @2
	jsr @3
	dec <LENGTH + 1
	inc <SOURCE + 1
	inc <DESTINATION + 1
	jmp @1
@2:
	ldx <LENGTH
	beq @5
@3:
	ldy #0
@4:
	lda (SOURCE), y
	sta (DESTINATION), y
	iny
	dex
	bne @4
@5:
	rts
