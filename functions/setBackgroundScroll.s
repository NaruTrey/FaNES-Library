.code
.importzp TEMP_VAR, PPU_SCROLL_X_VAR, PPU_SCROLL_Y_VAR
.import popa, popax, pushax, tosumoda0, tosudiva0, _setNametableActive

.export _setBackgroundScrollI
;void fastcall setBackgroundScrollI(uint x, uint y);
_setBackgroundScrollI:
    jsr pushax
    jsr pushax
    lda #$F0
    jsr tosumoda0
    sta PPU_SCROLL_Y_VAR
    jsr popax
    jsr pushax
    lda #$F0
    jsr tosudiva0
    and #%00000001
    asl a
    sta TEMP_VAR
    jsr popax
    sta PPU_SCROLL_X_VAR
    txa
    and #%00000001
    adc TEMP_VAR
    jmp _setNametableActive


.export _setBackgroundScrollIX
;void fastcall setBackgroundScrollIX(uint x);
_setBackgroundScrollIX:
    sta PPU_SCROLL_X_VAR
    txa
    and #%00000001
    jmp _setNametableActive


.export _setBackgroundScrollIY
;void fastcall setBackgroundScrollIY(uint y);
_setBackgroundScrollIY:
    jsr pushax
    jsr pushax
    lda #$F0
    jsr tosumoda0
    sta PPU_SCROLL_Y_VAR
    jsr popax
    jsr pushax
    lda #$F0
    jsr tosudiva0
    and #%00000001
    asl a
    jmp _setNametableActive


.export _setBackgroundScroll
;void fastcall setBackgroundScroll(uchar x, uchar y);
_setBackgroundScroll:
    sta PPU_SCROLL_Y_VAR
    jsr popa
    sta PPU_SCROLL_X_VAR
    rts


.export _setBackgroundScrollX
;void fastcall setBackgroundScrollX(uchar x);
_setBackgroundScrollX:
    sta PPU_SCROLL_X_VAR
    rts


.export _setBackgroundScrollY
;void fastcall setBackgroundScrollY(uchar y);
_setBackgroundScrollY:
    sta PPU_SCROLL_Y_VAR
    rts
