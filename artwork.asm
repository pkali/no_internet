;	@com.wudsn.ide.asm.mainsourcefile=ni.asm
;-------------------------------------------------------------
	;24x24 pix = 3x3 chars (3x24 bytes)
	.rept 3, #
dino:1 
	ins 'art/dino:1.data'
	.endr

	.rept 3, #
dino_mask:1 
	ins 'art/dino_mask:1.data'
	.endr

dino_tab_l
	.rept 3, #
		.by <dino:1
	.endr
dino_tab_h
	.rept 3, #
		.by >dino:1
	.endr

dino_mask_tab_l
	.rept 3, #
		.by <dino_mask:1
	.endr
dino_mask_tab_h
	.rept 3, #
		.by >dino_mask:1
	.endr

dino_back ; background save for dino sprite
:3*24 			.by 0
dino_save_y		.by 0

;------------------------------
; ground pictures, 8x16 px = 2x1 chars (2x8 bytes)
	.rept 3, #
gnd_:1
	ins 'art/gnd_:1.data'
	.endr
gnd_tab_l
	.rept 3, #
		.by <gnd_:1
	.endr
gnd_tab_h
	.rept 3, #
		.by >gnd_:1
	.endr
scr_addrs_l
:sh		.by <(screen+#*sw)
scr_addrs_h
:sh		.by >(screen+#*sw)
;------------------------------
; cacti pictures, height and width variable
; cactX.data is flipped vertically
cacti = 3

	.rept cacti, #
cact:1
	ins 'art/cact:1.data'
	.endr

cact_widths 	; widths of cactii in bytes
	.by  4, 4, 8
cact_heights	; heights of cactii in lines
	.by 35,48,35
cact_tab_l
	.rept cacti, #
		.by <cact:1
	.endr
cact_tab_h
	.rept cacti, #
		.by >cact:1
	.endr

