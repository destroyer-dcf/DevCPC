;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Mac OS X ppc)
;--------------------------------------------------------
	.module ciclo
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _reverse
	.globl _DisplayChar
	.globl __8BP_umap_inv6
	.globl __8BP_moverall_inv2
	.globl __8BP_mover_inv3
	.globl __8BP_map2sp_inv2
	.globl __8BP_layout_inv3
	.globl __8BP_stars_inv5
	.globl __8BP_setupsp_inv4
	.globl __8BP_setupsp_inv3
	.globl __8BP_setlimits_inv4
	.globl __8BP_routesp_inv2
	.globl __8BP_printspall_inv4
	.globl __8BP_printsp_inv2
	.globl __8BP_printsp_inv3
	.globl __8BP_printat_inv
	.globl _getDescriptor
	.globl __8BP_music_inv4
	.globl __8BP_locatesp_inv3
	.globl __8BP_colspall_inv2
	.globl __8BP_colsp_inv2
	.globl __8BP_colsp_inv3
	.globl __8BP_colay_inv2
	.globl __8BP_colay_inv3
	.globl __8BP_3D_inv3
	.globl _comandos_8BP_V39
	.globl _strlen
	.globl _abs
	.globl __basic_rnd_x
	.globl __8BP_rink_N_inverse_list
	.globl __8BP_rink_N_color1
	.globl __8BP_3D_3
	.globl __8BP_3D_1
	.globl __8BP_anima_1
	.globl __8BP_animall
	.globl __8BP_auto_1
	.globl __8BP_autoall_1
	.globl __8BP_autoall
	.globl __8BP_colay
	.globl __8BP_colay_2
	.globl __8BP_colay_1
	.globl __8BP_colay_3
	.globl __8BP_colsp_3
	.globl __8BP_colsp_2
	.globl __8BP_colsp_1
	.globl __8BP_colspall
	.globl __8BP_colspall_1
	.globl __8BP_colspall_2
	.globl __8BP_locatesp_3
	.globl __8BP_music_4
	.globl __8BP_music
	.globl __8BP_printat_4
	.globl __8BP_printsp_3
	.globl __8BP_printsp_2
	.globl __8BP_printsp_1
	.globl __8BP_printspall_4
	.globl __8BP_printspall_1
	.globl __8BP_printspall
	.globl __8BP_routeall
	.globl __8BP_routesp_2
	.globl __8BP_routesp_1
	.globl __8BP_setlimits_4
	.globl __8BP_setupsp_3
	.globl __8BP_setupsp_4
	.globl __8BP_stars_5
	.globl __8BP_stars
	.globl __8BP_layout_3
	.globl __8BP_map2sp_2
	.globl __8BP_map2sp_1
	.globl __8BP_mover_3
	.globl __8BP_mover_1
	.globl __8BP_moverall_2
	.globl __8BP_moverall
	.globl __8BP_peek_2
	.globl __8BP_poke_2
	.globl __8BP_rink_1
	.globl __8BP_rink_N
	.globl __8BP_umap_6
	.globl __basic_time
	.globl __basic_rnd
	.globl __basic_border
	.globl __basic_print
	.globl __basic_inkey
	.globl __basic_str
	.globl __basic_call
	.globl __basic_locate
	.globl __basic_sound
	.globl __basic_ink
	.globl __basic_peek
	.globl __basic_poke
	.globl __basic_pen_txt
	.globl __basic_pen_graph
	.globl __basic_paper
	.globl __basic_plot
	.globl __basic_move
	.globl __basic_draw
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
__8BP_rink_N_color1::
	.ds 1
__8BP_rink_N_inverse_list::
	.ds 34
__basic_str_buffer_10000_282:
	.ds 11
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
__basic_rnd_x::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;mini_BASIC/minibasic.h:177: static char buffer[]="          ";
	ld	hl, #__basic_str_buffer_10000_282
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x20
	ld	hl, #__basic_str_buffer_10000_282 + 2
	ld	(hl), #0x20
	ld	hl, #__basic_str_buffer_10000_282 + 3
	ld	(hl), #0x20
	ld	hl, #__basic_str_buffer_10000_282 + 4
	ld	(hl), #0x20
	ld	hl, #__basic_str_buffer_10000_282 + 5
	ld	(hl), #0x20
	ld	hl, #__basic_str_buffer_10000_282 + 6
	ld	(hl), #0x20
	ld	hl, #__basic_str_buffer_10000_282 + 7
	ld	(hl), #0x20
	ld	hl, #__basic_str_buffer_10000_282 + 8
	ld	(hl), #0x20
	ld	hl, #__basic_str_buffer_10000_282 + 9
	ld	(hl), #0x20
	ld	hl, #__basic_str_buffer_10000_282 + 10
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;BASIC/8BP.h:103: void comandos_8BP_V39(){
;	---------------------------------
; Function comandos_8BP_V39
; ---------------------------------
_comandos_8BP_V39::
;BASIC/8BP.h:133: __endasm;
	_3D	== 0x646c
	ANIMA	== 0x6fc9;
	ANIMALL	== 0x770d;
	AUTO	== 0x717b;
	AUTOALL	== 0x71c9;
	COLAY	== 0x71f8;
	COLSP	== 0x73a3;
	COLSPALL	== 0x75a8;
	LAYOUT	== 0x7059;
	LOCATESP	== 0x6C71
	MAP2SP	== 0x64A8
	MOVER	== 0x7535;
	MOVERALL	== 0x76e7;
	MUSIC	== 0x6F55
	PEEK	== 0x6932
	POKE	== 0x6945
	PRINTAT	== 0x607F
	PRINTSP	== 0x6C94
	PRINTSPALL	== 0x62BC
	RINK	== 0x7627;
	ROUTESP	== 0x6606
	ROUTEALL	== 0x65E5
	SETLIMITS	== 0x6871
	SETUPSP	== 0x70f8;
	STARS	== 0x7433;
	UMAP	== 0x5F4A
;BASIC/8BP.h:134: }
	ret
;BASIC/8BP.h:137: void _8BP_3D_inv3(int offsety,int sp_fin, int flag)
;	---------------------------------
; Function _8BP_3D_inv3
; ---------------------------------
__8BP_3D_inv3::
;BASIC/8BP.h:148: __endasm;			
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	_3D ;
;BASIC/8BP.h:150: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:152: void _8BP_3D_3(int flag, int sp_fin,int offsety)  
;	---------------------------------
; Function _8BP_3D_3
; ---------------------------------
__8BP_3D_3::
;BASIC/8BP.h:154: _8BP_3D_inv3(offsety,sp_fin,flag);
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	__8BP_3D_inv3
;BASIC/8BP.h:155: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:157: void _8BP_3D_1(int flag) 
;	---------------------------------
; Function _8BP_3D_1
; ---------------------------------
__8BP_3D_1::
;BASIC/8BP.h:164: __endasm;			
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	_3D ;
;BASIC/8BP.h:166: }
	ret
;BASIC/8BP.h:168: void _8BP_anima_1(int sp) 
;	---------------------------------
; Function _8BP_anima_1
; ---------------------------------
__8BP_anima_1::
;BASIC/8BP.h:175: __endasm;			
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	ANIMA ;
;BASIC/8BP.h:177: }
	ret
;BASIC/8BP.h:179: void _8BP_animall() 
;	---------------------------------
; Function _8BP_animall
; ---------------------------------
__8BP_animall::
;BASIC/8BP.h:184: __endasm;			
	ld	a,#0
	call	ANIMALL ;
;BASIC/8BP.h:186: }
	ret
;BASIC/8BP.h:188: void _8BP_auto_1(int sp) 
;	---------------------------------
; Function _8BP_auto_1
; ---------------------------------
__8BP_auto_1::
;BASIC/8BP.h:195: __endasm;			
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	AUTO ;
;BASIC/8BP.h:197: }
	ret
;BASIC/8BP.h:199: void _8BP_autoall_1(int flag) 
;	---------------------------------
; Function _8BP_autoall_1
; ---------------------------------
__8BP_autoall_1::
;BASIC/8BP.h:206: __endasm;			
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	AUTOALL ;
;BASIC/8BP.h:208: }
	ret
;BASIC/8BP.h:210: void _8BP_autoall() 
;	---------------------------------
; Function _8BP_autoall
; ---------------------------------
__8BP_autoall::
;BASIC/8BP.h:215: __endasm;			
	ld	a, #0
	call	AUTOALL ;
;BASIC/8BP.h:217: }
	ret
;BASIC/8BP.h:219: void _8BP_colay_inv3( int sp,int* colision,int umbral)
;	---------------------------------
; Function _8BP_colay_inv3
; ---------------------------------
__8BP_colay_inv3::
;BASIC/8BP.h:226: __endasm;		
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLAY
;BASIC/8BP.h:228: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:230: void _8BP_colay()
;	---------------------------------
; Function _8BP_colay
; ---------------------------------
__8BP_colay::
;BASIC/8BP.h:235: __endasm;		
	ld	a, #0
	CALL	COLAY
;BASIC/8BP.h:237: }
	ret
;BASIC/8BP.h:239: void _8BP_colay_inv2(int sp, int* colision)
;	---------------------------------
; Function _8BP_colay_inv2
; ---------------------------------
__8BP_colay_inv2::
;BASIC/8BP.h:246: __endasm;		
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLAY
;BASIC/8BP.h:248: }
	ret
;BASIC/8BP.h:249: void _8BP_colay_2(int* colision, int sp)
;	---------------------------------
; Function _8BP_colay_2
; ---------------------------------
__8BP_colay_2::
	ld	a, e
	ld	c, d
;BASIC/8BP.h:251: _8BP_colay_inv2(sp, colision);
	ex	de, hl
	ld	l, a
	ld	h, c
;BASIC/8BP.h:252: }
	jp	__8BP_colay_inv2
;BASIC/8BP.h:255: void _8BP_colay_1(int sp)
;	---------------------------------
; Function _8BP_colay_1
; ---------------------------------
__8BP_colay_1::
;BASIC/8BP.h:262: __endasm;		
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLAY
;BASIC/8BP.h:264: }
	ret
;BASIC/8BP.h:267: void _8BP_colay_3(int umbral, int* colision, int sp)
;	---------------------------------
; Function _8BP_colay_3
; ---------------------------------
__8BP_colay_3::
;BASIC/8BP.h:269: _8BP_colay_inv3( sp,colision,umbral);
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	__8BP_colay_inv3
;BASIC/8BP.h:270: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:274: void _8BP_colsp_inv3( int b, int a,int operation)
;	---------------------------------
; Function _8BP_colsp_inv3
; ---------------------------------
__8BP_colsp_inv3::
;BASIC/8BP.h:283: __endasm;		
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSP
;BASIC/8BP.h:285: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:287: void _8BP_colsp_inv2(int* colision,int sp)
;	---------------------------------
; Function _8BP_colsp_inv2
; ---------------------------------
__8BP_colsp_inv2::
;BASIC/8BP.h:295: __endasm;		
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSP
;BASIC/8BP.h:297: }
	ret
;BASIC/8BP.h:299: void _8BP_colsp_3(int operation, int a, int b)  
;	---------------------------------
; Function _8BP_colsp_3
; ---------------------------------
__8BP_colsp_3::
;BASIC/8BP.h:301: _8BP_colsp_inv3(b,a,operation);
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	__8BP_colsp_inv3
;BASIC/8BP.h:302: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:304: void _8BP_colsp_2(int sp, int* colision)  
;	---------------------------------
; Function _8BP_colsp_2
; ---------------------------------
__8BP_colsp_2::
	ld	a, e
	ld	c, d
;BASIC/8BP.h:306: _8BP_colsp_inv2(colision, sp);
	ex	de, hl
	ld	l, a
	ld	h, c
;BASIC/8BP.h:307: }
	jp	__8BP_colsp_inv2
;BASIC/8BP.h:309: void _8BP_colsp_1(int sp)  
;	---------------------------------
; Function _8BP_colsp_1
; ---------------------------------
__8BP_colsp_1::
;BASIC/8BP.h:318: __endasm;		
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSP
;BASIC/8BP.h:319: }
	ret
;BASIC/8BP.h:321: void _8BP_colspall_inv2(int* collided,int* collider) 
;	---------------------------------
; Function _8BP_colspall_inv2
; ---------------------------------
__8BP_colspall_inv2::
;BASIC/8BP.h:329: __endasm;
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSPALL
;BASIC/8BP.h:330: }
	ret
;BASIC/8BP.h:332: void _8BP_colspall() 
;	---------------------------------
; Function _8BP_colspall
; ---------------------------------
__8BP_colspall::
;BASIC/8BP.h:337: __endasm;	
	ld	a, #0
	CALL	COLSPALL
;BASIC/8BP.h:338: }
	ret
;BASIC/8BP.h:340: void _8BP_colspall_1(int collider_ini) __critical
;	---------------------------------
; Function _8BP_colspall_1
; ---------------------------------
__8BP_colspall_1::
	ld	a,i
	di
	push	af
;BASIC/8BP.h:348: __endasm;	
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSPALL
;BASIC/8BP.h:349: }
	pop	af
	ret	PO
	ei
	ret
;BASIC/8BP.h:351: void _8BP_colspall_2(int* collider, int* collided) 
;	---------------------------------
; Function _8BP_colspall_2
; ---------------------------------
__8BP_colspall_2::
	ld	a, e
	ld	c, d
;BASIC/8BP.h:353: _8BP_colspall_inv2(collided,collider);
	ex	de, hl
	ld	l, a
	ld	h, c
;BASIC/8BP.h:354: }
	jp	__8BP_colspall_inv2
;BASIC/8BP.h:356: void _8BP_locatesp_inv3(int x, int y, char sp)
;	---------------------------------
; Function _8BP_locatesp_inv3
; ---------------------------------
__8BP_locatesp_inv3::
;BASIC/8BP.h:365: __endasm;	
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	LOCATESP
;BASIC/8BP.h:367: }
	pop	hl
	inc	sp
	jp	(hl)
;BASIC/8BP.h:369: void _8BP_locatesp_3(char sp, int y, int x) 
;	---------------------------------
; Function _8BP_locatesp_3
; ---------------------------------
__8BP_locatesp_3::
;BASIC/8BP.h:371: _8BP_locatesp_inv3( x, y, sp);
	push	af
	inc	sp
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	__8BP_locatesp_inv3
;BASIC/8BP.h:372: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:375: void _8BP_music_inv4(int speed, int song, int flag_repetition, int flag_c) 
;	---------------------------------
; Function _8BP_music_inv4
; ---------------------------------
__8BP_music_inv4::
;BASIC/8BP.h:386: __endasm;		
	ld	a, #4
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MUSIC
;BASIC/8BP.h:387: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:389: void _8BP_music_4(int flag_c, int flag_repetition,int song, int speed)  
;	---------------------------------
; Function _8BP_music_4
; ---------------------------------
__8BP_music_4::
;BASIC/8BP.h:391: _8BP_music_inv4(speed, song, flag_repetition, flag_c);
	push	hl
	push	de
	ld	iy, #6
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	call	__8BP_music_inv4
;BASIC/8BP.h:393: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:395: void _8BP_music()
;	---------------------------------
; Function _8BP_music
; ---------------------------------
__8BP_music::
;BASIC/8BP.h:400: __endasm;		
	ld	a, #0
	CALL	MUSIC
;BASIC/8BP.h:401: }
	ret
;BASIC/8BP.h:403: void getDescriptor(char* desc,char *cad)
;	---------------------------------
; Function getDescriptor
; ---------------------------------
_getDescriptor::
	ld	c, e
	ld	b, d
;BASIC/8BP.h:407: char len=strlen(cad);
	push	hl
	push	bc
	ld	l, c
	ld	h, b
	call	_strlen
	pop	bc
	pop	hl
;BASIC/8BP.h:408: desc[0]=len;
	ld	(hl), e
;BASIC/8BP.h:410: p=desc+1;
	inc	hl
;BASIC/8BP.h:411: *p=cad;
	ld	(hl), c
	inc	hl
	ld	(hl), b
;BASIC/8BP.h:414: }
	ret
;BASIC/8BP.h:416: void _8BP_printat_inv(char *descriptor , int x, int y,int flag) 
;	---------------------------------
; Function _8BP_printat_inv
; ---------------------------------
__8BP_printat_inv::
;BASIC/8BP.h:426: __endasm;			
	ld	a, #4
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTAT
;BASIC/8BP.h:428: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:430: void _8BP_printat_4(int flag,int y,int x, char* cad)  
;	---------------------------------
; Function _8BP_printat_4
; ---------------------------------
__8BP_printat_4::
	push	af
	dec	sp
	ld	c, l
	ld	b, h
;BASIC/8BP.h:433: char descriptor[3]={0,0,0};
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x00
	inc	iy
	ld	0 (iy), #0x00
	inc	iy
	ld	0 (iy), #0x00
;BASIC/8BP.h:434: char len=strlen(cad);
	push	bc
	push	de
	ld	hl, #11
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	_strlen
	ex	de, hl
	pop	de
	pop	bc
	ld	a, l
;BASIC/8BP.h:435: descriptor[0]=len;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
;BASIC/8BP.h:437: p=descriptor+1;
;BASIC/8BP.h:438: *p=cad;  
	ld	hl, #7
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	a, l
	ld	iy, #3
	add	iy, sp
	ld	0 (iy), a
	pop	hl
	ld	1 (iy), h
;BASIC/8BP.h:441: _8BP_printat_inv(descriptor, x, y, flag);   
	push	bc
	push	de
	ld	hl, #9
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #4
	add	hl, sp
	call	__8BP_printat_inv
;BASIC/8BP.h:443: } 
	pop	af
	inc	sp
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:445: void _8BP_printsp_inv3(int x,int y, int sp)  
;	---------------------------------
; Function _8BP_printsp_inv3
; ---------------------------------
__8BP_printsp_inv3::
;BASIC/8BP.h:455: __endasm;	
	ld	a, #3 ; se envian 3 parametros
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSP
;BASIC/8BP.h:456: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:458: void _8BP_printsp_inv2(int bits, int sp) 
;	---------------------------------
; Function _8BP_printsp_inv2
; ---------------------------------
__8BP_printsp_inv2::
;BASIC/8BP.h:467: __endasm;	
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	PRINTSP ;
;BASIC/8BP.h:469: }
	ret
;BASIC/8BP.h:471: void _8BP_printsp_3(int sp, int y, int x)  
;	---------------------------------
; Function _8BP_printsp_3
; ---------------------------------
__8BP_printsp_3::
;BASIC/8BP.h:473: _8BP_printsp_inv3( x, y,  sp);
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	__8BP_printsp_inv3
;BASIC/8BP.h:474: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:476: void _8BP_printsp_2(int sp,int bits_background)  
;	---------------------------------
; Function _8BP_printsp_2
; ---------------------------------
__8BP_printsp_2::
	ld	a, e
	ld	c, d
;BASIC/8BP.h:478: _8BP_printsp_inv2( bits_background,  sp);
	ex	de, hl
	ld	l, a
	ld	h, c
;BASIC/8BP.h:479: }
	jp	__8BP_printsp_inv2
;BASIC/8BP.h:481: void _8BP_printsp_1(int sp)  
;	---------------------------------
; Function _8BP_printsp_1
; ---------------------------------
__8BP_printsp_1::
;BASIC/8BP.h:489: __endasm;	
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSP
;BASIC/8BP.h:492: }
	ret
;BASIC/8BP.h:494: void _8BP_printspall_inv4(int flag_sync,int flag_anima, int fin, int ini)
;	---------------------------------
; Function _8BP_printspall_inv4
; ---------------------------------
__8BP_printspall_inv4::
;BASIC/8BP.h:504: __endasm;	
	ld	a, #4
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSPALL
;BASIC/8BP.h:505: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:507: void _8BP_printspall_4(int ini, int fin, int flag_anima, int flag_sync)  
;	---------------------------------
; Function _8BP_printspall_4
; ---------------------------------
__8BP_printspall_4::
;BASIC/8BP.h:509: _8BP_printspall_inv4(flag_sync, flag_anima, fin, ini);
	push	hl
	push	de
	ld	iy, #6
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	call	__8BP_printspall_inv4
;BASIC/8BP.h:510: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:512: void _8BP_printspall_1(int order_type)  
;	---------------------------------
; Function _8BP_printspall_1
; ---------------------------------
__8BP_printspall_1::
;BASIC/8BP.h:519: __endasm;	
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSPALL
;BASIC/8BP.h:520: }
	ret
;BASIC/8BP.h:522: void _8BP_printspall() 
;	---------------------------------
; Function _8BP_printspall
; ---------------------------------
__8BP_printspall::
;BASIC/8BP.h:527: __endasm;	
	ld	a, #0
	CALL	PRINTSPALL
;BASIC/8BP.h:528: }
	ret
;BASIC/8BP.h:530: void _8BP_routeall()
;	---------------------------------
; Function _8BP_routeall
; ---------------------------------
__8BP_routeall::
;BASIC/8BP.h:535: __endasm;	
	ld	a, #0;
	CALL	ROUTEALL
;BASIC/8BP.h:537: }
	ret
;BASIC/8BP.h:540: void _8BP_routesp_inv2(int pasos, int sp) 
;	---------------------------------
; Function _8BP_routesp_inv2
; ---------------------------------
__8BP_routesp_inv2::
;BASIC/8BP.h:548: __endasm;	
	ld	a, #2 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	ROUTESP
;BASIC/8BP.h:549: }
	ret
;BASIC/8BP.h:551: void _8BP_routesp_2(int sp, int pasos)  
;	---------------------------------
; Function _8BP_routesp_2
; ---------------------------------
__8BP_routesp_2::
	ld	a, e
	ld	c, d
;BASIC/8BP.h:553: _8BP_routesp_inv2(pasos,sp) ;
	ex	de, hl
	ld	l, a
	ld	h, c
;BASIC/8BP.h:554: }
	jp	__8BP_routesp_inv2
;BASIC/8BP.h:556: void _8BP_routesp_1(int sp)  
;	---------------------------------
; Function _8BP_routesp_1
; ---------------------------------
__8BP_routesp_1::
;BASIC/8BP.h:563: __endasm;	
	ld	a, #1 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	ROUTESP
;BASIC/8BP.h:565: }
	ret
;BASIC/8BP.h:567: void _8BP_setlimits_inv4(int ymax, int ymin, int xmax,int xmin)
;	---------------------------------
; Function _8BP_setlimits_inv4
; ---------------------------------
__8BP_setlimits_inv4::
;BASIC/8BP.h:574: __endasm;	
	ld	a, #4 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	SETLIMITS
;BASIC/8BP.h:577: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:579: void _8BP_setlimits_4(int xmin,int xmax, int ymin, int ymax)
;	---------------------------------
; Function _8BP_setlimits_4
; ---------------------------------
__8BP_setlimits_4::
;BASIC/8BP.h:581: _8BP_setlimits_inv4( ymax,  ymin,  xmax, xmin);
	push	hl
	push	de
	ld	iy, #6
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	call	__8BP_setlimits_inv4
;BASIC/8BP.h:582: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:584: void _8BP_setupsp_inv3(int value,int param, int sp) 
;	---------------------------------
; Function _8BP_setupsp_inv3
; ---------------------------------
__8BP_setupsp_inv3::
;BASIC/8BP.h:593: __endasm;	
	ld	a, #3 ; se envian 3 parametros
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	SETUPSP
;BASIC/8BP.h:594: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:596: void _8BP_setupsp_inv4(int value2,int value1,int param, int sp) 
;	---------------------------------
; Function _8BP_setupsp_inv4
; ---------------------------------
__8BP_setupsp_inv4::
;BASIC/8BP.h:606: __endasm;	
	ld	a, #4 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	SETUPSP
;BASIC/8BP.h:607: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:609: void _8BP_setupsp_3(int sp,int param, int value)  
;	---------------------------------
; Function _8BP_setupsp_3
; ---------------------------------
__8BP_setupsp_3::
;BASIC/8BP.h:611: _8BP_setupsp_inv3(value,param, sp);
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	__8BP_setupsp_inv3
;BASIC/8BP.h:612: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:614: void _8BP_setupsp_4(int sp,int param, int value1,int value2) 
;	---------------------------------
; Function _8BP_setupsp_4
; ---------------------------------
__8BP_setupsp_4::
;BASIC/8BP.h:616: _8BP_setupsp_inv4(value2,value1,param, sp);
	push	hl
	push	de
	ld	iy, #6
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	call	__8BP_setupsp_inv4
;BASIC/8BP.h:617: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:620: void _8BP_stars_inv5(int dx, int dy, int color, int num_stars,int star_ini)
;	---------------------------------
; Function _8BP_stars_inv5
; ---------------------------------
__8BP_stars_inv5::
;BASIC/8BP.h:631: __endasm;	
	ld	a, #5
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	STARS
;BASIC/8BP.h:632: }
	pop	hl
	pop	af
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:634: void _8BP_stars_5(int star_ini, int num_stars,int color, int dy, int dx)  
;	---------------------------------
; Function _8BP_stars_5
; ---------------------------------
__8BP_stars_5::
;BASIC/8BP.h:636: _8BP_stars_inv5(dx, dy, color, num_stars,star_ini);
	push	hl
	push	de
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	e, 2 (iy)
	ld	d, 3 (iy)
	ld	l, 4 (iy)
	ld	h, 5 (iy)
	call	__8BP_stars_inv5
;BASIC/8BP.h:637: }	
	pop	hl
	pop	af
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:639: void _8BP_stars() 
;	---------------------------------
; Function _8BP_stars
; ---------------------------------
__8BP_stars::
;BASIC/8BP.h:644: __endasm;	
	ld	a, #0
	CALL	STARS
;BASIC/8BP.h:646: }
	ret
;BASIC/8BP.h:648: void _8BP_layout_inv3(char* descriptor, int x,int y)
;	---------------------------------
; Function _8BP_layout_inv3
; ---------------------------------
__8BP_layout_inv3::
;BASIC/8BP.h:655: __endasm;
	ld	a,#3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	LAYOUT
;BASIC/8BP.h:657: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:659: void _8BP_layout_3(int y, int x, char* cad)
;	---------------------------------
; Function _8BP_layout_3
; ---------------------------------
__8BP_layout_3::
	push	af
	push	af
	dec	sp
	ld	c, l
	ld	b, h
	ld	iy, #3
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
;BASIC/8BP.h:662: char descriptor[3]={0,0,0};
	dec	iy
	dec	iy
	dec	iy
	ld	0 (iy), #0x00
	inc	iy
	ld	0 (iy), #0x00
	inc	iy
	ld	0 (iy), #0x00
;BASIC/8BP.h:663: char len=strlen(cad);
	push	bc
	ld	hl, #9
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	_strlen
	pop	bc
;BASIC/8BP.h:664: descriptor[0]=len;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), e
;BASIC/8BP.h:666: p=descriptor+1;
;BASIC/8BP.h:667: *p=cad;  
	ld	hl, #7
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	iy, #1
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
;BASIC/8BP.h:669: _8BP_layout_inv3(descriptor, x,  y );
	push	bc
	ld	e, 2 (iy)
	ld	d, 3 (iy)
	ld	hl, #2
	add	hl, sp
	call	__8BP_layout_inv3
;BASIC/8BP.h:671: }
	pop	af
	pop	af
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:673: void _8BP_map2sp_inv2(int x, int y)
;	---------------------------------
; Function _8BP_map2sp_inv2
; ---------------------------------
__8BP_map2sp_inv2::
;BASIC/8BP.h:680: __endasm;	
	ld	a,#2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MAP2SP
;BASIC/8BP.h:681: }
	ret
;BASIC/8BP.h:682: void _8BP_map2sp_2(int y, int x)
;	---------------------------------
; Function _8BP_map2sp_2
; ---------------------------------
__8BP_map2sp_2::
	ld	a, e
	ld	c, d
;BASIC/8BP.h:685: _8BP_map2sp_inv2(x,y);
	ex	de, hl
	ld	l, a
	ld	h, c
;BASIC/8BP.h:686: }
	jp	__8BP_map2sp_inv2
;BASIC/8BP.h:688: void _8BP_map2sp_1(unsigned char status)
;	---------------------------------
; Function _8BP_map2sp_1
; ---------------------------------
__8BP_map2sp_1::
;BASIC/8BP.h:695: __endasm;	
	ld	a,#1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MAP2SP
;BASIC/8BP.h:697: }
	ret
;BASIC/8BP.h:699: void _8BP_mover_inv3(int dx,int dy,int sp)
;	---------------------------------
; Function _8BP_mover_inv3
; ---------------------------------
__8BP_mover_inv3::
;BASIC/8BP.h:706: __endasm;	
	ld	a,#3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MOVER
;BASIC/8BP.h:708: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:709: void _8BP_mover_3(int sp, int dy,int dx)
;	---------------------------------
; Function _8BP_mover_3
; ---------------------------------
__8BP_mover_3::
;BASIC/8BP.h:711: _8BP_mover_inv3(dx,dy,sp);
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	__8BP_mover_inv3
;BASIC/8BP.h:712: }
	pop	hl
	pop	af
	jp	(hl)
;BASIC/8BP.h:713: void _8BP_mover_1(int sp)
;	---------------------------------
; Function _8BP_mover_1
; ---------------------------------
__8BP_mover_1::
;BASIC/8BP.h:720: __endasm;	
	ld	a,#1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MOVER
;BASIC/8BP.h:723: }
	ret
;BASIC/8BP.h:724: void _8BP_moverall_inv2(int dx, int dy)
;	---------------------------------
; Function _8BP_moverall_inv2
; ---------------------------------
__8BP_moverall_inv2::
;BASIC/8BP.h:731: __endasm;	
	ld	a,#2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MOVERALL
;BASIC/8BP.h:733: }
	ret
;BASIC/8BP.h:734: void _8BP_moverall_2(int dy, int dx)
;	---------------------------------
; Function _8BP_moverall_2
; ---------------------------------
__8BP_moverall_2::
	ld	a, e
	ld	c, d
;BASIC/8BP.h:736: _8BP_moverall_2(dx,dy);
	ex	de, hl
	ld	l, a
	ld	h, c
;BASIC/8BP.h:737: }
	jr	__8BP_moverall_2
;BASIC/8BP.h:739: void _8BP_moverall()
;	---------------------------------
; Function _8BP_moverall
; ---------------------------------
__8BP_moverall::
;BASIC/8BP.h:744: __endasm;	
	ld	a,#0
	CALL	MOVERALL
;BASIC/8BP.h:746: }
	ret
;BASIC/8BP.h:748: void _8BP_peek_2(int address, int* dato)
;	---------------------------------
; Function _8BP_peek_2
; ---------------------------------
__8BP_peek_2::
;BASIC/8BP.h:751: p=(int *)address;	
;BASIC/8BP.h:752: *dato=*p; //mas facil imposible
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;BASIC/8BP.h:753: }
	ret
;BASIC/8BP.h:755: void _8BP_poke_2(int address,int dato)
;	---------------------------------
; Function _8BP_poke_2
; ---------------------------------
__8BP_poke_2::
;BASIC/8BP.h:758: p=(int *)address;
;BASIC/8BP.h:759: *p=dato; //mas facil imposible
	ld	(hl), e
	inc	hl
	ld	(hl), d
;BASIC/8BP.h:760: }
	ret
;BASIC/8BP.h:763: void _8BP_rink_1(int step)
;	---------------------------------
; Function _8BP_rink_1
; ---------------------------------
__8BP_rink_1::
;BASIC/8BP.h:770: __endasm;	
	ld	a,#1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	RINK
;BASIC/8BP.h:771: }
	ret
;BASIC/8BP.h:775: void _8BP_rink_N(int num_params,int* ink_list)
;	---------------------------------
; Function _8BP_rink_N
; ---------------------------------
__8BP_rink_N::
	push	af
	push	af
	push	af
	push	hl
	ld	a, l
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), a
	pop	hl
	ld	1 (iy), h
	dec	iy
	dec	iy
	ld	0 (iy), e
	ld	1 (iy), d
;BASIC/8BP.h:781: _8BP_rink_N_color1=num_params;
	ld	a, 2 (iy)
	inc	iy
	inc	iy
	ld	(__8BP_rink_N_color1+0), a
;BASIC/8BP.h:784: for (i=0;i<num_params;i++)
	ld	bc, #0x0000
00103$:
	ld	hl, #4
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00101$
;BASIC/8BP.h:785: _8BP_rink_N_inverse_list[i]=ink_list[num_params-i-1];
	ld	a, c
	ld	e, b
	add	a, a
	rl	e
	ld	hl, #0
	add	hl, sp
	add	a, #<(__8BP_rink_N_inverse_list)
	ld	(hl), a
	inc	hl
	ld	a, e
	adc	a, #>(__8BP_rink_N_inverse_list)
	ld	(hl), a
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, c
	ld	e, a
	ld	a, 1 (iy)
	sbc	a, b
	ld	d, a
	dec	de
	ld	a, e
	add	a, a
	rl	d
	ld	hl, #2
	add	hl, sp
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, d
	adc	a, (hl)
	ld	h, a
	ld	l, e
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;BASIC/8BP.h:784: for (i=0;i<num_params;i++)
	inc	bc
	jr	00103$
00101$:
;BASIC/8BP.h:794: __endasm;	
	ld	hl, #__8BP_rink_N_color1;
	ld	a,(hl)
	ld	ix, #__8BP_rink_N_inverse_list;
	CALL	RINK
;BASIC/8BP.h:795: }
	pop	af
	pop	af
	pop	af
	ret
;BASIC/8BP.h:797: void _8BP_umap_inv6(int x_fin,int x_ini, int y_fin, int y_ini, int map_fin, int map_ini)
;	---------------------------------
; Function _8BP_umap_inv6
; ---------------------------------
__8BP_umap_inv6::
;BASIC/8BP.h:804: __endasm;	
	ld	a,#6
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	UMAP
;BASIC/8BP.h:807: }
	pop	hl
	pop	af
	pop	af
	pop	af
	pop	af
	jp	(hl)
;BASIC/8BP.h:809: void _8BP_umap_6(int map_ini, int map_fin, int y_ini, int y_fin, int x_ini, int x_fin)
;	---------------------------------
; Function _8BP_umap_6
; ---------------------------------
__8BP_umap_6::
;BASIC/8BP.h:811: _8BP_umap_inv6(x_fin,x_ini,y_fin,y_ini, map_fin, map_ini);
	push	hl
	push	de
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	inc	iy
	inc	iy
	push	hl
	ld	e, 2 (iy)
	ld	d, 3 (iy)
	ld	l, 4 (iy)
	ld	h, 5 (iy)
	call	__8BP_umap_inv6
;BASIC/8BP.h:813: }
	pop	hl
	pop	af
	pop	af
	pop	af
	pop	af
	jp	(hl)
;mini_BASIC/minibasic.h:55: unsigned int _basic_time()
;	---------------------------------
; Function _basic_time
; ---------------------------------
__basic_time::
;mini_BASIC/minibasic.h:60: __endasm;
	call	0xbd0d
	ret
;mini_BASIC/minibasic.h:62: return 0;
	ld	de, #0x0000
;mini_BASIC/minibasic.h:64: }
	ret
;mini_BASIC/minibasic.h:67: unsigned int _basic_rnd(int max)
;	---------------------------------
; Function _basic_rnd
; ---------------------------------
__basic_rnd::
	ex	de, hl
;mini_BASIC/minibasic.h:80: __endasm;
	call	0xbd0d
	ld	b,h
	ld	c, l
	ld	hl,#__basic_rnd_x; con el # es direccion, el _ es imprescindible en cualquier caso
	ld	(hl),c
	inc	hl
	ld	(hl),b
;mini_BASIC/minibasic.h:82: return _basic_rnd_x % max;	
	ld	hl, (__basic_rnd_x)
;mini_BASIC/minibasic.h:86: }
	jp	__moduint
;mini_BASIC/minibasic.h:88: void _basic_border(char color) 
;	---------------------------------
; Function _basic_border
; ---------------------------------
__basic_border::
;mini_BASIC/minibasic.h:101: __endasm;	
;	recoge primer parametro
;------------------------
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a,(ix)
	ld	b, a
	ld	c, a
	call	0xbc38
;mini_BASIC/minibasic.h:102: }
	ret
;mini_BASIC/minibasic.h:106: void DisplayChar( char c )
;	---------------------------------
; Function DisplayChar
; ---------------------------------
_DisplayChar::
;mini_BASIC/minibasic.h:117: __endasm;
	ld	hl,#2; recoge primer parametro
	add	hl,sp
	ld	a,(hl)
	call	0xbb5a
;mini_BASIC/minibasic.h:118: }
	ret
;mini_BASIC/minibasic.h:121: void _basic_print(char *cad)
;	---------------------------------
; Function _basic_print
; ---------------------------------
__basic_print::
;mini_BASIC/minibasic.h:126: while( *textPtr != 0 )
00101$:
	ld	a, (hl)
	or	a, a
	ret	Z
;mini_BASIC/minibasic.h:128: DisplayChar( *textPtr);
	push	hl
	call	_DisplayChar
	pop	hl
;mini_BASIC/minibasic.h:129: textPtr++;
	inc	hl
;mini_BASIC/minibasic.h:131: } 
	jr	00101$
;mini_BASIC/minibasic.h:133: char _basic_inkey(char key) __naked 
;	---------------------------------
; Function _basic_inkey
; ---------------------------------
__basic_inkey::
;mini_BASIC/minibasic.h:152: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	CALL	0xBB1E
	jr	nz, pressed
	ld	l,#1
	ret
pressed:
	ld	l,#0
	ret
;mini_BASIC/minibasic.h:154: return 0;
	xor	a, a
;mini_BASIC/minibasic.h:157: }
;mini_BASIC/minibasic.h:165: char* reverse(char *buffer, int i, int j)
;	---------------------------------
; Function reverse
; ---------------------------------
_reverse::
	push	af
	dec	sp
	push	hl
	ld	a, l
	ld	iy, #3
	add	iy, sp
	ld	0 (iy), a
	pop	hl
	ld	1 (iy), h
;mini_BASIC/minibasic.h:167: while (i < j)
00101$:
	ld	hl, #5
	add	hl, sp
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00103$
;mini_BASIC/minibasic.h:168: swap(&buffer[i++], &buffer[j--]);
	ld	hl, #5
	add	hl, sp
	ld	iy, #1
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	c, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	hl, #5
	add	hl, sp
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	add	hl, de
	inc	de
;mini_BASIC/minibasic.h:161: char t = *x; *x = *y; *y = t;
	ld	a, (hl)
	push	hl
	dec	iy
	ld	0 (iy), a
	pop	hl
	ld	a, (bc)
	ld	(hl), a
	ld	a, 0 (iy)
	ld	(bc), a
;mini_BASIC/minibasic.h:168: swap(&buffer[i++], &buffer[j--]);
	jr	00101$
00103$:
;mini_BASIC/minibasic.h:170: return buffer;
	ld	iy, #1
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
;mini_BASIC/minibasic.h:171: }
	pop	af
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;mini_BASIC/minibasic.h:173: char* _basic_str(int value) 
;	---------------------------------
; Function _basic_str
; ---------------------------------
__basic_str::
	push	af
	push	af
	push	af
;mini_BASIC/minibasic.h:178: int n = abs(value);
	ld	c,l
	ld	b,h
	call	_abs
	inc	sp
	inc	sp
	push	de
;mini_BASIC/minibasic.h:181: while (n)
	xor	a, a
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
00101$:
;mini_BASIC/minibasic.h:185: buffer[i++] = 48 + r ;
	ld	hl, #4
	add	hl, sp
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	inc	hl
	adc	a, #0x00
	ld	(hl), a
	ld	a, #<(__basic_str_buffer_10000_282)
	add	a, 0 (iy)
	push	af
	ld	a, #>(__basic_str_buffer_10000_282)
	adc	a, 1 (iy)
	ld	h, a
	pop	af
	ld	l, a
;mini_BASIC/minibasic.h:181: while (n)
	ld	a, -1 (iy)
	dec	iy
	dec	iy
	or	a, 0 (iy)
	jr	Z, 00114$
;mini_BASIC/minibasic.h:183: int r = n % 10;
	push	hl
	push	bc
	ld	de, #0x000a
	ld	l, 0 (iy)
	ld	h, 1 (iy)
;mini_BASIC/minibasic.h:185: buffer[i++] = 48 + r ;
	call	__modsint
	pop	bc
	ld	iy, #6
	add	iy, sp
	ld	a, 0 (iy)
	dec	iy
	dec	iy
	ld	0 (iy), a
	ld	a, 3 (iy)
	ld	1 (iy), a
	pop	hl
	ld	a, e
	add	a, #0x30
	ld	(hl), a
;mini_BASIC/minibasic.h:187: n = n / 10;
	push	bc
	ld	de, #0x000a
	ld	l, -2 (iy)
	ld	h, -1 (iy)
	call	__divsint
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
	pop	bc
	jr	00101$
00114$:
	push	hl
	ld	iy, #4
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	pop	hl
;mini_BASIC/minibasic.h:191: if (i == 0)
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ, 00105$
;mini_BASIC/minibasic.h:192: buffer[i++] = '0';
	push	hl
	ld	e, 2 (iy)
	ld	d, 3 (iy)
	pop	hl
	ld	(hl), #0x30
00105$:
;mini_BASIC/minibasic.h:196: if (value < 0 )
	bit	7, b
	jr	Z, 00107$
;mini_BASIC/minibasic.h:197: buffer[i++] = '-';
	ld	c, e
	ld	b, d
	inc	de
	ld	hl, #__basic_str_buffer_10000_282
	add	hl, bc
	ld	(hl), #0x2d
00107$:
;mini_BASIC/minibasic.h:199: buffer[i] = 0; // null terminate string
	ld	hl, #__basic_str_buffer_10000_282
	add	hl, de
	ld	(hl), #0x00
;mini_BASIC/minibasic.h:202: return reverse(buffer, 0, i - 1);
	dec	de
	push	de
	ld	de, #0x0000
	ld	hl, #__basic_str_buffer_10000_282
	call	_reverse
;mini_BASIC/minibasic.h:203: }
	pop	af
	pop	af
	pop	af
	ret
;mini_BASIC/minibasic.h:205: void _basic_call (unsigned int address) 
;	---------------------------------
; Function _basic_call
; ---------------------------------
__basic_call::
;mini_BASIC/minibasic.h:215: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, (ix)
	ld	h, 1(ix)
	ld	(dir+1),hl
dir:
	CALL 0xbd19 ; la direccion 0xbd19 se machaca con la que venga
;mini_BASIC/minibasic.h:217: }
	ret
;mini_BASIC/minibasic.h:219: void _basic_locate (unsigned int x, unsigned int y) 
;	---------------------------------
; Function _basic_locate
; ---------------------------------
__basic_locate::
;mini_BASIC/minibasic.h:227: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, 2(ix)
	ld	h, (ix)
	call	0xbb75
;mini_BASIC/minibasic.h:229: }
	ret
;mini_BASIC/minibasic.h:251: void _basic_sound(unsigned char nChannelStatus, int nTonePeriod, int nDuration, unsigned char nVolume, char nVolumeEnvelope, char nToneEnvelope, unsigned char nNoisePeriod) 
;	---------------------------------
; Function _basic_sound
; ---------------------------------
__basic_sound::
;mini_BASIC/minibasic.h:330: __endasm;
	ld	ix,#2;
	add	ix,sp;
	LD	HL, #0xd7de
	LD	A, (IX) ;nChannelStatus
	LD	(HL), A
	INC	HL
	LD	A,6 (IX) ;nVolumeEnvelope
	LD	(HL), A
	INC	HL
	LD	A, 7 (IX) ;nToneEnvelope
	LD	(HL), A
	INC	HL
	LD	A, 1 (IX) ;nTonePeriod
	LD	(HL), A
	INC	HL
	LD	A, 2 (IX) ;nTonePeriod
	LD	(HL), A
	INC	HL
	LD	A, 8 (IX) ;nNoisePeriod
	LD	(HL), A
	INC	HL
	LD	A, 5 (IX) ;nVolume
	LD	(HL), A
	INC	HL
	LD	A, 3 (IX) ;nDuration
	LD	(HL), A
	INC	HL
	LD	A, 4 (IX) ;nDuration
	LD	(HL), A
	INC	HL
	LD	HL, #0xd7de
	CALL	#0xBCAA ;SOUND QUEUE
;mini_BASIC/minibasic.h:333: }
	pop	hl
	pop	af
	pop	af
	pop	af
	jp	(hl)
;mini_BASIC/minibasic.h:335: void _basic_ink (char ink1, char ink2)
;	---------------------------------
; Function _basic_ink
; ---------------------------------
__basic_ink::
;mini_BASIC/minibasic.h:347: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	ld	b, 2(ix)
	ld	c,b
	call	0xbc32
;mini_BASIC/minibasic.h:348: }
	ret
;mini_BASIC/minibasic.h:350: char _basic_peek(unsigned int address)
;	---------------------------------
; Function _basic_peek
; ---------------------------------
__basic_peek::
;mini_BASIC/minibasic.h:361: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, (ix)
	ld	h,1(ix)
	ld	a,(hl)
	ld	l,a
	ret
;mini_BASIC/minibasic.h:363: return 0;
	xor	a, a
;mini_BASIC/minibasic.h:365: }
	ret
;mini_BASIC/minibasic.h:367: void _basic_poke(unsigned int address, unsigned char data)
;	---------------------------------
; Function _basic_poke
; ---------------------------------
__basic_poke::
;mini_BASIC/minibasic.h:381: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, (ix)
	ld	h,1(ix)
	ld	a,2(ix)
	ld	(hl),a
	ret
;mini_BASIC/minibasic.h:382: }
	pop	hl
	inc	sp
	jp	(hl)
;mini_BASIC/minibasic.h:384: void _basic_pen_txt(char ink)
;	---------------------------------
; Function _basic_pen_txt
; ---------------------------------
__basic_pen_txt::
;mini_BASIC/minibasic.h:392: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	call	0xbb90
;mini_BASIC/minibasic.h:395: }
	ret
;mini_BASIC/minibasic.h:396: void _basic_pen_graph(char ink)
;	---------------------------------
; Function _basic_pen_graph
; ---------------------------------
__basic_pen_graph::
;mini_BASIC/minibasic.h:403: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	call	0xbbde
;mini_BASIC/minibasic.h:405: }
	ret
;mini_BASIC/minibasic.h:411: void _basic_paper(char ink)
;	---------------------------------
; Function _basic_paper
; ---------------------------------
__basic_paper::
;mini_BASIC/minibasic.h:418: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	call	0xbb96
;mini_BASIC/minibasic.h:420: }
	ret
;mini_BASIC/minibasic.h:422: void _basic_plot(int x, int y){
;	---------------------------------
; Function _basic_plot
; ---------------------------------
__basic_plot::
;mini_BASIC/minibasic.h:435: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	e,(ix)
	ld	d, 1(ix)
	ld	l, 2(ix)
	ld	h, 3(ix)
	call	0xBBEA ; GRA PLOT ABSOLUTE
	ret
;mini_BASIC/minibasic.h:436: }
	ret
;mini_BASIC/minibasic.h:438: void _basic_move(int x, int y){
;	---------------------------------
; Function _basic_move
; ---------------------------------
__basic_move::
;mini_BASIC/minibasic.h:451: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	e,(ix)
	ld	d, 1(ix)
	ld	l, 2(ix)
	ld	h, 3(ix)
	call	0xBBC0 ; GRA MOVE ABSOLUTE
	ret
;mini_BASIC/minibasic.h:452: }
	ret
;mini_BASIC/minibasic.h:454: void _basic_draw(int x, int y)
;	---------------------------------
; Function _basic_draw
; ---------------------------------
__basic_draw::
;mini_BASIC/minibasic.h:469: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	e,(ix)
	ld	d, 1(ix)
	ld	l, 2(ix)
	ld	h, 3(ix)
	call	0xBBF6 ; GRA LlNE ABSOLUTE
	ret
;mini_BASIC/minibasic.h:471: }
	ret
;BASIC/ciclo.c:12: int main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	ld	hl, #-27
	add	hl, sp
	ld	sp, hl
;BASIC/ciclo.c:14: _basic_border(7);
	ld	a, #0x07
	call	__basic_border
;BASIC/ciclo.c:15: char cad[] = "has fracasado en tu mision"; // la inicializamos con una frase
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x68
	inc	iy
	ld	0 (iy), #0x61
	inc	iy
	ld	0 (iy), #0x73
	inc	iy
	ld	0 (iy), #0x20
	inc	iy
	ld	0 (iy), #0x66
	inc	iy
	ld	0 (iy), #0x72
	inc	iy
	ld	0 (iy), #0x61
	inc	iy
	ld	0 (iy), #0x63
	inc	iy
	ld	0 (iy), #0x61
	inc	iy
	ld	0 (iy), #0x73
	inc	iy
	ld	0 (iy), #0x61
	inc	iy
	ld	0 (iy), #0x64
	inc	iy
	ld	0 (iy), #0x6f
	inc	iy
	ld	0 (iy), #0x20
	inc	iy
	ld	0 (iy), #0x65
	inc	iy
	ld	0 (iy), #0x6e
	inc	iy
	ld	0 (iy), #0x20
	inc	iy
	ld	0 (iy), #0x74
	inc	iy
	ld	0 (iy), #0x75
	inc	iy
	ld	0 (iy), #0x20
	inc	iy
	ld	0 (iy), #0x6d
	inc	iy
	ld	0 (iy), #0x69
	inc	iy
	ld	0 (iy), #0x73
	inc	iy
	ld	0 (iy), #0x69
	inc	iy
	ld	0 (iy), #0x6f
	inc	iy
	ld	0 (iy), #0x6e
	inc	iy
	ld	0 (iy), #0x00
;BASIC/ciclo.c:16: _basic_print(cad);
	ld	hl, #0
	add	hl, sp
	call	__basic_print
;BASIC/ciclo.c:17: return 0;
	ld	de, #0x0000
;BASIC/ciclo.c:18: }
	ld	hl, #27
	add	hl, sp
	ld	sp, hl
	ret
	.area _CODE
	.area _INITIALIZER
__xinit___basic_rnd_x:
	.dw #0x0000
	.area _CABS (ABS)
