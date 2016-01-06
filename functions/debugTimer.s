.code
.import DEBUG_TIMER0_START, DEBUG_TIMER1_START, DEBUG_TIMER2_START
.import DEBUG_TIMER3_START, DEBUG_TIMER4_START, DEBUG_TIMER5_START
.import DEBUG_TIMER6_START, DEBUG_TIMER7_START, DEBUG_TIMER8_START
.import DEBUG_TIMER9_START, DEBUG_TIMERA_START, DEBUG_TIMERB_START
.import DEBUG_TIMERC_START, DEBUG_TIMERD_START, DEBUG_TIMERE_START
.import DEBUG_TIMERF_START
.import DEBUG_TIMER0_STOP, DEBUG_TIMER1_STOP, DEBUG_TIMER2_STOP
.import DEBUG_TIMER3_STOP, DEBUG_TIMER4_STOP, DEBUG_TIMER5_STOP
.import DEBUG_TIMER6_STOP, DEBUG_TIMER7_STOP, DEBUG_TIMER8_STOP
.import DEBUG_TIMER9_STOP, DEBUG_TIMERA_STOP, DEBUG_TIMERB_STOP
.import DEBUG_TIMERC_STOP, DEBUG_TIMERD_STOP, DEBUG_TIMERE_STOP
.import DEBUG_TIMERF_STOP

.export _startDebugTimer0
;void fastcall startDebugTimer0(void);
_startDebugTimer0:
    sta DEBUG_TIMER0_START
    rts


.export _startDebugTimer1
;void fastcall startDebugTimer1(void);
_startDebugTimer1:
    sta DEBUG_TIMER1_START
    rts


.export _startDebugTimer2
;void fastcall startDebugTimer2(void);
_startDebugTimer2:
    sta DEBUG_TIMER2_START
    rts


.export _startDebugTimer3
;void fastcall startDebugTimer3(void);
_startDebugTimer3:
    sta DEBUG_TIMER3_START
    rts


.export _startDebugTimer4
;void fastcall startDebugTimer4(void);
_startDebugTimer4:
    sta DEBUG_TIMER4_START
    rts


.export _startDebugTimer5
;void fastcall startDebugTimer5(void);
_startDebugTimer5:
    sta DEBUG_TIMER5_START
    rts


.export _startDebugTimer6
;void fastcall startDebugTimer6(void);
_startDebugTimer6:
    sta DEBUG_TIMER6_START
    rts


.export _startDebugTimer7
;void fastcall startDebugTimer7(void);
_startDebugTimer7:
    sta DEBUG_TIMER7_START
    rts


.export _startDebugTimer8
;void fastcall startDebugTimer8(void);
_startDebugTimer8:
    sta DEBUG_TIMER8_START
    rts


.export _startDebugTimer9
;void fastcall startDebugTimer9(void);
_startDebugTimer9:
    sta DEBUG_TIMER9_START
    rts


.export _startDebugTimerA
;void fastcall startDebugTimerA(void);
_startDebugTimerA:
    sta DEBUG_TIMERA_START
    rts


.export _startDebugTimerB
;void fastcall startDebugTimerB(void);
_startDebugTimerB:
    sta DEBUG_TIMERB_START
    rts


.export _startDebugTimerC
;void fastcall startDebugTimerC(void);
_startDebugTimerC:
    sta DEBUG_TIMERC_START
    rts


.export _startDebugTimerD
;void fastcall startDebugTimerD(void);
_startDebugTimerD:
    sta DEBUG_TIMERD_START
    rts


.export _startDebugTimerE
;void fastcall startDebugTimerE(void);
_startDebugTimerE:
    sta DEBUG_TIMERE_START
    rts


.export _startDebugTimerF
;void fastcall startDebugTimerF(void);
_startDebugTimerF:
    sta DEBUG_TIMERF_START
    rts


.export _stopDebugTimer0
;void fastcall stopDebugTimer0(void);
_stopDebugTimer0:
    sta DEBUG_TIMER0_STOP
    rts


.export _stopDebugTimer1
;void fastcall stopDebugTimer1(void);
_stopDebugTimer1:
    sta DEBUG_TIMER1_STOP
    rts


.export _stopDebugTimer2
;void fastcall stopDebugTimer2(void);
_stopDebugTimer2:
    sta DEBUG_TIMER2_STOP
    rts


.export _stopDebugTimer3
;void fastcall stopDebugTimer3(void);
_stopDebugTimer3:
    sta DEBUG_TIMER3_STOP
    rts


.export _stopDebugTimer4
;void fastcall stopDebugTimer4(void);
_stopDebugTimer4:
    sta DEBUG_TIMER4_STOP
    rts


.export _stopDebugTimer5
;void fastcall stopDebugTimer5(void);
_stopDebugTimer5:
    sta DEBUG_TIMER5_STOP
    rts


.export _stopDebugTimer6
;void fastcall stopDebugTimer6(void);
_stopDebugTimer6:
    sta DEBUG_TIMER6_STOP
    rts


.export _stopDebugTimer7
;void fastcall stopDebugTimer7(void);
_stopDebugTimer7:
    sta DEBUG_TIMER7_STOP
    rts


.export _stopDebugTimer8
;void fastcall stopDebugTimer8(void);
_stopDebugTimer8:
    sta DEBUG_TIMER8_STOP
    rts


.export _stopDebugTimer9
;void fastcall stopDebugTimer9(void);
_stopDebugTimer9:
    sta DEBUG_TIMER9_STOP
    rts


.export _stopDebugTimerA
;void fastcall stopDebugTimerA(void);
_stopDebugTimerA:
    sta DEBUG_TIMERA_STOP
    rts


.export _stopDebugTimerB
;void fastcall stopDebugTimerB(void);
_stopDebugTimerB:
    sta DEBUG_TIMERB_STOP
    rts


.export _stopDebugTimerC
;void fastcall stopDebugTimerC(void);
_stopDebugTimerC:
    sta DEBUG_TIMERC_STOP
    rts


.export _stopDebugTimerD
;void fastcall stopDebugTimerD(void);
_stopDebugTimerD:
    sta DEBUG_TIMERD_STOP
    rts


.export _stopDebugTimerE
;void fastcall stopDebugTimerE(void);
_stopDebugTimerE:
    sta DEBUG_TIMERE_STOP
    rts


.export _stopDebugTimerF
;void fastcall stopDebugTimerF(void);
_stopDebugTimerF:
    sta DEBUG_TIMERF_STOP
    rts
