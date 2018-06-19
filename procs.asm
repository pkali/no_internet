;	@com.wudsn.ide.asm.mainsourcefile=ni.asm

.proc dino 		; dino to the screen
	; uses: AXY tmp0 tmp1 tmp2 tmp3
	; Y - ypos in lines
	; X - dino phase (0,1,..)

	_dino = tmp 	; _underscore means pointer here and else
	_mask = tmp1    ; local vars for reusing zero page variables
	_scr  = tmp2
	_back = tmp3
	sty dino_save_y ;save for clearing
	; get line address offset
	lda scr_addrs_l,y
	sta _scr
	lda scr_addrs_h,y
	sta _scr+1
	; add x position (hardcoded, dino does not move)
	adw _scr #10
	;was: mwa #screen+10+96*sw scr_ ;10 = xpos, 96 == ypos on the screen
	
	lda dino_tab_l,x
	sta _dino
	lda dino_tab_h,x
	sta _dino+1

	lda dino_mask_tab_l,x
	sta _mask
	lda dino_mask_tab_h,x
	sta _mask+1
	
	mwa #dino_mask2 _mask
	mwa #dino_back _back
	ldx #24
loop1
	ldy #0
dn1	
	lda (_scr),y 	; get screen contents
	sta (_back),y 	; save background for sprite removal
	lda (_mask),y  	; mask
	eor #$ff 		; inverse, 'cause mads does not inverse OK with '*'
	and (_scr),y 	; get screen contents
	ora (_dino),y 
	sta (_scr),y
	iny
	cpy #3
	bne dn1
	adw _dino #3
	adw _mask #3
	adw _back #3
	adw _scr #sw
	dex
	bne loop1
	rts
.endp
;----------
.proc dino_clear 		; remove old dino
	; uses: AXY tmp2 tmp3
	_scr  = tmp2
	_back = tmp3
	ldy dino_save_y ;ypos 
	; get line address offset
	lda scr_addrs_l,y
	sta _scr
	lda scr_addrs_h,y
	sta _scr+1
	; add x position (hardcoded, dino does not move)
	adw _scr #10
	;mwa #screen+10+96*sw scr_ ;10 = xpos, 96 == ypos on the screen
	
	mwa #dino_back _back
	ldx #24
loop1
	ldy #0
dn1	
	lda (_back),y 	; give back background for sprite removal
	sta (_scr),y
	iny
	cpy #3
	bne dn1
	adw _back #3
	adw _scr #sw
	dex
	bne loop1
	rts
.endp
;----------
.proc ground 	; ground breaking, i.e. drawing
	; uses: AXY tmp1 tmp2
	; X: x on screen in words (2 bytes)
	; Y: ground tile number (0 - plain ground)
	_gnd = tmp1
	_scr = tmp2
	
	lda gnd_tab_l,y
	sta _gnd
	lda gnd_tab_h,y
	sta _gnd+1
	mwa #screen+112*sw _scr ;112 is ypos of ground level
	txa
	asl						  ;add X to xpos on screen
	clc
	adc _scr
	sta _scr
	scc
	inc _scr+1

	ldx #8 ; tile height in bytes
loop1
	ldy #0
@	
	lda  (_gnd),y
	sta  (_scr),y
	iny
	cpy #2 ; tile width in bytes
	bne @-
	adw _gnd #2
	adw _scr #sw 	;next screen line
	dex
	bne loop1
	; add some debris below

	ldx #6  ; debris height
loop2
	ldy #1
@
	lda RANDOM
:5	AND RANDOM
	sta (_scr),y
	dey
	bpl @-
	adw _scr #sw 	;next screen line
	dex
	bpl loop2
	
	rts
.endp
.proc ground_init ;draws first 48 segments of a ground
	mva #0 tmp
ground_loop
	lda tmp
	tax
	randomize 0 2 3
	tay
	jsr ground
	inc tmp
	lda tmp
	cmp #24  ; screen width in wide mode /2 
	bne ground_loop
	rts
.endp
;----------
.proc cactus 	; drawing cactii
	; uses: AXY tmp1 tmp2
	; X: x on screen in bytes
	; Y: cactus number
	; draws from bottom up, utilising the fact that .bmp is saved this way
    ; updt.: was not able to load .bmp files for unknown reason, so the pics are flipped with WUDSN script
	
	_cact = tmp1
	_scr = tmp2
	
	lda cact_tab_l,y
	sta _cact
	lda cact_tab_h,y
	sta _cact+1
	mwa #screen+122*sw _scr ;112 is ypos of bottom of the cactii
	txa
	clc
	adc _scr
	sta _scr
	bcc no_inc
	inc _scr+1
no_inc

	
	lda cact_widths,y
	sta cact_w ; width in bytes

	lda cact_heights,y
	tax
loop
	ldy #0
@
	lda  (_scr),y
	ora  (_cact),y
	sta  (_scr),y
	iny
	cpy cact_w 
	bne @-
	;adw _cact cact_w  ;!!!DOES NOT WORK :(((((
	clc
	lda cact_w
	adc _cact
	sta _cact
	scc
	inc _cact+1
	
	sbw _scr #sw 
	dex
	bne loop
	rts
cact_w .by 0
.endp
;----------

.proc sprites_init
;setting up P/M graphics
    lda #>pmgraph
    sta pmbase
    lda dmactls
    ora #%00001100    ; Players and Missiles single lined
    sta dmactls
    lda #$03    ; P/M on
    sta pmcntl
    lda #$00
    sta sizem ; there will be only M0, double width
    sta sizep0 ; P0-P3 widths
    sta sizep0+1
    sta sizep0+2
    sta sizep0+3
    lda #$11 ; P/M priorities (bit 4 joins missiles), bit 0 - players on top
    sta gtictls
    /*
    ; temporary colours of sprites
    mva #$52 COLPM0
	mva #$34 COLPM1
    mva #$76 COLPM2
    mva #$90 COLPM3
    mva #$B0 COLPF3S
    */
	dx = 42
	mva #dx HPOSP0
	mva #dx+8 HPOSP1
	MVA #dx+8*2 HPOSP2

	rts
.endp

.proc dino_pm
	; uses: AXY tmp tmp1 tmp2 tmp3
	; X: dino animation phase
	; Y: Y position of dino
	
	_dino = tmp1 	 	; _underscore means pointer here and else
	_dino_sav = tmp2 	; local vars for reusing zero page variables
	_spr  = tmp3
	;tmp = tmp
	
	mva dino_save_pm_y dino_save_pm_y_prev
	sty dino_save_pm_y 	;save for clearing


	lda dino_tab_l,x
	;sta _dino
	sta _dino_sav
	lda dino_tab_h,x
	;sta _dino+1
	sta _dino_sav+1

	
	mva #0 counter

loop0
	; sprite address calc
	mwa #(pmgraph+$200) _spr   	;1st sprite starts at PMBASE + $200
								;counter *$80	
	mwa #-$80 tmp				;so first add gives "0"
	ldy counter
@
	adw tmp #$80				;tmp = counter*$80 - calc addr of the sprite to put gfx
	dey
	bpl @-
	
	adw _spr tmp
	mwa _spr tmp ; save address - it will be used in clearing and then drawing

	lda dino_save_pm_y_prev		;clearing old sprite, same way as drawing a new one
	clc 						;add ypos to the sprite address
	adc _spr
	sta _spr
	;scc
	;inc _spr+1					;not necessary, sprites are not crossing pages

	ldy #0						;delete old sprite here
	tya
	ldx #24 	;dino height
@
	sta (_spr),y
	iny
	dex
	bne @-


	
	;--------------------------
	mwa tmp _spr
	lda dino_save_pm_y			;drawing sprite at a new position
	clc 						;add ypos to the sprite address
	adc _spr
	sta _spr
	;scc
	;inc _spr+1					;not necessary, sprites are not crossing pages


	clc				;beginning of the next column of dino to the sprite
	lda _dino_sav	;0- first column, 1 - 2nd, 2 - 3rd
	adc counter
	sta _dino
	;bcc @+			;needs to be removed as both bytes must be copied
	lda _dino_sav+1	;original address
	adc #0
	sta _dino+1		
;@
	
	ldy #0
	
	ldx #24 	;dino height
@
	lda (_dino),y
	sta (_spr),y
	adw _dino #3	;+3 ==> next line in dino
	adw _spr #1
	dex
	bne @-
	
	
	
	inc:lda counter
	cmp #3
	jne loop0

	
	
	rts
counter 			.by 0
dino_save_pm_y		.by 0
dino_save_pm_y_prev	.by 0

.endp

.proc move_dl ;screen window one byte right
	;uses: AXY

	mwa #dl_addrs+1 incr+1 ;self mod
	ldx #sh
incr	inc $ffff
	adw incr+1 #3
	dex
	bne incr
	rts
.endp

.proc move_scr ;screen window one step (1/4 th of byte) right
	dec:lda hscr_state
	sta HSCROL
	cmp #4
	bne @+
	mva #12 hscr_state
	sta HSCROL
	jsr move_dl
	jsr move_dl
@	
	rts
hscr_state 	.by 0
.endp