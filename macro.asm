;-------------------------------------
  .MACRO ROLW
     ROL :1
     ROL :1+1
  .ENDM
;-------------------------------------
  .MACRO ASLW
    ASL :1
    ROL :1+1
  .ENDM
;-------------------------------------
  .MACRO RORW
    ROR :1+1
    ROR :1
  .ENDM
;-------------------------------------
  .MACRO LSRW
    LSR :1+1
    ROR :1
  .ENDM

;-------------------------------------
.MACRO VMAIN ;	Initialises Vertical Blank Interrupts
	;       (works only with system interrupts ON)
         
	;	VMAIN #WORD interrupt.vector
    ; interrupt.vector:
    ;    0 - VIMIRQ
    ;    1 - TIMCNT1
    ;    2 - TIMCNT2
    ;    3 - TIMCNT3
    ;    4 - TIMCNT4
    ;    5 - TIMCNT5
    ;    6 - VVBLKI
    ;    7 - VVBLKD
    ;    8 - TIMVEC1
    ;    9 - TIMVEC2
         LDY # <:1
         LDX # >:1
         LDA #:2
         JSR SETVBV
.ENDM
;-------------------------------------
         .MACRO VDLI
;	VDLI #WORD
;	Initialises Display List Interrupts
         LDY # <:1
         LDX # >:1
         LDA #$C0
         STY $0200
         STX $0201
         STA NMIEN
         .ENDM
;-------------------------------------
      .MACRO halt
?stop  
      .if :1
	      lda RANDOM 
	      and #:1
	      sta COLBAK
      .endif
      jmp ?stop
      .ENDM
;-------------------------------------
         .MACRO KEY
;	KEY
;	waits for releasing and pressing "any key"
;   with OS on autorepeat works
         PHA
?CK1      LDA SKSTAT
         AND #$04
         BEQ ?CK1
?CK       LDA SKSTAT
         AND #$04
         BNE ?CK
         PLA
         .ENDM
;-------------------------------------
	.MACRO WAIT	;waits one frame (1/50 s(PAL) or 1/60s(NTSC))
	;uses: A
		LDA VCOUNT
		STA WSYNC
		STA WSYNC
		STA WSYNC
@		CMP VCOUNT
		BNE @-
	.ENDM
;-------------------------------------
    .macro negw
    ; negate the given word (0-a)
;-------------------------------------
        sec
        lda #$00
        sbc :1
        sta :1
        lda #$00
        sbc :1+1
        sta :1+1
    .endm
;-------------------------------------
    .macro randomize     ;returns (in A) a random .byte between "floor" (incl) and "ceiling" (excl)
    ;usage: randomize floor ceiling AND
    ;uses: A
    
?rand
      lda random
      .if :3
      	and #:3
      .endif
      cmp #:1 		;floor
      bcc ?rand
      cmp #:2+1 	;ceiling
      bcs ?rand
    .endm
;-------------------------------------
    .macro phx
      txa
      pha
    .endm
;-------------------------------------
    .macro phy
      tya
      pha
    .endm
;-------------------------------------
    .macro plx
      pla
      tax
    .endm
;-------------------------------------
    .macro ply
      pla
      tay
    .endm
;-------------------------------------
	.macro pause	;waits :1 number (byte) of frames 
	;uses: AX
	.if :1 > 0 
		ldx #:1
loop   	wait
      	dex
      	bne loop
     .else
     	wait
     .endif
    .ENDM

