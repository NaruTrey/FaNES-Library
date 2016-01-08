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
.proc _startDebugTimer0
    sta DEBUG_TIMER0_START
    rts
.endproc

.export _startDebugTimer1
;void fastcall startDebugTimer1(void);
.proc _startDebugTimer1
    sta DEBUG_TIMER1_START
    rts
.endproc


.export _startDebugTimer2
;void fastcall startDebugTimer2(void);
.proc _startDebugTimer2
    sta DEBUG_TIMER2_START
    rts
.endproc


.export _startDebugTimer3
;void fastcall startDebugTimer3(void);
.proc _startDebugTimer3
    sta DEBUG_TIMER3_START
    rts
.endproc


.export _startDebugTimer4
;void fastcall startDebugTimer4(void);
.proc _startDebugTimer4
    sta DEBUG_TIMER4_START
    rts
.endproc


.export _startDebugTimer5
;void fastcall startDebugTimer5(void);
.proc _startDebugTimer5
    sta DEBUG_TIMER5_START
    rts
.endproc


.export _startDebugTimer6
;void fastcall startDebugTimer6(void);
.proc _startDebugTimer6
    sta DEBUG_TIMER6_START
    rts
.endproc


.export _startDebugTimer7
;void fastcall startDebugTimer7(void);
.proc _startDebugTimer7
    sta DEBUG_TIMER7_START
    rts
.endproc


.export _startDebugTimer8
;void fastcall startDebugTimer8(void);
.proc _startDebugTimer8
    sta DEBUG_TIMER8_START
    rts
.endproc


.export _startDebugTimer9
;void fastcall startDebugTimer9(void);
.proc _startDebugTimer9
    sta DEBUG_TIMER9_START
    rts
.endproc


.export _startDebugTimerA
;void fastcall startDebugTimerA(void);
.proc _startDebugTimerA
    sta DEBUG_TIMERA_START
    rts
.endproc


.export _startDebugTimerB
;void fastcall startDebugTimerB(void);
.proc _startDebugTimerB
    sta DEBUG_TIMERB_START
    rts
.endproc


.export _startDebugTimerC
;void fastcall startDebugTimerC(void);
.proc _startDebugTimerC
    sta DEBUG_TIMERC_START
    rts
.endproc


.export _startDebugTimerD
;void fastcall startDebugTimerD(void);
.proc _startDebugTimerD
    sta DEBUG_TIMERD_START
    rts
.endproc


.export _startDebugTimerE
;void fastcall startDebugTimerE(void);
.proc _startDebugTimerE
    sta DEBUG_TIMERE_START
    rts
.endproc


.export _startDebugTimerF
;void fastcall startDebugTimerF(void);
.proc _startDebugTimerF
    sta DEBUG_TIMERF_START
    rts
.endproc


.export _stopDebugTimer0
;void fastcall stopDebugTimer0(void);
.proc _stopDebugTimer0
    sta DEBUG_TIMER0_STOP
    rts
.endproc


.export _stopDebugTimer1
;void fastcall stopDebugTimer1(void);
.proc _stopDebugTimer1
    sta DEBUG_TIMER1_STOP
    rts
.endproc


.export _stopDebugTimer2
;void fastcall stopDebugTimer2(void);
.proc _stopDebugTimer2
    sta DEBUG_TIMER2_STOP
    rts
.endproc


.export _stopDebugTimer3
;void fastcall stopDebugTimer3(void);
.proc _stopDebugTimer3
    sta DEBUG_TIMER3_STOP
    rts
.endproc


.export _stopDebugTimer4
;void fastcall stopDebugTimer4(void);
.proc _stopDebugTimer4
    sta DEBUG_TIMER4_STOP
    rts
.endproc


.export _stopDebugTimer5
;void fastcall stopDebugTimer5(void);
.proc _stopDebugTimer5
    sta DEBUG_TIMER5_STOP
    rts
.endproc


.export _stopDebugTimer6
;void fastcall stopDebugTimer6(void);
.proc _stopDebugTimer6
    sta DEBUG_TIMER6_STOP
    rts
.endproc


.export _stopDebugTimer7
;void fastcall stopDebugTimer7(void);
.proc _stopDebugTimer7
    sta DEBUG_TIMER7_STOP
    rts
.endproc


.export _stopDebugTimer8
;void fastcall stopDebugTimer8(void);
.proc _stopDebugTimer8
    sta DEBUG_TIMER8_STOP
    rts
.endproc


.export _stopDebugTimer9
;void fastcall stopDebugTimer9(void);
.proc _stopDebugTimer9
    sta DEBUG_TIMER9_STOP
    rts
.endproc


.export _stopDebugTimerA
;void fastcall stopDebugTimerA(void);
.proc _stopDebugTimerA
    sta DEBUG_TIMERA_STOP
    rts
.endproc


.export _stopDebugTimerB
;void fastcall stopDebugTimerB(void);
.proc _stopDebugTimerB
    sta DEBUG_TIMERB_STOP
    rts
.endproc


.export _stopDebugTimerC
;void fastcall stopDebugTimerC(void);
.proc _stopDebugTimerC
    sta DEBUG_TIMERC_STOP
    rts
.endproc


.export _stopDebugTimerD
;void fastcall stopDebugTimerD(void);
.proc _stopDebugTimerD
    sta DEBUG_TIMERD_STOP
    rts
.endproc


.export _stopDebugTimerE
;void fastcall stopDebugTimerE(void);
.proc _stopDebugTimerE
    sta DEBUG_TIMERE_STOP
    rts
.endproc


.export _stopDebugTimerF
;void fastcall stopDebugTimerF(void);
.proc _stopDebugTimerF
    sta DEBUG_TIMERF_STOP
    rts
.endproc
