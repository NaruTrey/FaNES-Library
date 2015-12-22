.code
.importzp PPU_MASK_VAR
.import _waitFrame

.export _onGraphics
;void fastcall onGraphics(void);
_onGraphics:
    lda <PPU_MASK_VAR
    ora #%00011000
    sta <PPU_MASK_VAR
    jmp _waitFrame
