;	@com.wudsn.ide.asm.mainsourcefile=ni.asm
	icl 'atari.asm'
	icl 'macro.asm'

	.zpvar tmp, tmp0, tmp1, tmp2, tmp3 .word
sw = $80 ;physical screen width in bytes (distance between beginnings of consecutive lines)
sw_log = 48 ;logical screen width
sh = 128 ;screen height in lines
screen = $4000
pmgraph = $9000
	org $2000
dl
	.byte $70,$70,$70
dl_addrs ;start of lines
	.REPT sh
		.byte $5f
		.word screen+#*sw
	.ENDR
	.byte $41
	.word DL
start
	mva #%00100011  DMACTLS    
	mwa #dl DLPTRS
	mva #12 move_scr.hscr_state ;hscroll initialisation
	sta HSCROL
	
	mva #0 COLPF1S
	mva #$0F COLBAKS
	mva #$0f COLPF2S
	
	
	jsr sprites_init
    pause 1
	jsr ground_init

	ldx #20
	ldy #0
	jsr cactus
	ldx #30
	ldy #1
	jsr cactus
	ldx #40
	ldy #2
	jsr cactus

xx	ldx #0 ; anim phaze
yy	ldy #54
	jsr dino_pm
	inc:lda xx+1
	cmp #3
	sne
	mva #0 xx+1	
	key
	jsr move_scr
	jmp xx


llp
	mva #0 ntmp
lp
	ldx ntmp
	ldy #98
	jsr dino
	key
	jsr dino_clear
	key
	inc:lda ntmp
	cmp #3
	bne lp
	jmp llp


	halt 03
	
	run start
ntmp .by 0

	icl 'procs.asm'
	icl 'artwork.asm'