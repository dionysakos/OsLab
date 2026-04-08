	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 5	sdk_version 15, 5
	.file	0 "/Users/dionysiskatsetis/OsLab/lab2_ans" "simplesync.c" md5 0x50b380992ae99e12f71833b0c827e887
	.file	1 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread" "_pthread_types.h" md5 0x4e2ea0e1af95894da0a6030a21a8ebee
	.file	2 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread" "_pthread_mutex_t.h" md5 0x583a89b25a16f85ebbdf32f8d9f237ec
	.globl	_increase_fn                    ; -- Begin function increase_fn
	.p2align	2
_increase_fn:                           ; @increase_fn
Lfunc_begin0:
	.loc	0 41 0                          ; simplesync.c:41:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: increase_fn:arg <- $x0
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
Ltmp0:
	;DEBUG_VALUE: increase_fn:arg <- $x19
	mov	w21, #38528                     ; =0x9680
	movk	w21, #152, lsl #16
Ltmp1:
	;DEBUG_VALUE: increase_fn:ip <- undef
	.loc	0 45 10 prologue_end            ; simplesync.c:45:10
Lloh0:
	adrp	x22, ___stderrp@GOTPAGE
Lloh1:
	ldr	x22, [x22, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x22]
	.loc	0 45 2 is_stmt 0                ; simplesync.c:45:2
	str	x21, [sp]
Lloh2:
	adrp	x1, l_.str@PAGE
Lloh3:
	add	x1, x1, l_.str@PAGEOFF
	bl	_fprintf
Ltmp2:
	;DEBUG_VALUE: increase_fn:i <- 0
	.loc	0 0 2                           ; simplesync.c:0:2
Lloh4:
	adrp	x20, _mutex@GOTPAGE
Lloh5:
	ldr	x20, [x20, _mutex@GOTPAGEOFF]
Ltmp3:
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: increase_fn:arg <- $x19
	;DEBUG_VALUE: increase_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $w21
	.loc	0 54 14 is_stmt 1               ; simplesync.c:54:14
	mov	x0, x20
	bl	_pthread_mutex_lock
Ltmp4:
	;DEBUG_VALUE: ret <- $w0
	.loc	0 55 8                          ; simplesync.c:55:8
	cbnz	w0, LBB0_6
Ltmp5:
; %bb.2:                                ;   in Loop: Header=BB0_1 Depth=1
	;DEBUG_VALUE: ret <- $w0
	;DEBUG_VALUE: increase_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $w21
	;DEBUG_VALUE: increase_fn:arg <- $x19
	.loc	0 60 4                          ; simplesync.c:60:4
	ldr	w8, [x19]
	add	w8, w8, #1
	str	w8, [x19]
	.loc	0 62 10                         ; simplesync.c:62:10
	mov	x0, x20
Ltmp6:
	bl	_pthread_mutex_unlock
Ltmp7:
	;DEBUG_VALUE: ret <- $w0
	;DEBUG_VALUE: increase_fn:i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $w21
	.loc	0 63 8                          ; simplesync.c:63:8
	cbnz	w0, LBB0_5
Ltmp8:
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	;DEBUG_VALUE: increase_fn:i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $w21
	;DEBUG_VALUE: increase_fn:arg <- $x19
	;DEBUG_VALUE: increase_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $w21
	.loc	0 46 16                         ; simplesync.c:46:16
	subs	w21, w21, #1
Ltmp9:
	.loc	0 46 2 is_stmt 0                ; simplesync.c:46:2
	b.ne	LBB0_1
Ltmp10:
; %bb.4:
	;DEBUG_VALUE: increase_fn:arg <- $x19
	.loc	0 69 10 is_stmt 1               ; simplesync.c:69:10
	ldr	x3, [x22]
	.loc	0 69 2 is_stmt 0                ; simplesync.c:69:2
Lloh6:
	adrp	x0, l_.str.3@PAGE
Lloh7:
	add	x0, x0, l_.str.3@PAGEOFF
	mov	w1, #26                         ; =0x1a
	mov	w2, #1                          ; =0x1
	bl	_fwrite
Ltmp11:
	.loc	0 71 2 is_stmt 1                ; simplesync.c:71:2
	mov	x0, #0                          ; =0x0
	.loc	0 71 2 epilogue_begin is_stmt 0 ; simplesync.c:71:2
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
Ltmp12:
	;DEBUG_VALUE: increase_fn:arg <- [DW_OP_LLVM_entry_value 1] $x0
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
Ltmp13:
LBB0_5:
	;DEBUG_VALUE: increase_fn:i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $w21
	;DEBUG_VALUE: ret <- $w0
	;DEBUG_VALUE: increase_fn:arg <- $x19
	.loc	0 64 5 is_stmt 1                ; simplesync.c:64:5
	bl	_increase_fn.cold.2
Ltmp14:
LBB0_6:
	;DEBUG_VALUE: ret <- $w0
	;DEBUG_VALUE: increase_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $w21
	;DEBUG_VALUE: increase_fn:arg <- $x19
	.loc	0 56 5                          ; simplesync.c:56:5
	bl	_increase_fn.cold.1
Ltmp15:
	.loh AdrpLdrGot	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpAdd	Lloh6, Lloh7
Lfunc_end0:
	.cfi_endproc
	.file	3 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include" "_stdio.h" md5 0xd91ebd7d161d9196cc100822ef0e5cdf
	.file	4 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm" "_types.h" md5 0xb270144f57ae258d0ce80b8f87be068c
	.file	5 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys" "_types.h" md5 0xaf82ff6119a9fa80fad635d276556d46
	.file	6 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include" "pthread.h" md5 0xd98d65819fa0eeda6334c838666d7405
                                        ; -- End function
	.globl	_decrease_fn                    ; -- Begin function decrease_fn
	.p2align	2
_decrease_fn:                           ; @decrease_fn
Lfunc_begin1:
	.loc	0 75 0                          ; simplesync.c:75:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: decrease_fn:arg <- $x0
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
Ltmp16:
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	mov	w21, #38528                     ; =0x9680
	movk	w21, #152, lsl #16
Ltmp17:
	;DEBUG_VALUE: decrease_fn:ip <- undef
	.loc	0 79 10 prologue_end            ; simplesync.c:79:10
Lloh8:
	adrp	x22, ___stderrp@GOTPAGE
Lloh9:
	ldr	x22, [x22, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x22]
	.loc	0 79 2 is_stmt 0                ; simplesync.c:79:2
	str	x21, [sp]
Lloh10:
	adrp	x1, l_.str.4@PAGE
Lloh11:
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fprintf
Ltmp18:
	;DEBUG_VALUE: decrease_fn:i <- 0
	.loc	0 0 2                           ; simplesync.c:0:2
Lloh12:
	adrp	x20, _mutex@GOTPAGE
Lloh13:
	ldr	x20, [x20, _mutex@GOTPAGEOFF]
Ltmp19:
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	;DEBUG_VALUE: decrease_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $w21
	.loc	0 88 14 is_stmt 1               ; simplesync.c:88:14
	mov	x0, x20
	bl	_pthread_mutex_lock
Ltmp20:
	;DEBUG_VALUE: ret <- $w0
	.loc	0 89 8                          ; simplesync.c:89:8
	cbnz	w0, LBB1_6
Ltmp21:
; %bb.2:                                ;   in Loop: Header=BB1_1 Depth=1
	;DEBUG_VALUE: ret <- $w0
	;DEBUG_VALUE: decrease_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $w21
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	.loc	0 94 4                          ; simplesync.c:94:4
	ldr	w8, [x19]
	sub	w8, w8, #1
	str	w8, [x19]
	.loc	0 95 10                         ; simplesync.c:95:10
	mov	x0, x20
Ltmp22:
	bl	_pthread_mutex_unlock
Ltmp23:
	;DEBUG_VALUE: ret <- $w0
	;DEBUG_VALUE: decrease_fn:i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $w21
	.loc	0 96 8                          ; simplesync.c:96:8
	cbnz	w0, LBB1_5
Ltmp24:
; %bb.3:                                ;   in Loop: Header=BB1_1 Depth=1
	;DEBUG_VALUE: decrease_fn:i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $w21
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	;DEBUG_VALUE: decrease_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $w21
	.loc	0 80 16                         ; simplesync.c:80:16
	subs	w21, w21, #1
Ltmp25:
	.loc	0 80 2 is_stmt 0                ; simplesync.c:80:2
	b.ne	LBB1_1
Ltmp26:
; %bb.4:
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	.loc	0 103 10 is_stmt 1              ; simplesync.c:103:10
	ldr	x3, [x22]
	.loc	0 103 2 is_stmt 0               ; simplesync.c:103:2
Lloh14:
	adrp	x0, l_.str.5@PAGE
Lloh15:
	add	x0, x0, l_.str.5@PAGEOFF
	mov	w1, #26                         ; =0x1a
	mov	w2, #1                          ; =0x1
	bl	_fwrite
Ltmp27:
	.loc	0 105 2 is_stmt 1               ; simplesync.c:105:2
	mov	x0, #0                          ; =0x0
	.loc	0 105 2 epilogue_begin is_stmt 0 ; simplesync.c:105:2
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
Ltmp28:
	;DEBUG_VALUE: decrease_fn:arg <- [DW_OP_LLVM_entry_value 1] $x0
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
Ltmp29:
LBB1_5:
	;DEBUG_VALUE: decrease_fn:i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $w21
	;DEBUG_VALUE: ret <- $w0
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	.loc	0 97 5 is_stmt 1                ; simplesync.c:97:5
	bl	_decrease_fn.cold.2
Ltmp30:
LBB1_6:
	;DEBUG_VALUE: ret <- $w0
	;DEBUG_VALUE: decrease_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $w21
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	.loc	0 90 5                          ; simplesync.c:90:5
	bl	_decrease_fn.cold.1
Ltmp31:
	.loh AdrpLdrGot	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpLdrGot	Lloh8, Lloh9
	.loh AdrpAdd	Lloh14, Lloh15
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin2:
	.loc	0 110 0                         ; simplesync.c:110:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: main:argc <- $w0
	;DEBUG_VALUE: main:argv <- $x1
	sub	sp, sp, #80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
Ltmp32:
	;DEBUG_VALUE: main:val <- 0
	.loc	0 117 6 prologue_end            ; simplesync.c:117:6
	stur	wzr, [x29, #-20]
	.loc	0 121 8                         ; simplesync.c:121:8
Lloh16:
	adrp	x0, _mutex@GOTPAGE
Ltmp33:
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
Lloh17:
	ldr	x0, [x0, _mutex@GOTPAGEOFF]
	mov	x1, #0                          ; =0x0
Ltmp34:
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	bl	_pthread_mutex_init
Ltmp35:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 122 6                         ; simplesync.c:122:6
	cbnz	w0, LBB2_9
Ltmp36:
; %bb.1:
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:val <- 0
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	.loc	0 130 8                         ; simplesync.c:130:8
Lloh18:
	adrp	x2, _increase_fn@PAGE
Lloh19:
	add	x2, x2, _increase_fn@PAGEOFF
	add	x0, sp, #32
Ltmp37:
	sub	x3, x29, #20
	mov	x1, #0                          ; =0x0
	bl	_pthread_create
Ltmp38:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 131 6                         ; simplesync.c:131:6
	cbnz	w0, LBB2_10
Ltmp39:
; %bb.2:
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	.loc	0 135 8                         ; simplesync.c:135:8
Lloh20:
	adrp	x2, _decrease_fn@PAGE
Lloh21:
	add	x2, x2, _decrease_fn@PAGEOFF
	add	x0, sp, #24
Ltmp40:
	sub	x3, x29, #20
	mov	x1, #0                          ; =0x0
	bl	_pthread_create
Ltmp41:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 136 6                         ; simplesync.c:136:6
	cbnz	w0, LBB2_11
Ltmp42:
; %bb.3:
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 144 21                        ; simplesync.c:144:21
	ldr	x0, [sp, #32]
Ltmp43:
	;DEBUG_VALUE: main:t1 <- $x0
	.loc	0 144 8 is_stmt 0               ; simplesync.c:144:8
	mov	x1, #0                          ; =0x0
	bl	_pthread_join
Ltmp44:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 145 6 is_stmt 1               ; simplesync.c:145:6
	cbnz	w0, LBB2_7
Ltmp45:
LBB2_4:
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 147 21                        ; simplesync.c:147:21
	ldr	x0, [sp, #24]
Ltmp46:
	;DEBUG_VALUE: main:t2 <- $x0
	.loc	0 147 8 is_stmt 0               ; simplesync.c:147:8
	mov	x1, #0                          ; =0x0
	bl	_pthread_join
Ltmp47:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 148 6 is_stmt 1               ; simplesync.c:148:6
	cbnz	w0, LBB2_8
Ltmp48:
LBB2_5:
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 156 2                         ; simplesync.c:156:2
	ldur	w19, [x29, #-20]
Ltmp49:
	;DEBUG_VALUE: main:ok <- undef
	;DEBUG_VALUE: main:val <- $w19
	.loc	0 156 30 is_stmt 0              ; simplesync.c:156:30
Lloh22:
	adrp	x8, l_.str.10@PAGE
Lloh23:
	add	x8, x8, l_.str.10@PAGEOFF
Lloh24:
	adrp	x9, l_.str.11@PAGE
Lloh25:
	add	x9, x9, l_.str.11@PAGEOFF
	cmp	w19, #0
	csel	x8, x9, x8, ne
	.loc	0 156 2                         ; simplesync.c:156:2
	stp	x8, x19, [sp]
Lloh26:
	adrp	x0, l_.str.9@PAGE
Lloh27:
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
Ltmp50:
	.loc	0 158 8 is_stmt 1               ; simplesync.c:158:8
Lloh28:
	adrp	x0, _mutex@GOTPAGE
Lloh29:
	ldr	x0, [x0, _mutex@GOTPAGEOFF]
	bl	_pthread_mutex_destroy
Ltmp51:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 159 6                         ; simplesync.c:159:6
	cbnz	w0, LBB2_12
Ltmp52:
; %bb.6:
	;DEBUG_VALUE: main:val <- $w19
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 154 12                        ; simplesync.c:154:12
	cmp	w19, #0
	cset	w0, ne
Ltmp53:
	.loc	0 163 2 epilogue_begin          ; simplesync.c:163:2
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
Ltmp54:
	add	sp, sp, #80
	ret
Ltmp55:
LBB2_7:
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 0 2 is_stmt 0                 ; simplesync.c:0:2
	mov	x19, x0
Ltmp56:
	.loc	0 146 3 is_stmt 1               ; simplesync.c:146:3
	bl	___error
Ltmp57:
	str	w19, [x0]
Lloh30:
	adrp	x0, l_.str.8@PAGE
Lloh31:
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_perror
Ltmp58:
	.loc	0 0 3 is_stmt 0                 ; simplesync.c:0:3
	b	LBB2_4
Ltmp59:
LBB2_8:
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	mov	x19, x0
Ltmp60:
	.loc	0 149 3 is_stmt 1               ; simplesync.c:149:3
	bl	___error
Ltmp61:
	str	w19, [x0]
Lloh32:
	adrp	x0, l_.str.8@PAGE
Lloh33:
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_perror
Ltmp62:
	.loc	0 0 3 is_stmt 0                 ; simplesync.c:0:3
	b	LBB2_5
Ltmp63:
LBB2_9:
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:val <- 0
	.loc	0 123 3 is_stmt 1               ; simplesync.c:123:3
	bl	_main.cold.1
Ltmp64:
LBB2_10:
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 132 3                         ; simplesync.c:132:3
	bl	_main.cold.2
Ltmp65:
LBB2_11:
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 137 3                         ; simplesync.c:137:3
	bl	_main.cold.3
Ltmp66:
LBB2_12:
	;DEBUG_VALUE: main:val <- $w19
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 160 3                         ; simplesync.c:160:3
	bl	_main.cold.4
Ltmp67:
	.loh AdrpLdrGot	Lloh16, Lloh17
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpLdrGot	Lloh28, Lloh29
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpAdd	Lloh32, Lloh33
Lfunc_end2:
	.cfi_endproc
	.file	7 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread" "_pthread_mutexattr_t.h" md5 0x785eb3f812f7ebee764058667d4b4693
	.file	8 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread" "_pthread_t.h" md5 0x086fc6d7dc3c67fdb87e7376555dcfd7
	.file	9 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread" "_pthread_attr_t.h" md5 0x383e78324250b910a1128f1b9a464b23
	.file	10 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include" "_printf.h" md5 0x2d37517bd0342aa326aa1d3660ad4ab4
	.file	11 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys" "errno.h" md5 0x87e3fde364802c167e5220028e837709
                                        ; -- End function
	.p2align	2                               ; -- Begin function increase_fn.cold.1
_increase_fn.cold.1:                    ; @increase_fn.cold.1
Lfunc_begin3:
	.loc	0 0 0                           ; simplesync.c:0:0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	bl	_OUTLINED_FUNCTION_1
Ltmp68:
	.loc	0 56 5 prologue_end             ; simplesync.c:56:5
	str	w19, [x0]
Lloh34:
	adrp	x0, l_.str.1@PAGE
Lloh35:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp69:
	.loh AdrpAdd	Lloh34, Lloh35
Lfunc_end3:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function increase_fn.cold.2
_increase_fn.cold.2:                    ; @increase_fn.cold.2
Lfunc_begin4:
	.loc	0 0 0                           ; simplesync.c:0:0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	bl	_OUTLINED_FUNCTION_1
Ltmp70:
	.loc	0 64 5 prologue_end             ; simplesync.c:64:5
	str	w19, [x0]
Lloh36:
	adrp	x0, l_.str.2@PAGE
Lloh37:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp71:
	.loh AdrpAdd	Lloh36, Lloh37
Lfunc_end4:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function decrease_fn.cold.1
_decrease_fn.cold.1:                    ; @decrease_fn.cold.1
Lfunc_begin5:
	.loc	0 0 0                           ; simplesync.c:0:0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	bl	_OUTLINED_FUNCTION_1
Ltmp72:
	.loc	0 90 5 prologue_end             ; simplesync.c:90:5
	str	w19, [x0]
Lloh38:
	adrp	x0, l_.str.1@PAGE
Lloh39:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp73:
	.loh AdrpAdd	Lloh38, Lloh39
Lfunc_end5:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function decrease_fn.cold.2
_decrease_fn.cold.2:                    ; @decrease_fn.cold.2
Lfunc_begin6:
	.loc	0 0 0                           ; simplesync.c:0:0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	bl	_OUTLINED_FUNCTION_1
Ltmp74:
	.loc	0 97 5 prologue_end             ; simplesync.c:97:5
	str	w19, [x0]
Lloh40:
	adrp	x0, l_.str.2@PAGE
Lloh41:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp75:
	.loh AdrpAdd	Lloh40, Lloh41
Lfunc_end6:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function main.cold.1
_main.cold.1:                           ; @main.cold.1
Lfunc_begin7:
	.loc	0 0 0                           ; simplesync.c:0:0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	bl	_OUTLINED_FUNCTION_1
Ltmp76:
	.loc	0 123 3 prologue_end            ; simplesync.c:123:3
	str	w19, [x0]
Lloh42:
	adrp	x0, l_.str.6@PAGE
Lloh43:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp77:
	.loh AdrpAdd	Lloh42, Lloh43
Lfunc_end7:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function main.cold.2
_main.cold.2:                           ; @main.cold.2
Lfunc_begin8:
	.loc	0 0 0                           ; simplesync.c:0:0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	bl	_OUTLINED_FUNCTION_1
Ltmp78:
	.loc	0 132 3 prologue_end            ; simplesync.c:132:3
	str	w19, [x0]
Lloh44:
	adrp	x0, l_.str.7@PAGE
Lloh45:
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp79:
	.loh AdrpAdd	Lloh44, Lloh45
Lfunc_end8:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function main.cold.3
_main.cold.3:                           ; @main.cold.3
Lfunc_begin9:
	.loc	0 0 0                           ; simplesync.c:0:0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	bl	_OUTLINED_FUNCTION_1
Ltmp80:
	.loc	0 137 3 prologue_end            ; simplesync.c:137:3
	str	w19, [x0]
Lloh46:
	adrp	x0, l_.str.7@PAGE
Lloh47:
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp81:
	.loh AdrpAdd	Lloh46, Lloh47
Lfunc_end9:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function main.cold.4
_main.cold.4:                           ; @main.cold.4
Lfunc_begin10:
	.loc	0 0 0                           ; simplesync.c:0:0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	bl	_OUTLINED_FUNCTION_1
Ltmp82:
	.loc	0 160 3 prologue_end            ; simplesync.c:160:3
	str	w19, [x0]
Lloh48:
	adrp	x0, l_.str.12@PAGE
Lloh49:
	add	x0, x0, l_.str.12@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp83:
	.loh AdrpAdd	Lloh48, Lloh49
Lfunc_end10:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function OUTLINED_FUNCTION_0
_OUTLINED_FUNCTION_0:                   ; @OUTLINED_FUNCTION_0 Thunk
Lfunc_begin11:
	.cfi_startproc
; %bb.0:
	mov	w0, #1                          ; =0x1
	b	_exit
Lfunc_end11:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function OUTLINED_FUNCTION_1
_OUTLINED_FUNCTION_1:                   ; @OUTLINED_FUNCTION_1 Thunk
Lfunc_begin12:
	.cfi_startproc
; %bb.0:
	mov	x19, x0
	b	___error
Lfunc_end12:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"About to increase variable %d times\n"

	.comm	_mutex,64,3                     ; @mutex
l_.str.1:                               ; @.str.1
	.asciz	"pthread_mutex_lock"

l_.str.2:                               ; @.str.2
	.asciz	"pthread_mutex_unlock"

l_.str.3:                               ; @.str.3
	.asciz	"Done increasing variable.\n"

l_.str.4:                               ; @.str.4
	.asciz	"About to decrease variable %d times\n"

l_.str.5:                               ; @.str.5
	.asciz	"Done decreasing variable.\n"

l_.str.6:                               ; @.str.6
	.asciz	"pthread_mutex_init"

l_.str.7:                               ; @.str.7
	.asciz	"pthread_create"

l_.str.8:                               ; @.str.8
	.asciz	"pthread_join"

l_.str.9:                               ; @.str.9
	.asciz	"%sOK, val = %d.\n"

l_.str.10:                              ; @.str.10
	.space	1

l_.str.11:                              ; @.str.11
	.asciz	"NOT "

l_.str.12:                              ; @.str.12
	.asciz	"pthread_mutex_destroy"

	.section	__DWARF,__debug_loclists,regular,debug
Lsection_debug_loc0:
.set Lset0, Ldebug_list_header_end0-Ldebug_list_header_start0 ; Length
	.long	Lset0
Ldebug_list_header_start0:
	.short	5                               ; Version
	.byte	8                               ; Address size
	.byte	0                               ; Segment selector size
	.long	12                              ; Offset entry count
Lloclists_table_base0:
.set Lset1, Ldebug_loc0-Lloclists_table_base0
	.long	Lset1
.set Lset2, Ldebug_loc1-Lloclists_table_base0
	.long	Lset2
.set Lset3, Ldebug_loc2-Lloclists_table_base0
	.long	Lset3
.set Lset4, Ldebug_loc3-Lloclists_table_base0
	.long	Lset4
.set Lset5, Ldebug_loc4-Lloclists_table_base0
	.long	Lset5
.set Lset6, Ldebug_loc5-Lloclists_table_base0
	.long	Lset6
.set Lset7, Ldebug_loc6-Lloclists_table_base0
	.long	Lset7
.set Lset8, Ldebug_loc7-Lloclists_table_base0
	.long	Lset8
.set Lset9, Ldebug_loc8-Lloclists_table_base0
	.long	Lset9
.set Lset10, Ldebug_loc9-Lloclists_table_base0
	.long	Lset10
.set Lset11, Ldebug_loc10-Lloclists_table_base0
	.long	Lset11
.set Lset12, Ldebug_loc11-Lloclists_table_base0
	.long	Lset12
Ldebug_loc0:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Lfunc_begin0-Lfunc_begin0      ;   starting offset
	.uleb128 Ltmp0-Lfunc_begin0             ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp0-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp12-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp12-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp13-Lfunc_begin0            ;   ending offset
	.byte	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp13-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end0-Lfunc_begin0        ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc1:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp2-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp3-Lfunc_begin0             ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	17                              ; DW_OP_consts
	.byte	0                               ; 0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp3-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp7-Lfunc_begin0             ;   ending offset
	.byte	12                              ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	0                               ; 0
	.byte	17                              ; DW_OP_consts
	.byte	128                             ; 10000000
	.byte	173                             ; 
	.byte	226                             ; 
	.byte	4                               ; 
	.byte	28                              ; DW_OP_minus
	.byte	17                              ; DW_OP_consts
	.byte	127                             ; -1
	.byte	27                              ; DW_OP_div
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp7-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp8-Lfunc_begin0             ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	1                               ; 1
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp8-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp9-Lfunc_begin0             ;   ending offset
	.byte	15                              ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	0                               ; 0
	.byte	17                              ; DW_OP_consts
	.byte	128                             ; 10000000
	.byte	173                             ; 
	.byte	226                             ; 
	.byte	4                               ; 
	.byte	28                              ; DW_OP_minus
	.byte	17                              ; DW_OP_consts
	.byte	127                             ; -1
	.byte	27                              ; DW_OP_div
	.byte	17                              ; DW_OP_consts
	.byte	1                               ; 1
	.byte	34                              ; DW_OP_plus
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp13-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp14-Lfunc_begin0            ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	1                               ; 1
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp14-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end0-Lfunc_begin0        ;   ending offset
	.byte	12                              ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	0                               ; 0
	.byte	17                              ; DW_OP_consts
	.byte	128                             ; 10000000
	.byte	173                             ; 
	.byte	226                             ; 
	.byte	4                               ; 
	.byte	28                              ; DW_OP_minus
	.byte	17                              ; DW_OP_consts
	.byte	127                             ; -1
	.byte	27                              ; DW_OP_div
	.byte	159                             ; DW_OP_stack_value
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc2:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp4-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp6-Lfunc_begin0             ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp7-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp8-Lfunc_begin0             ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp13-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp15-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc3:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Lfunc_begin1-Lfunc_begin0      ;   starting offset
	.uleb128 Ltmp16-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp16-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp28-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp28-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp29-Lfunc_begin0            ;   ending offset
	.byte	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp29-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end1-Lfunc_begin0        ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc4:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp18-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp19-Lfunc_begin0            ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	17                              ; DW_OP_consts
	.byte	0                               ; 0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp19-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp23-Lfunc_begin0            ;   ending offset
	.byte	12                              ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	0                               ; 0
	.byte	17                              ; DW_OP_consts
	.byte	128                             ; 10000000
	.byte	173                             ; 
	.byte	226                             ; 
	.byte	4                               ; 
	.byte	28                              ; DW_OP_minus
	.byte	17                              ; DW_OP_consts
	.byte	127                             ; -1
	.byte	27                              ; DW_OP_div
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp23-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp24-Lfunc_begin0            ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	1                               ; 1
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp24-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp25-Lfunc_begin0            ;   ending offset
	.byte	15                              ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	0                               ; 0
	.byte	17                              ; DW_OP_consts
	.byte	128                             ; 10000000
	.byte	173                             ; 
	.byte	226                             ; 
	.byte	4                               ; 
	.byte	28                              ; DW_OP_minus
	.byte	17                              ; DW_OP_consts
	.byte	127                             ; -1
	.byte	27                              ; DW_OP_div
	.byte	17                              ; DW_OP_consts
	.byte	1                               ; 1
	.byte	34                              ; DW_OP_plus
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp29-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp30-Lfunc_begin0            ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	1                               ; 1
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp30-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end1-Lfunc_begin0        ;   ending offset
	.byte	12                              ; Loc expr size
	.byte	133                             ; DW_OP_breg21
	.byte	0                               ; 0
	.byte	17                              ; DW_OP_consts
	.byte	128                             ; 10000000
	.byte	173                             ; 
	.byte	226                             ; 
	.byte	4                               ; 
	.byte	28                              ; DW_OP_minus
	.byte	17                              ; DW_OP_consts
	.byte	127                             ; -1
	.byte	27                              ; DW_OP_div
	.byte	159                             ; DW_OP_stack_value
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc5:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp20-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp22-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp23-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp24-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp29-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp31-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc6:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Lfunc_begin2-Lfunc_begin0      ;   starting offset
	.uleb128 Ltmp33-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp33-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end2-Lfunc_begin0        ;   ending offset
	.byte	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc7:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Lfunc_begin2-Lfunc_begin0      ;   starting offset
	.uleb128 Ltmp34-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp34-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end2-Lfunc_begin0        ;   ending offset
	.byte	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	81                              ; DW_OP_reg1
	.byte	159                             ; DW_OP_stack_value
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc8:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp32-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp36-Lfunc_begin0            ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	17                              ; DW_OP_consts
	.byte	0                               ; 0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp36-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp49-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	141                             ; DW_OP_breg29
	.byte	108                             ; -20
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp49-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp54-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp55-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp63-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	141                             ; DW_OP_breg29
	.byte	108                             ; -20
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp63-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp64-Lfunc_begin0            ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	17                              ; DW_OP_consts
	.byte	0                               ; 0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp64-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp66-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	141                             ; DW_OP_breg29
	.byte	108                             ; -20
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp66-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end2-Lfunc_begin0        ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc9:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp35-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp37-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp38-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp40-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp41-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp43-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp44-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp45-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp47-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp48-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp51-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp53-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp55-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp57-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp59-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp61-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp63-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp67-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc10:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp36-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp43-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	32                              ; 32
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp43-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp44-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp64-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp66-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	32                              ; 32
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc11:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp39-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp46-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	24                              ; 24
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp46-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp47-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp55-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp59-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	24                              ; 24
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp65-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp66-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	24                              ; 24
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_list_header_end0:
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                               ; Abbreviation Code
	.byte	17                              ; DW_TAG_compile_unit
	.byte	1                               ; DW_CHILDREN_yes
	.byte	37                              ; DW_AT_producer
	.byte	37                              ; DW_FORM_strx1
	.byte	19                              ; DW_AT_language
	.byte	5                               ; DW_FORM_data2
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.ascii	"\202|"                         ; DW_AT_LLVM_sysroot
	.byte	37                              ; DW_FORM_strx1
	.ascii	"\357\177"                      ; DW_AT_APPLE_sdk
	.byte	37                              ; DW_FORM_strx1
	.byte	114                             ; DW_AT_str_offsets_base
	.byte	23                              ; DW_FORM_sec_offset
	.byte	16                              ; DW_AT_stmt_list
	.byte	23                              ; DW_FORM_sec_offset
	.byte	27                              ; DW_AT_comp_dir
	.byte	37                              ; DW_FORM_strx1
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	115                             ; DW_AT_addr_base
	.byte	23                              ; DW_FORM_sec_offset
	.byte	116                             ; DW_AT_rnglists_base
	.byte	23                              ; DW_FORM_sec_offset
	.ascii	"\214\001"                      ; DW_AT_loclists_base
	.byte	23                              ; DW_FORM_sec_offset
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	2                               ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	3                               ; Abbreviation Code
	.byte	1                               ; DW_TAG_array_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	4                               ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	5                               ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	7                               ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	8                               ; Abbreviation Code
	.byte	22                              ; DW_TAG_typedef
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	9                               ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	10                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	56                              ; DW_AT_data_member_location
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	11                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	12                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	13                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	34                              ; DW_FORM_loclistx
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	14                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	34                              ; DW_FORM_loclistx
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	15                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	16                              ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	85                              ; DW_AT_ranges
	.byte	35                              ; DW_FORM_rnglistx
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	17                              ; Abbreviation Code
	.byte	72                              ; DW_TAG_call_site
	.byte	0                               ; DW_CHILDREN_no
	.byte	127                             ; DW_AT_call_origin
	.byte	19                              ; DW_FORM_ref4
	.byte	125                             ; DW_AT_call_return_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	18                              ; Abbreviation Code
	.byte	72                              ; DW_TAG_call_site
	.byte	1                               ; DW_CHILDREN_yes
	.byte	127                             ; DW_AT_call_origin
	.byte	19                              ; DW_FORM_ref4
	.byte	125                             ; DW_AT_call_return_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	19                              ; Abbreviation Code
	.byte	73                              ; DW_TAG_call_site_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	126                             ; DW_AT_call_value
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	20                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	21                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	22                              ; Abbreviation Code
	.byte	24                              ; DW_TAG_unspecified_parameters
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	23                              ; Abbreviation Code
	.byte	55                              ; DW_TAG_restrict_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	25                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	26                              ; Abbreviation Code
	.byte	38                              ; DW_TAG_const_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	27                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	28                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	29                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	0                               ; DW_CHILDREN_no
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	110                             ; DW_AT_linkage_name
	.byte	37                              ; DW_FORM_strx1
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	30                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	11                              ; DW_AT_byte_size
	.byte	5                               ; DW_FORM_data2
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	31                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	32                              ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	33                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	110                             ; DW_AT_linkage_name
	.byte	37                              ; DW_FORM_strx1
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	34                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	35                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	36                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	0                               ; DW_CHILDREN_no
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.ascii	"\347\177"                      ; DW_AT_APPLE_omit_frame_ptr
	.byte	25                              ; DW_FORM_flag_present
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	110                             ; DW_AT_linkage_name
	.byte	37                              ; DW_FORM_strx1
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	52                              ; DW_AT_artificial
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	37                              ; Abbreviation Code
	.byte	53                              ; DW_TAG_volatile_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	0                               ; EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset13, Ldebug_info_end0-Ldebug_info_start0 ; Length of Unit
	.long	Lset13
Ldebug_info_start0:
	.short	5                               ; DWARF version number
	.byte	1                               ; DWARF Unit Type
	.byte	8                               ; Address Size (in bytes)
.set Lset14, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset14
	.byte	1                               ; Abbrev [1] 0xc:0x6ec DW_TAG_compile_unit
	.byte	0                               ; DW_AT_producer
	.short	29                              ; DW_AT_language
	.byte	1                               ; DW_AT_name
	.byte	2                               ; DW_AT_LLVM_sysroot
	.byte	3                               ; DW_AT_APPLE_sdk
.set Lset15, Lstr_offsets_base0-Lsection_str_off ; DW_AT_str_offsets_base
	.long	Lset15
.set Lset16, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset16
	.byte	4                               ; DW_AT_comp_dir
                                        ; DW_AT_APPLE_optimized
	.byte	14                              ; DW_AT_low_pc
.set Lset17, Lfunc_end12-Lfunc_begin0   ; DW_AT_high_pc
	.long	Lset17
.set Lset18, Laddr_table_base0-Lsection_info0 ; DW_AT_addr_base
	.long	Lset18
.set Lset19, Lrnglists_table_base0-Ldebug_range0 ; DW_AT_rnglists_base
	.long	Lset19
.set Lset20, Lloclists_table_base0-Lsection_debug_loc0 ; DW_AT_loclists_base
	.long	Lset20
	.byte	2                               ; Abbrev [2] 0x2d:0xa DW_TAG_variable
	.long	55                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	0
	.byte	3                               ; Abbrev [3] 0x37:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x3c:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	37                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x43:0x4 DW_TAG_base_type
	.byte	5                               ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	6                               ; Abbrev [6] 0x47:0x4 DW_TAG_base_type
	.byte	6                               ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	2                               ; Abbrev [2] 0x4b:0xa DW_TAG_variable
	.long	85                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	1
	.byte	3                               ; Abbrev [3] 0x55:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x5a:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	19                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x61:0xa DW_TAG_variable
	.long	107                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	64                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	2
	.byte	3                               ; Abbrev [3] 0x6b:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x70:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	21                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x77:0xa DW_TAG_variable
	.long	129                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	69                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	3
	.byte	3                               ; Abbrev [3] 0x81:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x86:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	27                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x8d:0xa DW_TAG_variable
	.long	55                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	79                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	4
	.byte	2                               ; Abbrev [2] 0x97:0xa DW_TAG_variable
	.long	129                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	5
	.byte	2                               ; Abbrev [2] 0xa1:0xa DW_TAG_variable
	.long	85                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	123                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	6
	.byte	2                               ; Abbrev [2] 0xab:0xa DW_TAG_variable
	.long	181                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	132                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	7
	.byte	3                               ; Abbrev [3] 0xb5:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xba:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	15                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xc1:0xa DW_TAG_variable
	.long	203                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	146                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	8
	.byte	3                               ; Abbrev [3] 0xcb:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xd0:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	13                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xd7:0xa DW_TAG_variable
	.long	225                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	9
	.byte	3                               ; Abbrev [3] 0xe1:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xe6:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	17                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xed:0xa DW_TAG_variable
	.long	247                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	10
	.byte	3                               ; Abbrev [3] 0xf7:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xfc:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	1                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x103:0xa DW_TAG_variable
	.long	269                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	11
	.byte	3                               ; Abbrev [3] 0x10d:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x112:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	5                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x119:0xa DW_TAG_variable
	.long	291                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	12
	.byte	3                               ; Abbrev [3] 0x123:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x128:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	22                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x12f:0xb DW_TAG_variable
	.byte	7                               ; DW_AT_name
	.long	314                             ; DW_AT_type
                                        ; DW_AT_external
	.byte	0                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	13
	.byte	8                               ; Abbrev [8] 0x13a:0x8 DW_TAG_typedef
	.long	322                             ; DW_AT_type
	.byte	13                              ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x142:0x8 DW_TAG_typedef
	.long	330                             ; DW_AT_type
	.byte	12                              ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	113                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x14a:0x18 DW_TAG_structure_type
	.byte	11                              ; DW_AT_name
	.byte	64                              ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	78                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x14f:0x9 DW_TAG_member
	.byte	8                               ; DW_AT_name
	.long	354                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	79                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x158:0x9 DW_TAG_member
	.byte	10                              ; DW_AT_name
	.long	358                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x162:0x4 DW_TAG_base_type
	.byte	9                               ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x166:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x16b:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	56                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x172:0x1 DW_TAG_pointer_type
	.byte	12                              ; Abbrev [12] 0x173:0x62 DW_TAG_subprogram
	.byte	14                              ; DW_AT_low_pc
.set Lset21, Lfunc_end0-Lfunc_begin0    ; DW_AT_high_pc
	.long	Lset21
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.byte	72                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	40                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	370                             ; DW_AT_type
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	13                              ; Abbrev [13] 0x182:0x9 DW_TAG_formal_parameter
	.byte	0                               ; DW_AT_location
	.byte	87                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	40                              ; DW_AT_decl_line
	.long	370                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x18b:0x9 DW_TAG_variable
	.byte	1                               ; DW_AT_location
	.byte	88                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.long	489                             ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x194:0x8 DW_TAG_variable
	.byte	90                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	43                              ; DW_AT_decl_line
	.long	1768                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x19c:0xc DW_TAG_lexical_block
	.byte	0                               ; DW_AT_ranges
	.byte	14                              ; Abbrev [14] 0x19e:0x9 DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	89                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	54                              ; DW_AT_decl_line
	.long	489                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x1a8:0x6 DW_TAG_call_site
	.long	469                             ; DW_AT_call_origin
	.byte	15                              ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x1ae:0xd DW_TAG_call_site
	.long	907                             ; DW_AT_call_origin
	.byte	16                              ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x1b4:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	132
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	18                              ; Abbrev [18] 0x1bb:0xd DW_TAG_call_site
	.long	927                             ; DW_AT_call_origin
	.byte	17                              ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x1c1:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	132
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x1c8:0x6 DW_TAG_call_site
	.long	942                             ; DW_AT_call_origin
	.byte	18                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x1ce:0x6 DW_TAG_call_site
	.long	952                             ; DW_AT_call_origin
	.byte	19                              ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x1d5:0x14 DW_TAG_subprogram
	.byte	14                              ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	245                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	489                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x1dd:0x5 DW_TAG_formal_parameter
	.long	493                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x1e2:0x5 DW_TAG_formal_parameter
	.long	902                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1e7:0x1 DW_TAG_unspecified_parameters
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x1e9:0x4 DW_TAG_base_type
	.byte	15                              ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	23                              ; Abbrev [23] 0x1ed:0x5 DW_TAG_restrict_type
	.long	498                             ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x1f2:0x5 DW_TAG_pointer_type
	.long	503                             ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x1f7:0x8 DW_TAG_typedef
	.long	511                             ; DW_AT_type
	.byte	47                              ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	162                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x1ff:0xba DW_TAG_structure_type
	.byte	46                              ; DW_AT_name
	.byte	152                             ; DW_AT_byte_size
	.byte	3                               ; DW_AT_decl_file
	.byte	131                             ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x204:0x9 DW_TAG_member
	.byte	16                              ; DW_AT_name
	.long	697                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	132                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x20d:0x9 DW_TAG_member
	.byte	18                              ; DW_AT_name
	.long	489                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	133                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x216:0x9 DW_TAG_member
	.byte	19                              ; DW_AT_name
	.long	489                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	134                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x21f:0x9 DW_TAG_member
	.byte	20                              ; DW_AT_name
	.long	706                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	135                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x228:0x9 DW_TAG_member
	.byte	22                              ; DW_AT_name
	.long	706                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	136                             ; DW_AT_decl_line
	.byte	18                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x231:0x9 DW_TAG_member
	.byte	23                              ; DW_AT_name
	.long	710                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	137                             ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x23a:0x9 DW_TAG_member
	.byte	27                              ; DW_AT_name
	.long	489                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	138                             ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x243:0x9 DW_TAG_member
	.byte	28                              ; DW_AT_name
	.long	370                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	141                             ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x24c:0x9 DW_TAG_member
	.byte	29                              ; DW_AT_name
	.long	734                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.byte	56                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x255:0x9 DW_TAG_member
	.byte	30                              ; DW_AT_name
	.long	750                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	143                             ; DW_AT_decl_line
	.byte	64                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x25e:0x9 DW_TAG_member
	.byte	31                              ; DW_AT_name
	.long	781                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
	.byte	72                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x267:0x9 DW_TAG_member
	.byte	36                              ; DW_AT_name
	.long	835                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.byte	80                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x270:0x9 DW_TAG_member
	.byte	37                              ; DW_AT_name
	.long	710                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	148                             ; DW_AT_decl_line
	.byte	88                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x279:0x9 DW_TAG_member
	.byte	38                              ; DW_AT_name
	.long	871                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	149                             ; DW_AT_decl_line
	.byte	104                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x282:0x9 DW_TAG_member
	.byte	40                              ; DW_AT_name
	.long	489                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	150                             ; DW_AT_decl_line
	.byte	112                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x28b:0x9 DW_TAG_member
	.byte	41                              ; DW_AT_name
	.long	878                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.byte	116                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x294:0x9 DW_TAG_member
	.byte	42                              ; DW_AT_name
	.long	890                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	154                             ; DW_AT_decl_line
	.byte	119                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x29d:0x9 DW_TAG_member
	.byte	43                              ; DW_AT_name
	.long	710                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	157                             ; DW_AT_decl_line
	.byte	120                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x2a6:0x9 DW_TAG_member
	.byte	44                              ; DW_AT_name
	.long	489                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.byte	136                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x2af:0x9 DW_TAG_member
	.byte	45                              ; DW_AT_name
	.long	807                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.byte	144                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x2b9:0x5 DW_TAG_pointer_type
	.long	702                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x2be:0x4 DW_TAG_base_type
	.byte	17                              ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	5                               ; Abbrev [5] 0x2c2:0x4 DW_TAG_base_type
	.byte	21                              ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	2                               ; DW_AT_byte_size
	.byte	9                               ; Abbrev [9] 0x2c6:0x18 DW_TAG_structure_type
	.byte	26                              ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	3                               ; DW_AT_decl_file
	.byte	97                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x2cb:0x9 DW_TAG_member
	.byte	24                              ; DW_AT_name
	.long	697                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	98                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x2d4:0x9 DW_TAG_member
	.byte	25                              ; DW_AT_name
	.long	489                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	99                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x2de:0x5 DW_TAG_pointer_type
	.long	739                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x2e3:0xb DW_TAG_subroutine_type
	.long	489                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x2e8:0x5 DW_TAG_formal_parameter
	.long	370                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x2ee:0x5 DW_TAG_pointer_type
	.long	755                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x2f3:0x15 DW_TAG_subroutine_type
	.long	489                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x2f8:0x5 DW_TAG_formal_parameter
	.long	370                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x2fd:0x5 DW_TAG_formal_parameter
	.long	776                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x302:0x5 DW_TAG_formal_parameter
	.long	489                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x308:0x5 DW_TAG_pointer_type
	.long	67                              ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x30d:0x5 DW_TAG_pointer_type
	.long	786                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x312:0x15 DW_TAG_subroutine_type
	.long	807                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x317:0x5 DW_TAG_formal_parameter
	.long	370                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x31c:0x5 DW_TAG_formal_parameter
	.long	807                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x321:0x5 DW_TAG_formal_parameter
	.long	489                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	8                               ; Abbrev [8] 0x327:0x8 DW_TAG_typedef
	.long	815                             ; DW_AT_type
	.byte	35                              ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x32f:0x8 DW_TAG_typedef
	.long	823                             ; DW_AT_type
	.byte	34                              ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x337:0x8 DW_TAG_typedef
	.long	831                             ; DW_AT_type
	.byte	33                              ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	37                              ; DW_AT_decl_line
	.byte	5                               ; Abbrev [5] 0x33f:0x4 DW_TAG_base_type
	.byte	32                              ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	24                              ; Abbrev [24] 0x343:0x5 DW_TAG_pointer_type
	.long	840                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x348:0x15 DW_TAG_subroutine_type
	.long	489                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x34d:0x5 DW_TAG_formal_parameter
	.long	370                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x352:0x5 DW_TAG_formal_parameter
	.long	861                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x357:0x5 DW_TAG_formal_parameter
	.long	489                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x35d:0x5 DW_TAG_pointer_type
	.long	866                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x362:0x5 DW_TAG_const_type
	.long	67                              ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x367:0x5 DW_TAG_pointer_type
	.long	876                             ; DW_AT_type
	.byte	27                              ; Abbrev [27] 0x36c:0x2 DW_TAG_structure_type
	.byte	39                              ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	3                               ; Abbrev [3] 0x36e:0xc DW_TAG_array_type
	.long	702                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x373:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	3                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x37a:0xc DW_TAG_array_type
	.long	702                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x37f:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	1                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x386:0x5 DW_TAG_restrict_type
	.long	861                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x38b:0xf DW_TAG_subprogram
	.byte	48                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	393                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	489                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x394:0x5 DW_TAG_formal_parameter
	.long	922                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x39a:0x5 DW_TAG_pointer_type
	.long	314                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x39f:0xf DW_TAG_subprogram
	.byte	49                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	405                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	489                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x3a8:0x5 DW_TAG_formal_parameter
	.long	922                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	29                              ; Abbrev [29] 0x3ae:0xa DW_TAG_subprogram
	.byte	43                              ; DW_AT_low_pc
.set Lset22, Lfunc_end4-Lfunc_begin4    ; DW_AT_high_pc
	.long	Lset22
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	76                              ; DW_AT_linkage_name
	.byte	76                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	29                              ; Abbrev [29] 0x3b8:0xa DW_TAG_subprogram
	.byte	42                              ; DW_AT_low_pc
.set Lset23, Lfunc_end3-Lfunc_begin3    ; DW_AT_high_pc
	.long	Lset23
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	75                              ; DW_AT_linkage_name
	.byte	75                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	12                              ; Abbrev [12] 0x3c2:0x62 DW_TAG_subprogram
	.byte	20                              ; DW_AT_low_pc
.set Lset24, Lfunc_end1-Lfunc_begin1    ; DW_AT_high_pc
	.long	Lset24
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.byte	73                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	370                             ; DW_AT_type
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	13                              ; Abbrev [13] 0x3d1:0x9 DW_TAG_formal_parameter
	.byte	3                               ; DW_AT_location
	.byte	87                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	370                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x3da:0x9 DW_TAG_variable
	.byte	4                               ; DW_AT_location
	.byte	88                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	76                              ; DW_AT_decl_line
	.long	489                             ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x3e3:0x8 DW_TAG_variable
	.byte	90                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	1768                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x3eb:0xc DW_TAG_lexical_block
	.byte	1                               ; DW_AT_ranges
	.byte	14                              ; Abbrev [14] 0x3ed:0x9 DW_TAG_variable
	.byte	5                               ; DW_AT_location
	.byte	89                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.long	489                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x3f7:0x6 DW_TAG_call_site
	.long	469                             ; DW_AT_call_origin
	.byte	21                              ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x3fd:0xd DW_TAG_call_site
	.long	907                             ; DW_AT_call_origin
	.byte	22                              ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x403:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	132
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	18                              ; Abbrev [18] 0x40a:0xd DW_TAG_call_site
	.long	927                             ; DW_AT_call_origin
	.byte	23                              ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x410:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	132
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x417:0x6 DW_TAG_call_site
	.long	1060                            ; DW_AT_call_origin
	.byte	24                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x41d:0x6 DW_TAG_call_site
	.long	1070                            ; DW_AT_call_origin
	.byte	25                              ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	29                              ; Abbrev [29] 0x424:0xa DW_TAG_subprogram
	.byte	45                              ; DW_AT_low_pc
.set Lset25, Lfunc_end6-Lfunc_begin6    ; DW_AT_high_pc
	.long	Lset25
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	78                              ; DW_AT_linkage_name
	.byte	78                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	29                              ; Abbrev [29] 0x42e:0xa DW_TAG_subprogram
	.byte	44                              ; DW_AT_low_pc
.set Lset26, Lfunc_end5-Lfunc_begin5    ; DW_AT_high_pc
	.long	Lset26
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	77                              ; DW_AT_linkage_name
	.byte	77                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	12                              ; Abbrev [12] 0x438:0xde DW_TAG_subprogram
	.byte	26                              ; DW_AT_low_pc
.set Lset27, Lfunc_end2-Lfunc_begin2    ; DW_AT_high_pc
	.long	Lset27
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.byte	74                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	489                             ; DW_AT_type
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	13                              ; Abbrev [13] 0x447:0x9 DW_TAG_formal_parameter
	.byte	6                               ; DW_AT_location
	.byte	91                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.long	489                             ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x450:0x9 DW_TAG_formal_parameter
	.byte	7                               ; DW_AT_location
	.byte	92                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.long	1778                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x459:0x9 DW_TAG_variable
	.byte	8                               ; DW_AT_location
	.byte	93                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	489                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x462:0x9 DW_TAG_variable
	.byte	9                               ; DW_AT_location
	.byte	89                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	489                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x46b:0x9 DW_TAG_variable
	.byte	10                              ; DW_AT_location
	.byte	94                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	112                             ; DW_AT_decl_line
	.long	1434                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x474:0x9 DW_TAG_variable
	.byte	11                              ; DW_AT_location
	.byte	95                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	112                             ; DW_AT_decl_line
	.long	1434                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x47d:0x8 DW_TAG_variable
	.byte	96                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	489                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x485:0xc DW_TAG_call_site
	.long	1302                            ; DW_AT_call_origin
	.byte	27                              ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x48b:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	0                               ; End Of Children Mark
	.byte	18                              ; Abbrev [18] 0x491:0x18 DW_TAG_call_site
	.long	1394                            ; DW_AT_call_origin
	.byte	28                              ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x497:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	19                              ; Abbrev [19] 0x49c:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	83
	.byte	2                               ; DW_AT_call_value
	.byte	145
	.byte	108
	.byte	19                              ; Abbrev [19] 0x4a2:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	143
	.byte	32
	.byte	0                               ; End Of Children Mark
	.byte	18                              ; Abbrev [18] 0x4a9:0x18 DW_TAG_call_site
	.long	1394                            ; DW_AT_call_origin
	.byte	29                              ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x4af:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	19                              ; Abbrev [19] 0x4b4:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	83
	.byte	2                               ; DW_AT_call_value
	.byte	145
	.byte	108
	.byte	19                              ; Abbrev [19] 0x4ba:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	143
	.byte	24
	.byte	0                               ; End Of Children Mark
	.byte	18                              ; Abbrev [18] 0x4c1:0xc DW_TAG_call_site
	.long	1628                            ; DW_AT_call_origin
	.byte	30                              ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x4c7:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	0                               ; End Of Children Mark
	.byte	18                              ; Abbrev [18] 0x4cd:0xc DW_TAG_call_site
	.long	1628                            ; DW_AT_call_origin
	.byte	31                              ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x4d3:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x4d9:0x6 DW_TAG_call_site
	.long	1654                            ; DW_AT_call_origin
	.byte	32                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x4df:0x6 DW_TAG_call_site
	.long	1669                            ; DW_AT_call_origin
	.byte	33                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x4e5:0x6 DW_TAG_call_site
	.long	1684                            ; DW_AT_call_origin
	.byte	34                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x4eb:0x6 DW_TAG_call_site
	.long	1697                            ; DW_AT_call_origin
	.byte	35                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x4f1:0x6 DW_TAG_call_site
	.long	1684                            ; DW_AT_call_origin
	.byte	36                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x4f7:0x6 DW_TAG_call_site
	.long	1697                            ; DW_AT_call_origin
	.byte	37                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x4fd:0x6 DW_TAG_call_site
	.long	1708                            ; DW_AT_call_origin
	.byte	38                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x503:0x6 DW_TAG_call_site
	.long	1718                            ; DW_AT_call_origin
	.byte	39                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x509:0x6 DW_TAG_call_site
	.long	1728                            ; DW_AT_call_origin
	.byte	40                              ; DW_AT_call_return_pc
	.byte	17                              ; Abbrev [17] 0x50f:0x6 DW_TAG_call_site
	.long	1738                            ; DW_AT_call_origin
	.byte	41                              ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	28                              ; Abbrev [28] 0x516:0x14 DW_TAG_subprogram
	.byte	50                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	388                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	489                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x51f:0x5 DW_TAG_formal_parameter
	.long	1322                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x524:0x5 DW_TAG_formal_parameter
	.long	1327                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x52a:0x5 DW_TAG_restrict_type
	.long	922                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x52f:0x5 DW_TAG_restrict_type
	.long	1332                            ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x534:0x5 DW_TAG_pointer_type
	.long	1337                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x539:0x5 DW_TAG_const_type
	.long	1342                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x53e:0x8 DW_TAG_typedef
	.long	1350                            ; DW_AT_type
	.byte	53                              ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x546:0x8 DW_TAG_typedef
	.long	1358                            ; DW_AT_type
	.byte	52                              ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	114                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x54e:0x18 DW_TAG_structure_type
	.byte	51                              ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x553:0x9 DW_TAG_member
	.byte	8                               ; DW_AT_name
	.long	354                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x55c:0x9 DW_TAG_member
	.byte	10                              ; DW_AT_name
	.long	1382                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	85                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x566:0xc DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x56b:0x6 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.byte	8                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	28                              ; Abbrev [28] 0x572:0x1e DW_TAG_subprogram
	.byte	54                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	338                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	489                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x57b:0x5 DW_TAG_formal_parameter
	.long	1424                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x580:0x5 DW_TAG_formal_parameter
	.long	1552                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x585:0x5 DW_TAG_formal_parameter
	.long	1607                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x58a:0x5 DW_TAG_formal_parameter
	.long	1623                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x590:0x5 DW_TAG_restrict_type
	.long	1429                            ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x595:0x5 DW_TAG_pointer_type
	.long	1434                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x59a:0x8 DW_TAG_typedef
	.long	1442                            ; DW_AT_type
	.byte	62                              ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x5a2:0x8 DW_TAG_typedef
	.long	1450                            ; DW_AT_type
	.byte	61                              ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	118                             ; DW_AT_decl_line
	.byte	24                              ; Abbrev [24] 0x5aa:0x5 DW_TAG_pointer_type
	.long	1455                            ; DW_AT_type
	.byte	30                              ; Abbrev [30] 0x5af:0x22 DW_TAG_structure_type
	.byte	60                              ; DW_AT_name
	.short	8192                            ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x5b5:0x9 DW_TAG_member
	.byte	8                               ; DW_AT_name
	.long	354                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	104                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x5be:0x9 DW_TAG_member
	.byte	55                              ; DW_AT_name
	.long	1489                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	105                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x5c7:0x9 DW_TAG_member
	.byte	10                              ; DW_AT_name
	.long	1539                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x5d1:0x5 DW_TAG_pointer_type
	.long	1494                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x5d6:0x21 DW_TAG_structure_type
	.byte	59                              ; DW_AT_name
	.byte	24                              ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x5db:0x9 DW_TAG_member
	.byte	56                              ; DW_AT_name
	.long	1527                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	58                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x5e4:0x9 DW_TAG_member
	.byte	57                              ; DW_AT_name
	.long	370                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x5ed:0x9 DW_TAG_member
	.byte	58                              ; DW_AT_name
	.long	1489                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x5f7:0x5 DW_TAG_pointer_type
	.long	1532                            ; DW_AT_type
	.byte	31                              ; Abbrev [31] 0x5fc:0x7 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x5fd:0x5 DW_TAG_formal_parameter
	.long	370                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x603:0xd DW_TAG_array_type
	.long	67                              ; DW_AT_type
	.byte	32                              ; Abbrev [32] 0x608:0x7 DW_TAG_subrange_type
	.long	71                              ; DW_AT_type
	.short	8176                            ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x610:0x5 DW_TAG_restrict_type
	.long	1557                            ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x615:0x5 DW_TAG_pointer_type
	.long	1562                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x61a:0x5 DW_TAG_const_type
	.long	1567                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x61f:0x8 DW_TAG_typedef
	.long	1575                            ; DW_AT_type
	.byte	65                              ; DW_AT_name
	.byte	9                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x627:0x8 DW_TAG_typedef
	.long	1583                            ; DW_AT_type
	.byte	64                              ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x62f:0x18 DW_TAG_structure_type
	.byte	63                              ; DW_AT_name
	.byte	64                              ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	63                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x634:0x9 DW_TAG_member
	.byte	8                               ; DW_AT_name
	.long	354                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	64                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x63d:0x9 DW_TAG_member
	.byte	10                              ; DW_AT_name
	.long	358                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x647:0x5 DW_TAG_pointer_type
	.long	1612                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x64c:0xb DW_TAG_subroutine_type
	.long	370                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x651:0x5 DW_TAG_formal_parameter
	.long	370                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x657:0x5 DW_TAG_restrict_type
	.long	370                             ; DW_AT_type
	.byte	33                              ; Abbrev [33] 0x65c:0x15 DW_TAG_subprogram
	.byte	66                              ; DW_AT_linkage_name
	.byte	67                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	371                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	489                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x666:0x5 DW_TAG_formal_parameter
	.long	1434                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x66b:0x5 DW_TAG_formal_parameter
	.long	1649                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x671:0x5 DW_TAG_pointer_type
	.long	370                             ; DW_AT_type
	.byte	20                              ; Abbrev [20] 0x676:0xf DW_TAG_subprogram
	.byte	68                              ; DW_AT_name
	.byte	10                              ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	489                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x67e:0x5 DW_TAG_formal_parameter
	.long	902                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x683:0x1 DW_TAG_unspecified_parameters
	.byte	0                               ; End Of Children Mark
	.byte	28                              ; Abbrev [28] 0x685:0xf DW_TAG_subprogram
	.byte	69                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	381                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	489                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x68e:0x5 DW_TAG_formal_parameter
	.long	922                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	34                              ; Abbrev [34] 0x694:0x8 DW_TAG_subprogram
	.byte	70                              ; DW_AT_name
	.byte	11                              ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1692                            ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	24                              ; Abbrev [24] 0x69c:0x5 DW_TAG_pointer_type
	.long	489                             ; DW_AT_type
	.byte	35                              ; Abbrev [35] 0x6a1:0xb DW_TAG_subprogram
	.byte	71                              ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.short	264                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x6a6:0x5 DW_TAG_formal_parameter
	.long	861                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	29                              ; Abbrev [29] 0x6ac:0xa DW_TAG_subprogram
	.byte	46                              ; DW_AT_low_pc
.set Lset28, Lfunc_end7-Lfunc_begin7    ; DW_AT_high_pc
	.long	Lset28
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	79                              ; DW_AT_linkage_name
	.byte	79                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	29                              ; Abbrev [29] 0x6b6:0xa DW_TAG_subprogram
	.byte	47                              ; DW_AT_low_pc
.set Lset29, Lfunc_end8-Lfunc_begin8    ; DW_AT_high_pc
	.long	Lset29
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	80                              ; DW_AT_linkage_name
	.byte	80                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	29                              ; Abbrev [29] 0x6c0:0xa DW_TAG_subprogram
	.byte	48                              ; DW_AT_low_pc
.set Lset30, Lfunc_end9-Lfunc_begin9    ; DW_AT_high_pc
	.long	Lset30
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	81                              ; DW_AT_linkage_name
	.byte	81                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	29                              ; Abbrev [29] 0x6ca:0xa DW_TAG_subprogram
	.byte	49                              ; DW_AT_low_pc
.set Lset31, Lfunc_end10-Lfunc_begin10  ; DW_AT_high_pc
	.long	Lset31
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	82                              ; DW_AT_linkage_name
	.byte	82                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	36                              ; Abbrev [36] 0x6d4:0xa DW_TAG_subprogram
	.byte	50                              ; DW_AT_low_pc
.set Lset32, Lfunc_end11-Lfunc_begin11  ; DW_AT_high_pc
	.long	Lset32
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	83                              ; DW_AT_linkage_name
	.byte	84                              ; DW_AT_name
                                        ; DW_AT_artificial
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	36                              ; Abbrev [36] 0x6de:0xa DW_TAG_subprogram
	.byte	51                              ; DW_AT_low_pc
.set Lset33, Lfunc_end12-Lfunc_begin12  ; DW_AT_high_pc
	.long	Lset33
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	85                              ; DW_AT_linkage_name
	.byte	86                              ; DW_AT_name
                                        ; DW_AT_artificial
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	24                              ; Abbrev [24] 0x6e8:0x5 DW_TAG_pointer_type
	.long	1773                            ; DW_AT_type
	.byte	37                              ; Abbrev [37] 0x6ed:0x5 DW_TAG_volatile_type
	.long	489                             ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x6f2:0x5 DW_TAG_pointer_type
	.long	776                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_rnglists,regular,debug
Ldebug_range0:
.set Lset34, Ldebug_list_header_end1-Ldebug_list_header_start1 ; Length
	.long	Lset34
Ldebug_list_header_start1:
	.short	5                               ; Version
	.byte	8                               ; Address size
	.byte	0                               ; Segment selector size
	.long	2                               ; Offset entry count
Lrnglists_table_base0:
.set Lset35, Ldebug_ranges0-Lrnglists_table_base0
	.long	Lset35
.set Lset36, Ldebug_ranges1-Lrnglists_table_base0
	.long	Lset36
Ldebug_ranges0:
	.byte	4                               ; DW_RLE_offset_pair
	.uleb128 Ltmp3-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp8-Lfunc_begin0             ;   ending offset
	.byte	4                               ; DW_RLE_offset_pair
	.uleb128 Ltmp13-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp15-Lfunc_begin0            ;   ending offset
	.byte	0                               ; DW_RLE_end_of_list
Ldebug_ranges1:
	.byte	4                               ; DW_RLE_offset_pair
	.uleb128 Ltmp19-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp24-Lfunc_begin0            ;   ending offset
	.byte	4                               ; DW_RLE_offset_pair
	.uleb128 Ltmp29-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp31-Lfunc_begin0            ;   ending offset
	.byte	0                               ; DW_RLE_end_of_list
Ldebug_list_header_end1:
	.section	__DWARF,__debug_str_offs,regular,debug
Lsection_str_off:
	.long	392                             ; Length of String Offsets Set
	.short	5
	.short	0
Lstr_offsets_base0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 17.0.0 (clang-1700.0.13.5)" ; string offset=0
	.asciz	"simplesync.c"                  ; string offset=47
	.asciz	"/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk" ; string offset=60
	.asciz	"MacOSX.sdk"                    ; string offset=112
	.asciz	"/Users/dionysiskatsetis/OsLab/lab2_ans" ; string offset=123
	.asciz	"char"                          ; string offset=162
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=167
	.asciz	"mutex"                         ; string offset=187
	.asciz	"pthread_mutex_t"               ; string offset=193
	.asciz	"__darwin_pthread_mutex_t"      ; string offset=209
	.asciz	"_opaque_pthread_mutex_t"       ; string offset=234
	.asciz	"__sig"                         ; string offset=258
	.asciz	"long"                          ; string offset=264
	.asciz	"__opaque"                      ; string offset=269
	.asciz	"increase_fn"                   ; string offset=278
	.asciz	"fprintf"                       ; string offset=290
	.asciz	"int"                           ; string offset=298
	.asciz	"FILE"                          ; string offset=302
	.asciz	"__sFILE"                       ; string offset=307
	.asciz	"_p"                            ; string offset=315
	.asciz	"unsigned char"                 ; string offset=318
	.asciz	"_r"                            ; string offset=332
	.asciz	"_w"                            ; string offset=335
	.asciz	"_flags"                        ; string offset=338
	.asciz	"short"                         ; string offset=345
	.asciz	"_file"                         ; string offset=351
	.asciz	"_bf"                           ; string offset=357
	.asciz	"__sbuf"                        ; string offset=361
	.asciz	"_base"                         ; string offset=368
	.asciz	"_size"                         ; string offset=374
	.asciz	"_lbfsize"                      ; string offset=380
	.asciz	"_cookie"                       ; string offset=389
	.asciz	"_close"                        ; string offset=397
	.asciz	"_read"                         ; string offset=404
	.asciz	"_seek"                         ; string offset=410
	.asciz	"fpos_t"                        ; string offset=416
	.asciz	"__darwin_off_t"                ; string offset=423
	.asciz	"__int64_t"                     ; string offset=438
	.asciz	"long long"                     ; string offset=448
	.asciz	"_write"                        ; string offset=458
	.asciz	"_ub"                           ; string offset=465
	.asciz	"_extra"                        ; string offset=469
	.asciz	"__sFILEX"                      ; string offset=476
	.asciz	"_ur"                           ; string offset=485
	.asciz	"_ubuf"                         ; string offset=489
	.asciz	"_nbuf"                         ; string offset=495
	.asciz	"_lb"                           ; string offset=501
	.asciz	"_blksize"                      ; string offset=505
	.asciz	"_offset"                       ; string offset=514
	.asciz	"pthread_mutex_lock"            ; string offset=522
	.asciz	"pthread_mutex_unlock"          ; string offset=541
	.asciz	"decrease_fn"                   ; string offset=562
	.asciz	"main"                          ; string offset=574
	.asciz	"pthread_mutex_init"            ; string offset=579
	.asciz	"pthread_mutexattr_t"           ; string offset=598
	.asciz	"__darwin_pthread_mutexattr_t"  ; string offset=618
	.asciz	"_opaque_pthread_mutexattr_t"   ; string offset=647
	.asciz	"pthread_create"                ; string offset=675
	.asciz	"pthread_t"                     ; string offset=690
	.asciz	"__darwin_pthread_t"            ; string offset=700
	.asciz	"_opaque_pthread_t"             ; string offset=719
	.asciz	"__cleanup_stack"               ; string offset=737
	.asciz	"__darwin_pthread_handler_rec"  ; string offset=753
	.asciz	"__routine"                     ; string offset=782
	.asciz	"__arg"                         ; string offset=792
	.asciz	"__next"                        ; string offset=798
	.asciz	"pthread_attr_t"                ; string offset=805
	.asciz	"__darwin_pthread_attr_t"       ; string offset=820
	.asciz	"_opaque_pthread_attr_t"        ; string offset=844
	.asciz	"_pthread_join"                 ; string offset=867
	.asciz	"pthread_join"                  ; string offset=881
	.asciz	"printf"                        ; string offset=894
	.asciz	"pthread_mutex_destroy"         ; string offset=901
	.asciz	"__error"                       ; string offset=923
	.asciz	"perror"                        ; string offset=931
	.asciz	"increase_fn.cold.1"            ; string offset=938
	.asciz	"increase_fn.cold.2"            ; string offset=957
	.asciz	"decrease_fn.cold.1"            ; string offset=976
	.asciz	"decrease_fn.cold.2"            ; string offset=995
	.asciz	"main.cold.1"                   ; string offset=1014
	.asciz	"main.cold.2"                   ; string offset=1026
	.asciz	"main.cold.3"                   ; string offset=1038
	.asciz	"main.cold.4"                   ; string offset=1050
	.asciz	"OUTLINED_FUNCTION_0"           ; string offset=1062
	.asciz	"_OUTLINED_FUNCTION_0"          ; string offset=1082
	.asciz	"OUTLINED_FUNCTION_1"           ; string offset=1103
	.asciz	"_OUTLINED_FUNCTION_1"          ; string offset=1123
	.asciz	"arg"                           ; string offset=1144
	.asciz	"i"                             ; string offset=1148
	.asciz	"ret"                           ; string offset=1150
	.asciz	"ip"                            ; string offset=1154
	.asciz	"argc"                          ; string offset=1157
	.asciz	"argv"                          ; string offset=1162
	.asciz	"val"                           ; string offset=1167
	.asciz	"t1"                            ; string offset=1171
	.asciz	"t2"                            ; string offset=1174
	.asciz	"ok"                            ; string offset=1177
	.section	__DWARF,__debug_str_offs,regular,debug
	.long	0
	.long	47
	.long	60
	.long	112
	.long	123
	.long	162
	.long	167
	.long	187
	.long	258
	.long	264
	.long	269
	.long	234
	.long	209
	.long	193
	.long	290
	.long	298
	.long	315
	.long	318
	.long	332
	.long	335
	.long	338
	.long	345
	.long	351
	.long	357
	.long	368
	.long	374
	.long	361
	.long	380
	.long	389
	.long	397
	.long	404
	.long	410
	.long	448
	.long	438
	.long	423
	.long	416
	.long	458
	.long	465
	.long	469
	.long	476
	.long	485
	.long	489
	.long	495
	.long	501
	.long	505
	.long	514
	.long	307
	.long	302
	.long	522
	.long	541
	.long	579
	.long	647
	.long	618
	.long	598
	.long	675
	.long	737
	.long	782
	.long	792
	.long	798
	.long	753
	.long	719
	.long	700
	.long	690
	.long	844
	.long	820
	.long	805
	.long	867
	.long	881
	.long	894
	.long	901
	.long	923
	.long	931
	.long	278
	.long	562
	.long	574
	.long	938
	.long	957
	.long	976
	.long	995
	.long	1014
	.long	1026
	.long	1038
	.long	1050
	.long	1082
	.long	1062
	.long	1123
	.long	1103
	.long	1144
	.long	1148
	.long	1150
	.long	1154
	.long	1157
	.long	1162
	.long	1167
	.long	1171
	.long	1174
	.long	1177
	.section	__DWARF,__debug_addr,regular,debug
Lsection_info0:
.set Lset37, Ldebug_addr_end0-Ldebug_addr_start0 ; Length of contribution
	.long	Lset37
Ldebug_addr_start0:
	.short	5                               ; DWARF version number
	.byte	8                               ; Address size
	.byte	0                               ; Segment selector size
Laddr_table_base0:
	.quad	l_.str
	.quad	l_.str.1
	.quad	l_.str.2
	.quad	l_.str.3
	.quad	l_.str.4
	.quad	l_.str.5
	.quad	l_.str.6
	.quad	l_.str.7
	.quad	l_.str.8
	.quad	l_.str.9
	.quad	l_.str.10
	.quad	l_.str.11
	.quad	l_.str.12
	.quad	_mutex
	.quad	Lfunc_begin0
	.quad	Ltmp2
	.quad	Ltmp4
	.quad	Ltmp7
	.quad	Ltmp14
	.quad	Ltmp15
	.quad	Lfunc_begin1
	.quad	Ltmp18
	.quad	Ltmp20
	.quad	Ltmp23
	.quad	Ltmp30
	.quad	Ltmp31
	.quad	Lfunc_begin2
	.quad	Ltmp35
	.quad	Ltmp38
	.quad	Ltmp41
	.quad	Ltmp44
	.quad	Ltmp47
	.quad	Ltmp50
	.quad	Ltmp51
	.quad	Ltmp57
	.quad	Ltmp58
	.quad	Ltmp61
	.quad	Ltmp62
	.quad	Ltmp64
	.quad	Ltmp65
	.quad	Ltmp66
	.quad	Ltmp67
	.quad	Lfunc_begin3
	.quad	Lfunc_begin4
	.quad	Lfunc_begin5
	.quad	Lfunc_begin6
	.quad	Lfunc_begin7
	.quad	Lfunc_begin8
	.quad	Lfunc_begin9
	.quad	Lfunc_begin10
	.quad	Lfunc_begin11
	.quad	Lfunc_begin12
Ldebug_addr_end0:
	.section	__DWARF,__debug_names,regular,debug
Ldebug_names_begin:
.set Lset38, Lnames_end0-Lnames_start0  ; Header: unit length
	.long	Lset38
Lnames_start0:
	.short	5                               ; Header: version
	.short	0                               ; Header: padding
	.long	1                               ; Header: compilation unit count
	.long	0                               ; Header: local type unit count
	.long	0                               ; Header: foreign type unit count
	.long	21                              ; Header: bucket count
	.long	42                              ; Header: name count
.set Lset39, Lnames_abbrev_end0-Lnames_abbrev_start0 ; Header: abbreviation table size
	.long	Lset39
	.long	8                               ; Header: augmentation string size
	.ascii	"LLVM0700"                      ; Header: augmentation string
.set Lset40, Lcu_begin0-Lsection_info   ; Compilation unit 0
	.long	Lset40
	.long	1                               ; Bucket 0
	.long	2                               ; Bucket 1
	.long	4                               ; Bucket 2
	.long	5                               ; Bucket 3
	.long	6                               ; Bucket 4
	.long	9                               ; Bucket 5
	.long	13                              ; Bucket 6
	.long	16                              ; Bucket 7
	.long	19                              ; Bucket 8
	.long	21                              ; Bucket 9
	.long	22                              ; Bucket 10
	.long	24                              ; Bucket 11
	.long	26                              ; Bucket 12
	.long	28                              ; Bucket 13
	.long	32                              ; Bucket 14
	.long	33                              ; Bucket 15
	.long	36                              ; Bucket 16
	.long	37                              ; Bucket 17
	.long	39                              ; Bucket 18
	.long	41                              ; Bucket 19
	.long	42                              ; Bucket 20
	.long	-461612197                      ; Hash in Bucket 0
	.long	-440181150                      ; Hash in Bucket 1
	.long	-34160304                       ; Hash in Bucket 1
	.long	217009403                       ; Hash in Bucket 2
	.long	1297205472                      ; Hash in Bucket 3
	.long	274395349                       ; Hash in Bucket 4
	.long	-1921963995                     ; Hash in Bucket 4
	.long	-143589579                      ; Hash in Bucket 4
	.long	730786460                       ; Hash in Bucket 5
	.long	2056321622                      ; Hash in Bucket 5
	.long	2090147939                      ; Hash in Bucket 5
	.long	-328142765                      ; Hash in Bucket 5
	.long	730786461                       ; Hash in Bucket 6
	.long	-154593283                      ; Hash in Bucket 6
	.long	-39540541                       ; Hash in Bucket 6
	.long	1015836598                      ; Hash in Bucket 7
	.long	-154593282                      ; Hash in Bucket 7
	.long	-39540540                       ; Hash in Bucket 7
	.long	267752024                       ; Hash in Bucket 8
	.long	943712540                       ; Hash in Bucket 8
	.long	647281140                       ; Hash in Bucket 9
	.long	2090499946                      ; Hash in Bucket 10
	.long	-1601712561                     ; Hash in Bucket 10
	.long	519921938                       ; Hash in Bucket 11
	.long	-843299471                      ; Hash in Bucket 11
	.long	1261628793                      ; Hash in Bucket 12
	.long	-843299470                      ; Hash in Bucket 12
	.long	1261628794                      ; Hash in Bucket 13
	.long	2090257189                      ; Hash in Bucket 13
	.long	-1656140253                     ; Hash in Bucket 13
	.long	-565815948                      ; Hash in Bucket 13
	.long	1261628795                      ; Hash in Bucket 14
	.long	1261628796                      ; Hash in Bucket 15
	.long	1950644907                      ; Hash in Bucket 15
	.long	2090479413                      ; Hash in Bucket 15
	.long	77135977                        ; Hash in Bucket 16
	.long	193495088                       ; Hash in Bucket 17
	.long	-1235945222                     ; Hash in Bucket 17
	.long	1595644866                      ; Hash in Bucket 18
	.long	2065860549                      ; Hash in Bucket 18
	.long	922188013                       ; Hash in Bucket 19
	.long	-104093792                      ; Hash in Bucket 20
	.long	234                             ; String in Bucket 0: _opaque_pthread_mutex_t
	.long	278                             ; String in Bucket 1: increase_fn
	.long	416                             ; String in Bucket 1: fpos_t
	.long	167                             ; String in Bucket 2: __ARRAY_SIZE_TYPE__
	.long	690                             ; String in Bucket 3: pthread_t
	.long	345                             ; String in Bucket 4: short
	.long	448                             ; String in Bucket 4: long long
	.long	423                             ; String in Bucket 4: __darwin_off_t
	.long	1082                            ; String in Bucket 5: _OUTLINED_FUNCTION_0
	.long	307                             ; String in Bucket 5: __sFILE
	.long	162                             ; String in Bucket 5: char
	.long	361                             ; String in Bucket 5: __sbuf
	.long	1123                            ; String in Bucket 6: _OUTLINED_FUNCTION_1
	.long	1062                            ; String in Bucket 6: OUTLINED_FUNCTION_0
	.long	976                             ; String in Bucket 6: decrease_fn.cold.1
	.long	647                             ; String in Bucket 7: _opaque_pthread_mutexattr_t
	.long	1103                            ; String in Bucket 7: OUTLINED_FUNCTION_1
	.long	995                             ; String in Bucket 7: decrease_fn.cold.2
	.long	187                             ; String in Bucket 8: mutex
	.long	820                             ; String in Bucket 8: __darwin_pthread_attr_t
	.long	562                             ; String in Bucket 9: decrease_fn
	.long	574                             ; String in Bucket 10: main
	.long	618                             ; String in Bucket 10: __darwin_pthread_mutexattr_t
	.long	193                             ; String in Bucket 11: pthread_mutex_t
	.long	938                             ; String in Bucket 11: increase_fn.cold.1
	.long	1014                            ; String in Bucket 12: main.cold.1
	.long	957                             ; String in Bucket 12: increase_fn.cold.2
	.long	1026                            ; String in Bucket 13: main.cold.2
	.long	302                             ; String in Bucket 13: FILE
	.long	844                             ; String in Bucket 13: _opaque_pthread_attr_t
	.long	209                             ; String in Bucket 13: __darwin_pthread_mutex_t
	.long	1038                            ; String in Bucket 14: main.cold.3
	.long	1050                            ; String in Bucket 15: main.cold.4
	.long	438                             ; String in Bucket 15: __int64_t
	.long	264                             ; String in Bucket 15: long
	.long	719                             ; String in Bucket 16: _opaque_pthread_t
	.long	298                             ; String in Bucket 17: int
	.long	805                             ; String in Bucket 17: pthread_attr_t
	.long	700                             ; String in Bucket 18: __darwin_pthread_t
	.long	753                             ; String in Bucket 18: __darwin_pthread_handler_rec
	.long	598                             ; String in Bucket 19: pthread_mutexattr_t
	.long	318                             ; String in Bucket 20: unsigned char
.set Lset41, Lnames4-Lnames_entries0    ; Offset in Bucket 0
	.long	Lset41
.set Lset42, Lnames7-Lnames_entries0    ; Offset in Bucket 1
	.long	Lset42
.set Lset43, Lnames14-Lnames_entries0   ; Offset in Bucket 1
	.long	Lset43
.set Lset44, Lnames1-Lnames_entries0    ; Offset in Bucket 2
	.long	Lset44
.set Lset45, Lnames23-Lnames_entries0   ; Offset in Bucket 3
	.long	Lset45
.set Lset46, Lnames12-Lnames_entries0   ; Offset in Bucket 4
	.long	Lset46
.set Lset47, Lnames17-Lnames_entries0   ; Offset in Bucket 4
	.long	Lset47
.set Lset48, Lnames15-Lnames_entries0   ; Offset in Bucket 4
	.long	Lset48
.set Lset49, Lnames39-Lnames_entries0   ; Offset in Bucket 5
	.long	Lset49
.set Lset50, Lnames10-Lnames_entries0   ; Offset in Bucket 5
	.long	Lset50
.set Lset51, Lnames0-Lnames_entries0    ; Offset in Bucket 5
	.long	Lset51
.set Lset52, Lnames13-Lnames_entries0   ; Offset in Bucket 5
	.long	Lset52
.set Lset53, Lnames41-Lnames_entries0   ; Offset in Bucket 6
	.long	Lset53
.set Lset54, Lnames38-Lnames_entries0   ; Offset in Bucket 6
	.long	Lset54
.set Lset55, Lnames32-Lnames_entries0   ; Offset in Bucket 6
	.long	Lset55
.set Lset56, Lnames22-Lnames_entries0   ; Offset in Bucket 7
	.long	Lset56
.set Lset57, Lnames40-Lnames_entries0   ; Offset in Bucket 7
	.long	Lset57
.set Lset58, Lnames33-Lnames_entries0   ; Offset in Bucket 7
	.long	Lset58
.set Lset59, Lnames6-Lnames_entries0    ; Offset in Bucket 8
	.long	Lset59
.set Lset60, Lnames28-Lnames_entries0   ; Offset in Bucket 8
	.long	Lset60
.set Lset61, Lnames18-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset61
.set Lset62, Lnames19-Lnames_entries0   ; Offset in Bucket 10
	.long	Lset62
.set Lset63, Lnames21-Lnames_entries0   ; Offset in Bucket 10
	.long	Lset63
.set Lset64, Lnames2-Lnames_entries0    ; Offset in Bucket 11
	.long	Lset64
.set Lset65, Lnames30-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset65
.set Lset66, Lnames34-Lnames_entries0   ; Offset in Bucket 12
	.long	Lset66
.set Lset67, Lnames31-Lnames_entries0   ; Offset in Bucket 12
	.long	Lset67
.set Lset68, Lnames35-Lnames_entries0   ; Offset in Bucket 13
	.long	Lset68
.set Lset69, Lnames9-Lnames_entries0    ; Offset in Bucket 13
	.long	Lset69
.set Lset70, Lnames29-Lnames_entries0   ; Offset in Bucket 13
	.long	Lset70
.set Lset71, Lnames3-Lnames_entries0    ; Offset in Bucket 13
	.long	Lset71
.set Lset72, Lnames36-Lnames_entries0   ; Offset in Bucket 14
	.long	Lset72
.set Lset73, Lnames37-Lnames_entries0   ; Offset in Bucket 15
	.long	Lset73
.set Lset74, Lnames16-Lnames_entries0   ; Offset in Bucket 15
	.long	Lset74
.set Lset75, Lnames5-Lnames_entries0    ; Offset in Bucket 15
	.long	Lset75
.set Lset76, Lnames25-Lnames_entries0   ; Offset in Bucket 16
	.long	Lset76
.set Lset77, Lnames8-Lnames_entries0    ; Offset in Bucket 17
	.long	Lset77
.set Lset78, Lnames27-Lnames_entries0   ; Offset in Bucket 17
	.long	Lset78
.set Lset79, Lnames24-Lnames_entries0   ; Offset in Bucket 18
	.long	Lset79
.set Lset80, Lnames26-Lnames_entries0   ; Offset in Bucket 18
	.long	Lset80
.set Lset81, Lnames20-Lnames_entries0   ; Offset in Bucket 19
	.long	Lset81
.set Lset82, Lnames11-Lnames_entries0   ; Offset in Bucket 20
	.long	Lset82
Lnames_abbrev_start0:
	.byte	1                               ; Abbrev code
	.byte	19                              ; DW_TAG_structure_type
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	2                               ; Abbrev code
	.byte	46                              ; DW_TAG_subprogram
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	3                               ; Abbrev code
	.byte	22                              ; DW_TAG_typedef
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	4                               ; Abbrev code
	.byte	36                              ; DW_TAG_base_type
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	5                               ; Abbrev code
	.byte	52                              ; DW_TAG_variable
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev list
Lnames_abbrev_end0:
Lnames_entries0:
Lnames4:
L0:
	.byte	1                               ; Abbreviation code
	.long	330                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _opaque_pthread_mutex_t
Lnames7:
L38:
	.byte	2                               ; Abbreviation code
	.long	371                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: increase_fn
Lnames14:
L7:
	.byte	3                               ; Abbreviation code
	.long	807                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: fpos_t
Lnames1:
L25:
	.byte	4                               ; Abbreviation code
	.long	71                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __ARRAY_SIZE_TYPE__
Lnames23:
L5:
	.byte	3                               ; Abbreviation code
	.long	1434                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: pthread_t
Lnames12:
L32:
	.byte	4                               ; Abbreviation code
	.long	706                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: short
Lnames17:
L13:
	.byte	4                               ; Abbreviation code
	.long	831                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: long long
Lnames15:
L8:
	.byte	3                               ; Abbreviation code
	.long	815                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_off_t
Lnames39:
L6:
	.byte	2                               ; Abbreviation code
	.long	1748                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _OUTLINED_FUNCTION_0
Lnames10:
L24:
	.byte	1                               ; Abbreviation code
	.long	511                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __sFILE
Lnames0:
L22:
	.byte	4                               ; Abbreviation code
	.long	67                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: char
Lnames13:
L35:
	.byte	1                               ; Abbreviation code
	.long	710                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __sbuf
Lnames41:
L3:
	.byte	2                               ; Abbreviation code
	.long	1758                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _OUTLINED_FUNCTION_1
Lnames38:
	.byte	2                               ; Abbreviation code
	.long	1748                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: OUTLINED_FUNCTION_0
Lnames32:
L9:
	.byte	2                               ; Abbreviation code
	.long	1070                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: decrease_fn.cold.1
Lnames22:
L36:
	.byte	1                               ; Abbreviation code
	.long	1358                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _opaque_pthread_mutexattr_t
Lnames40:
	.byte	2                               ; Abbreviation code
	.long	1758                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: OUTLINED_FUNCTION_1
Lnames33:
L31:
	.byte	2                               ; Abbreviation code
	.long	1060                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: decrease_fn.cold.2
Lnames6:
L10:
	.byte	5                               ; Abbreviation code
	.long	303                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: mutex
Lnames28:
L4:
	.byte	3                               ; Abbreviation code
	.long	1575                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_attr_t
Lnames18:
L11:
	.byte	2                               ; Abbreviation code
	.long	962                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: decrease_fn
Lnames19:
L20:
	.byte	2                               ; Abbreviation code
	.long	1080                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main
Lnames21:
L15:
	.byte	3                               ; Abbreviation code
	.long	1350                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_mutexattr_t
Lnames2:
L37:
	.byte	3                               ; Abbreviation code
	.long	314                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: pthread_mutex_t
Lnames30:
L27:
	.byte	2                               ; Abbreviation code
	.long	952                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: increase_fn.cold.1
Lnames34:
L39:
	.byte	2                               ; Abbreviation code
	.long	1708                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main.cold.1
Lnames31:
L17:
	.byte	2                               ; Abbreviation code
	.long	942                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: increase_fn.cold.2
Lnames35:
L2:
	.byte	2                               ; Abbreviation code
	.long	1718                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main.cold.2
Lnames9:
L33:
	.byte	3                               ; Abbreviation code
	.long	503                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: FILE
Lnames29:
L30:
	.byte	1                               ; Abbreviation code
	.long	1583                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _opaque_pthread_attr_t
Lnames3:
L28:
	.byte	3                               ; Abbreviation code
	.long	322                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_mutex_t
Lnames36:
L16:
	.byte	2                               ; Abbreviation code
	.long	1728                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main.cold.3
Lnames37:
L18:
	.byte	2                               ; Abbreviation code
	.long	1738                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main.cold.4
Lnames16:
L34:
	.byte	3                               ; Abbreviation code
	.long	823                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __int64_t
Lnames5:
L23:
	.byte	4                               ; Abbreviation code
	.long	354                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: long
Lnames25:
L19:
	.byte	1                               ; Abbreviation code
	.long	1455                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _opaque_pthread_t
Lnames8:
L14:
	.byte	4                               ; Abbreviation code
	.long	489                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int
Lnames27:
L26:
	.byte	3                               ; Abbreviation code
	.long	1567                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: pthread_attr_t
Lnames24:
L21:
	.byte	3                               ; Abbreviation code
	.long	1442                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_t
Lnames26:
L1:
	.byte	1                               ; Abbreviation code
	.long	1494                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_handler_rec
Lnames20:
L29:
	.byte	3                               ; Abbreviation code
	.long	1342                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: pthread_mutexattr_t
Lnames11:
L12:
	.byte	4                               ; Abbreviation code
	.long	702                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned char
	.p2align	2, 0x0
Lnames_end0:
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
