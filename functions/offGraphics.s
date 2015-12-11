.segment "ZEROPAGE"
.import PPU_MASK_VAR

.segment "CODE"
.import _waitFrame

.export _offGraphics
;void fastcall offGraphics(void);
_offGraphics:
	lda <PPU_MASK_VAR
	and #%11100111
	sta <PPU_MASK_VAR
	jmp _waitFrame
