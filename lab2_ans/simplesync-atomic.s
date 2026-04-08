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
	mov	w20, #38528                     ; =0x9680
	movk	w20, #152, lsl #16
Ltmp1:
	;DEBUG_VALUE: increase_fn:ip <- undef
	.loc	0 45 10 prologue_end            ; simplesync.c:45:10
Lloh0:
	adrp	x21, ___stderrp@GOTPAGE
Lloh1:
	ldr	x21, [x21, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x21]
	.loc	0 45 2 is_stmt 0                ; simplesync.c:45:2
	str	x20, [sp]
Lloh2:
	adrp	x1, l_.str@PAGE
Lloh3:
	add	x1, x1, l_.str@PAGEOFF
	bl	_fprintf
Ltmp2:
	;DEBUG_VALUE: increase_fn:i <- 0
	.loc	0 0 2                           ; simplesync.c:0:2
	mov	w8, #1                          ; =0x1
Ltmp3:
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: increase_fn:arg <- $x19
	;DEBUG_VALUE: increase_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $w20
	.loc	0 50 4 is_stmt 1                ; simplesync.c:50:4
	ldaddal	w8, w9, [x19]
Ltmp4:
	;DEBUG_VALUE: increase_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $w20
	.loc	0 46 16                         ; simplesync.c:46:16
	subs	w20, w20, #1
Ltmp5:
	.loc	0 46 2 is_stmt 0                ; simplesync.c:46:2
	b.ne	LBB0_1
Ltmp6:
; %bb.2:
	;DEBUG_VALUE: increase_fn:arg <- $x19
	.loc	0 69 10 is_stmt 1               ; simplesync.c:69:10
	ldr	x3, [x21]
	.loc	0 69 2 is_stmt 0                ; simplesync.c:69:2
Lloh4:
	adrp	x0, l_.str.1@PAGE
Lloh5:
	add	x0, x0, l_.str.1@PAGEOFF
	mov	w1, #26                         ; =0x1a
	mov	w2, #1                          ; =0x1
	bl	_fwrite
Ltmp7:
	.loc	0 71 2 is_stmt 1                ; simplesync.c:71:2
	mov	x0, #0                          ; =0x0
	.loc	0 71 2 epilogue_begin is_stmt 0 ; simplesync.c:71:2
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
Ltmp8:
	;DEBUG_VALUE: increase_fn:arg <- [DW_OP_LLVM_entry_value 1] $x0
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
Ltmp9:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpAdd	Lloh4, Lloh5
Lfunc_end0:
	.cfi_endproc
	.file	3 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include" "_stdio.h" md5 0xd91ebd7d161d9196cc100822ef0e5cdf
	.file	4 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm" "_types.h" md5 0xb270144f57ae258d0ce80b8f87be068c
	.file	5 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys" "_types.h" md5 0xaf82ff6119a9fa80fad635d276556d46
                                        ; -- End function
	.globl	_decrease_fn                    ; -- Begin function decrease_fn
	.p2align	2
_decrease_fn:                           ; @decrease_fn
Lfunc_begin1:
	.loc	0 75 0 is_stmt 1                ; simplesync.c:75:0
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
Ltmp10:
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	mov	w20, #38528                     ; =0x9680
	movk	w20, #152, lsl #16
Ltmp11:
	;DEBUG_VALUE: decrease_fn:ip <- undef
	.loc	0 79 10 prologue_end            ; simplesync.c:79:10
Lloh6:
	adrp	x21, ___stderrp@GOTPAGE
Lloh7:
	ldr	x21, [x21, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x21]
	.loc	0 79 2 is_stmt 0                ; simplesync.c:79:2
	str	x20, [sp]
Lloh8:
	adrp	x1, l_.str.2@PAGE
Lloh9:
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_fprintf
Ltmp12:
	;DEBUG_VALUE: decrease_fn:i <- 0
	.loc	0 0 2                           ; simplesync.c:0:2
	mov	w8, #-1                         ; =0xffffffff
Ltmp13:
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	;DEBUG_VALUE: decrease_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_stack_value] $w20
	.loc	0 84 4 is_stmt 1                ; simplesync.c:84:4
	ldaddal	w8, w9, [x19]
Ltmp14:
	;DEBUG_VALUE: decrease_fn:i <- [DW_OP_consts 10000000, DW_OP_minus, DW_OP_consts 18446744073709551615, DW_OP_div, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $w20
	.loc	0 80 16                         ; simplesync.c:80:16
	subs	w20, w20, #1
Ltmp15:
	.loc	0 80 2 is_stmt 0                ; simplesync.c:80:2
	b.ne	LBB1_1
Ltmp16:
; %bb.2:
	;DEBUG_VALUE: decrease_fn:arg <- $x19
	.loc	0 103 10 is_stmt 1              ; simplesync.c:103:10
	ldr	x3, [x21]
	.loc	0 103 2 is_stmt 0               ; simplesync.c:103:2
Lloh10:
	adrp	x0, l_.str.3@PAGE
Lloh11:
	add	x0, x0, l_.str.3@PAGEOFF
	mov	w1, #26                         ; =0x1a
	mov	w2, #1                          ; =0x1
	bl	_fwrite
Ltmp17:
	.loc	0 105 2 is_stmt 1               ; simplesync.c:105:2
	mov	x0, #0                          ; =0x0
	.loc	0 105 2 epilogue_begin is_stmt 0 ; simplesync.c:105:2
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
Ltmp18:
	;DEBUG_VALUE: decrease_fn:arg <- [DW_OP_LLVM_entry_value 1] $x0
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
Ltmp19:
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpLdrGot	Lloh6, Lloh7
	.loh AdrpAdd	Lloh10, Lloh11
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin2:
	.loc	0 110 0 is_stmt 1               ; simplesync.c:110:0
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
Ltmp20:
	;DEBUG_VALUE: main:val <- 0
	.loc	0 117 6 prologue_end            ; simplesync.c:117:6
	stur	wzr, [x29, #-20]
	.loc	0 121 8                         ; simplesync.c:121:8
Lloh12:
	adrp	x0, _mutex@GOTPAGE
Ltmp21:
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
Lloh13:
	ldr	x0, [x0, _mutex@GOTPAGEOFF]
	mov	x1, #0                          ; =0x0
Ltmp22:
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	bl	_pthread_mutex_init
Ltmp23:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 122 6                         ; simplesync.c:122:6
	cbnz	w0, LBB2_9
Ltmp24:
; %bb.1:
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:val <- 0
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	.loc	0 130 8                         ; simplesync.c:130:8
Lloh14:
	adrp	x2, _increase_fn@PAGE
Lloh15:
	add	x2, x2, _increase_fn@PAGEOFF
	add	x0, sp, #32
Ltmp25:
	sub	x3, x29, #20
	mov	x1, #0                          ; =0x0
	bl	_pthread_create
Ltmp26:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 131 6                         ; simplesync.c:131:6
	cbnz	w0, LBB2_10
Ltmp27:
; %bb.2:
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	.loc	0 135 8                         ; simplesync.c:135:8
Lloh16:
	adrp	x2, _decrease_fn@PAGE
Lloh17:
	add	x2, x2, _decrease_fn@PAGEOFF
	add	x0, sp, #24
Ltmp28:
	sub	x3, x29, #20
	mov	x1, #0                          ; =0x0
	bl	_pthread_create
Ltmp29:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 136 6                         ; simplesync.c:136:6
	cbnz	w0, LBB2_11
Ltmp30:
; %bb.3:
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 144 21                        ; simplesync.c:144:21
	ldr	x0, [sp, #32]
Ltmp31:
	;DEBUG_VALUE: main:t1 <- $x0
	.loc	0 144 8 is_stmt 0               ; simplesync.c:144:8
	mov	x1, #0                          ; =0x0
	bl	_pthread_join
Ltmp32:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 145 6 is_stmt 1               ; simplesync.c:145:6
	cbnz	w0, LBB2_7
Ltmp33:
LBB2_4:
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 147 21                        ; simplesync.c:147:21
	ldr	x0, [sp, #24]
Ltmp34:
	;DEBUG_VALUE: main:t2 <- $x0
	.loc	0 147 8 is_stmt 0               ; simplesync.c:147:8
	mov	x1, #0                          ; =0x0
	bl	_pthread_join
Ltmp35:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 148 6 is_stmt 1               ; simplesync.c:148:6
	cbnz	w0, LBB2_8
Ltmp36:
LBB2_5:
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 156 2                         ; simplesync.c:156:2
	ldur	w19, [x29, #-20]
Ltmp37:
	;DEBUG_VALUE: main:ok <- undef
	;DEBUG_VALUE: main:val <- $w19
	.loc	0 156 30 is_stmt 0              ; simplesync.c:156:30
Lloh18:
	adrp	x8, l_.str.8@PAGE
Lloh19:
	add	x8, x8, l_.str.8@PAGEOFF
Lloh20:
	adrp	x9, l_.str.9@PAGE
Lloh21:
	add	x9, x9, l_.str.9@PAGEOFF
	cmp	w19, #0
	csel	x8, x9, x8, ne
	.loc	0 156 2                         ; simplesync.c:156:2
	stp	x8, x19, [sp]
Lloh22:
	adrp	x0, l_.str.7@PAGE
Lloh23:
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
Ltmp38:
	.loc	0 158 8 is_stmt 1               ; simplesync.c:158:8
Lloh24:
	adrp	x0, _mutex@GOTPAGE
Lloh25:
	ldr	x0, [x0, _mutex@GOTPAGEOFF]
	bl	_pthread_mutex_destroy
Ltmp39:
	;DEBUG_VALUE: main:ret <- $w0
	.loc	0 159 6                         ; simplesync.c:159:6
	cbnz	w0, LBB2_12
Ltmp40:
; %bb.6:
	;DEBUG_VALUE: main:val <- $w19
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 154 12                        ; simplesync.c:154:12
	cmp	w19, #0
	cset	w0, ne
Ltmp41:
	.loc	0 163 2 epilogue_begin          ; simplesync.c:163:2
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
Ltmp42:
	add	sp, sp, #80
	ret
Ltmp43:
LBB2_7:
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 0 2 is_stmt 0                 ; simplesync.c:0:2
	mov	x19, x0
Ltmp44:
	.loc	0 146 3 is_stmt 1               ; simplesync.c:146:3
	bl	___error
Ltmp45:
	str	w19, [x0]
Lloh26:
	adrp	x0, l_.str.6@PAGE
Lloh27:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_perror
Ltmp46:
	.loc	0 0 3 is_stmt 0                 ; simplesync.c:0:3
	b	LBB2_4
Ltmp47:
LBB2_8:
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	mov	x19, x0
Ltmp48:
	.loc	0 149 3 is_stmt 1               ; simplesync.c:149:3
	bl	___error
Ltmp49:
	str	w19, [x0]
Lloh28:
	adrp	x0, l_.str.6@PAGE
Lloh29:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_perror
Ltmp50:
	.loc	0 0 3 is_stmt 0                 ; simplesync.c:0:3
	b	LBB2_5
Ltmp51:
LBB2_9:
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:val <- 0
	.loc	0 123 3 is_stmt 1               ; simplesync.c:123:3
	bl	_main.cold.1
Ltmp52:
LBB2_10:
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 132 3                         ; simplesync.c:132:3
	bl	_main.cold.2
Ltmp53:
LBB2_11:
	;DEBUG_VALUE: main:t2 <- [DW_OP_plus_uconst 24, DW_OP_deref] $sp
	;DEBUG_VALUE: main:t1 <- [DW_OP_plus_uconst 32, DW_OP_deref] $sp
	;DEBUG_VALUE: main:val <- [DW_OP_constu 20, DW_OP_minus, DW_OP_deref] $fp
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 137 3                         ; simplesync.c:137:3
	bl	_main.cold.3
Ltmp54:
LBB2_12:
	;DEBUG_VALUE: main:val <- $w19
	;DEBUG_VALUE: main:ret <- $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	.loc	0 160 3                         ; simplesync.c:160:3
	bl	_main.cold.4
Ltmp55:
	.loh AdrpLdrGot	Lloh12, Lloh13
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpLdrGot	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh28, Lloh29
Lfunc_end2:
	.cfi_endproc
	.file	6 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include" "pthread.h" md5 0xd98d65819fa0eeda6334c838666d7405
	.file	7 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread" "_pthread_mutexattr_t.h" md5 0x785eb3f812f7ebee764058667d4b4693
	.file	8 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread" "_pthread_t.h" md5 0x086fc6d7dc3c67fdb87e7376555dcfd7
	.file	9 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread" "_pthread_attr_t.h" md5 0x383e78324250b910a1128f1b9a464b23
	.file	10 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include" "_printf.h" md5 0x2d37517bd0342aa326aa1d3660ad4ab4
	.file	11 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys" "errno.h" md5 0x87e3fde364802c167e5220028e837709
                                        ; -- End function
	.p2align	2                               ; -- Begin function main.cold.1
_main.cold.1:                           ; @main.cold.1
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
Ltmp56:
	.loc	0 123 3 prologue_end            ; simplesync.c:123:3
	str	w19, [x0]
Lloh30:
	adrp	x0, l_.str.4@PAGE
Lloh31:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp57:
	.loh AdrpAdd	Lloh30, Lloh31
Lfunc_end3:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function main.cold.2
_main.cold.2:                           ; @main.cold.2
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
Ltmp58:
	.loc	0 132 3 prologue_end            ; simplesync.c:132:3
	str	w19, [x0]
Lloh32:
	adrp	x0, l_.str.5@PAGE
Lloh33:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp59:
	.loh AdrpAdd	Lloh32, Lloh33
Lfunc_end4:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function main.cold.3
_main.cold.3:                           ; @main.cold.3
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
Ltmp60:
	.loc	0 137 3 prologue_end            ; simplesync.c:137:3
	str	w19, [x0]
Lloh34:
	adrp	x0, l_.str.5@PAGE
Lloh35:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp61:
	.loh AdrpAdd	Lloh34, Lloh35
Lfunc_end5:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function main.cold.4
_main.cold.4:                           ; @main.cold.4
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
Ltmp62:
	.loc	0 160 3 prologue_end            ; simplesync.c:160:3
	str	w19, [x0]
Lloh36:
	adrp	x0, l_.str.10@PAGE
Lloh37:
	add	x0, x0, l_.str.10@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp63:
	.loh AdrpAdd	Lloh36, Lloh37
Lfunc_end6:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function OUTLINED_FUNCTION_0
_OUTLINED_FUNCTION_0:                   ; @OUTLINED_FUNCTION_0 Thunk
Lfunc_begin7:
	.cfi_startproc
; %bb.0:
	mov	w0, #1                          ; =0x1
	b	_exit
Lfunc_end7:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function OUTLINED_FUNCTION_1
_OUTLINED_FUNCTION_1:                   ; @OUTLINED_FUNCTION_1 Thunk
Lfunc_begin8:
	.cfi_startproc
; %bb.0:
	mov	x19, x0
	b	___error
Lfunc_end8:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"About to increase variable %d times\n"

l_.str.1:                               ; @.str.1
	.asciz	"Done increasing variable.\n"

l_.str.2:                               ; @.str.2
	.asciz	"About to decrease variable %d times\n"

l_.str.3:                               ; @.str.3
	.asciz	"Done decreasing variable.\n"

	.comm	_mutex,64,3                     ; @mutex
l_.str.4:                               ; @.str.4
	.asciz	"pthread_mutex_init"

l_.str.5:                               ; @.str.5
	.asciz	"pthread_create"

l_.str.6:                               ; @.str.6
	.asciz	"pthread_join"

l_.str.7:                               ; @.str.7
	.asciz	"%sOK, val = %d.\n"

l_.str.8:                               ; @.str.8
	.space	1

l_.str.9:                               ; @.str.9
	.asciz	"NOT "

l_.str.10:                              ; @.str.10
	.asciz	"pthread_mutex_destroy"

	.section	__DWARF,__debug_loclists,regular,debug
Lsection_debug_loc0:
.set Lset0, Ldebug_list_header_end0-Ldebug_list_header_start0 ; Length
	.long	Lset0
Ldebug_list_header_start0:
	.short	5                               ; Version
	.byte	8                               ; Address size
	.byte	0                               ; Segment selector size
	.long	10                              ; Offset entry count
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
Ldebug_loc0:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Lfunc_begin0-Lfunc_begin0      ;   starting offset
	.uleb128 Ltmp0-Lfunc_begin0             ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp0-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp8-Lfunc_begin0             ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp8-Lfunc_begin0             ;   starting offset
	.uleb128 Lfunc_end0-Lfunc_begin0        ;   ending offset
	.byte	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
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
	.uleb128 Ltmp4-Lfunc_begin0             ;   ending offset
	.byte	12                              ; Loc expr size
	.byte	132                             ; DW_OP_breg20
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
	.uleb128 Ltmp4-Lfunc_begin0             ;   starting offset
	.uleb128 Ltmp5-Lfunc_begin0             ;   ending offset
	.byte	15                              ; Loc expr size
	.byte	132                             ; DW_OP_breg20
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
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc2:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Lfunc_begin1-Lfunc_begin0      ;   starting offset
	.uleb128 Ltmp10-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp10-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp18-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp18-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end1-Lfunc_begin0        ;   ending offset
	.byte	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc3:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp12-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp13-Lfunc_begin0            ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	17                              ; DW_OP_consts
	.byte	0                               ; 0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp13-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp14-Lfunc_begin0            ;   ending offset
	.byte	12                              ; Loc expr size
	.byte	132                             ; DW_OP_breg20
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
	.uleb128 Ltmp14-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp15-Lfunc_begin0            ;   ending offset
	.byte	15                              ; Loc expr size
	.byte	132                             ; DW_OP_breg20
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
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc4:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Lfunc_begin2-Lfunc_begin0      ;   starting offset
	.uleb128 Ltmp21-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp21-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end2-Lfunc_begin0        ;   ending offset
	.byte	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc5:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Lfunc_begin2-Lfunc_begin0      ;   starting offset
	.uleb128 Ltmp22-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp22-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end2-Lfunc_begin0        ;   ending offset
	.byte	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	81                              ; DW_OP_reg1
	.byte	159                             ; DW_OP_stack_value
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc6:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp20-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp24-Lfunc_begin0            ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	17                              ; DW_OP_consts
	.byte	0                               ; 0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp24-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp37-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	141                             ; DW_OP_breg29
	.byte	108                             ; -20
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp37-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp42-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp43-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp51-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	141                             ; DW_OP_breg29
	.byte	108                             ; -20
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp51-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp52-Lfunc_begin0            ;   ending offset
	.byte	3                               ; Loc expr size
	.byte	17                              ; DW_OP_consts
	.byte	0                               ; 0
	.byte	159                             ; DW_OP_stack_value
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp52-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp54-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	141                             ; DW_OP_breg29
	.byte	108                             ; -20
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp54-Lfunc_begin0            ;   starting offset
	.uleb128 Lfunc_end2-Lfunc_begin0        ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc7:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp23-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp25-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp26-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp28-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp29-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp31-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp32-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp33-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp35-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp36-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp39-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp41-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp43-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp45-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp47-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp49-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp51-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp55-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc8:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp24-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp31-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	32                              ; 32
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp31-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp32-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp52-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp54-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	32                              ; 32
	.byte	0                               ; DW_LLE_end_of_list
Ldebug_loc9:
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp27-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp34-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	24                              ; 24
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp34-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp35-Lfunc_begin0            ;   ending offset
	.byte	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp43-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp47-Lfunc_begin0            ;   ending offset
	.byte	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	24                              ; 24
	.byte	4                               ; DW_LLE_offset_pair
	.uleb128 Ltmp53-Lfunc_begin0            ;   starting offset
	.uleb128 Ltmp54-Lfunc_begin0            ;   ending offset
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
	.byte	72                              ; DW_TAG_call_site
	.byte	0                               ; DW_CHILDREN_no
	.byte	127                             ; DW_AT_call_origin
	.byte	19                              ; DW_FORM_ref4
	.byte	125                             ; DW_AT_call_return_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	17                              ; Abbreviation Code
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
	.byte	18                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	19                              ; Abbreviation Code
	.byte	24                              ; DW_TAG_unspecified_parameters
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	20                              ; Abbreviation Code
	.byte	55                              ; DW_TAG_restrict_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	21                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	22                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	23                              ; Abbreviation Code
	.byte	38                              ; DW_TAG_const_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	25                              ; Abbreviation Code
	.byte	72                              ; DW_TAG_call_site
	.byte	1                               ; DW_CHILDREN_yes
	.byte	127                             ; DW_AT_call_origin
	.byte	19                              ; DW_FORM_ref4
	.byte	125                             ; DW_AT_call_return_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	26                              ; Abbreviation Code
	.byte	73                              ; DW_TAG_call_site_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	126                             ; DW_AT_call_value
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	27                              ; Abbreviation Code
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
	.byte	28                              ; Abbreviation Code
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
	.byte	29                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	30                              ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	31                              ; Abbreviation Code
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
	.byte	32                              ; Abbreviation Code
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
	.byte	33                              ; Abbreviation Code
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
	.byte	34                              ; Abbreviation Code
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
	.byte	35                              ; Abbreviation Code
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
	.byte	36                              ; Abbreviation Code
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
.set Lset11, Ldebug_info_end0-Ldebug_info_start0 ; Length of Unit
	.long	Lset11
Ldebug_info_start0:
	.short	5                               ; DWARF version number
	.byte	1                               ; DWARF Unit Type
	.byte	8                               ; Address Size (in bytes)
.set Lset12, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset12
	.byte	1                               ; Abbrev [1] 0xc:0x61e DW_TAG_compile_unit
	.byte	0                               ; DW_AT_producer
	.short	29                              ; DW_AT_language
	.byte	1                               ; DW_AT_name
	.byte	2                               ; DW_AT_LLVM_sysroot
	.byte	3                               ; DW_AT_APPLE_sdk
.set Lset13, Lstr_offsets_base0-Lsection_str_off ; DW_AT_str_offsets_base
	.long	Lset13
.set Lset14, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset14
	.byte	4                               ; DW_AT_comp_dir
                                        ; DW_AT_APPLE_optimized
	.byte	12                              ; DW_AT_low_pc
.set Lset15, Lfunc_end8-Lfunc_begin0    ; DW_AT_high_pc
	.long	Lset15
.set Lset16, Laddr_table_base0-Lsection_info0 ; DW_AT_addr_base
	.long	Lset16
.set Lset17, Lloclists_table_base0-Lsection_debug_loc0 ; DW_AT_loclists_base
	.long	Lset17
	.byte	2                               ; Abbrev [2] 0x29:0xa DW_TAG_variable
	.long	51                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	0
	.byte	3                               ; Abbrev [3] 0x33:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x38:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	37                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x3f:0x4 DW_TAG_base_type
	.byte	5                               ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	6                               ; Abbrev [6] 0x43:0x4 DW_TAG_base_type
	.byte	6                               ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	2                               ; Abbrev [2] 0x47:0xa DW_TAG_variable
	.long	81                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	69                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	1
	.byte	3                               ; Abbrev [3] 0x51:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x56:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	27                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x5d:0xa DW_TAG_variable
	.long	51                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	79                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	2
	.byte	2                               ; Abbrev [2] 0x67:0xa DW_TAG_variable
	.long	81                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	3
	.byte	2                               ; Abbrev [2] 0x71:0xa DW_TAG_variable
	.long	123                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	123                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	4
	.byte	3                               ; Abbrev [3] 0x7b:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x80:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	19                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x87:0xa DW_TAG_variable
	.long	145                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	132                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	5
	.byte	3                               ; Abbrev [3] 0x91:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x96:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	15                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x9d:0xa DW_TAG_variable
	.long	167                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	146                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	6
	.byte	3                               ; Abbrev [3] 0xa7:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xac:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	13                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xb3:0xa DW_TAG_variable
	.long	189                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	7
	.byte	3                               ; Abbrev [3] 0xbd:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xc2:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	17                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xc9:0xa DW_TAG_variable
	.long	211                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	8
	.byte	3                               ; Abbrev [3] 0xd3:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xd8:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	1                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xdf:0xa DW_TAG_variable
	.long	233                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	9
	.byte	3                               ; Abbrev [3] 0xe9:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xee:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	5                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xf5:0xa DW_TAG_variable
	.long	255                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	10
	.byte	3                               ; Abbrev [3] 0xff:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x104:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	22                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x10b:0xb DW_TAG_variable
	.byte	7                               ; DW_AT_name
	.long	278                             ; DW_AT_type
                                        ; DW_AT_external
	.byte	0                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	11
	.byte	8                               ; Abbrev [8] 0x116:0x8 DW_TAG_typedef
	.long	286                             ; DW_AT_type
	.byte	13                              ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x11e:0x8 DW_TAG_typedef
	.long	294                             ; DW_AT_type
	.byte	12                              ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	113                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x126:0x18 DW_TAG_structure_type
	.byte	11                              ; DW_AT_name
	.byte	64                              ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	78                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x12b:0x9 DW_TAG_member
	.byte	8                               ; DW_AT_name
	.long	318                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	79                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x134:0x9 DW_TAG_member
	.byte	10                              ; DW_AT_name
	.long	322                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x13e:0x4 DW_TAG_base_type
	.byte	9                               ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x142:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x147:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	56                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x14e:0x1 DW_TAG_pointer_type
	.byte	12                              ; Abbrev [12] 0x14f:0x30 DW_TAG_subprogram
	.byte	12                              ; DW_AT_low_pc
.set Lset18, Lfunc_end0-Lfunc_begin0    ; DW_AT_high_pc
	.long	Lset18
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.byte	70                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	40                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	334                             ; DW_AT_type
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	13                              ; Abbrev [13] 0x15e:0x9 DW_TAG_formal_parameter
	.byte	0                               ; DW_AT_location
	.byte	81                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	40                              ; DW_AT_decl_line
	.long	334                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x167:0x9 DW_TAG_variable
	.byte	1                               ; DW_AT_location
	.byte	82                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.long	403                             ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x170:0x8 DW_TAG_variable
	.byte	83                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	43                              ; DW_AT_decl_line
	.long	1562                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x178:0x6 DW_TAG_call_site
	.long	383                             ; DW_AT_call_origin
	.byte	13                              ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x17f:0x14 DW_TAG_subprogram
	.byte	14                              ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	245                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	403                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	18                              ; Abbrev [18] 0x187:0x5 DW_TAG_formal_parameter
	.long	407                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x18c:0x5 DW_TAG_formal_parameter
	.long	816                             ; DW_AT_type
	.byte	19                              ; Abbrev [19] 0x191:0x1 DW_TAG_unspecified_parameters
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x193:0x4 DW_TAG_base_type
	.byte	15                              ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	20                              ; Abbrev [20] 0x197:0x5 DW_TAG_restrict_type
	.long	412                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x19c:0x5 DW_TAG_pointer_type
	.long	417                             ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x1a1:0x8 DW_TAG_typedef
	.long	425                             ; DW_AT_type
	.byte	47                              ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	162                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x1a9:0xba DW_TAG_structure_type
	.byte	46                              ; DW_AT_name
	.byte	152                             ; DW_AT_byte_size
	.byte	3                               ; DW_AT_decl_file
	.byte	131                             ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x1ae:0x9 DW_TAG_member
	.byte	16                              ; DW_AT_name
	.long	611                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	132                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x1b7:0x9 DW_TAG_member
	.byte	18                              ; DW_AT_name
	.long	403                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	133                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x1c0:0x9 DW_TAG_member
	.byte	19                              ; DW_AT_name
	.long	403                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	134                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x1c9:0x9 DW_TAG_member
	.byte	20                              ; DW_AT_name
	.long	620                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	135                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x1d2:0x9 DW_TAG_member
	.byte	22                              ; DW_AT_name
	.long	620                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	136                             ; DW_AT_decl_line
	.byte	18                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x1db:0x9 DW_TAG_member
	.byte	23                              ; DW_AT_name
	.long	624                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	137                             ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x1e4:0x9 DW_TAG_member
	.byte	27                              ; DW_AT_name
	.long	403                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	138                             ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x1ed:0x9 DW_TAG_member
	.byte	28                              ; DW_AT_name
	.long	334                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	141                             ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x1f6:0x9 DW_TAG_member
	.byte	29                              ; DW_AT_name
	.long	648                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.byte	56                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x1ff:0x9 DW_TAG_member
	.byte	30                              ; DW_AT_name
	.long	664                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	143                             ; DW_AT_decl_line
	.byte	64                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x208:0x9 DW_TAG_member
	.byte	31                              ; DW_AT_name
	.long	695                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
	.byte	72                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x211:0x9 DW_TAG_member
	.byte	36                              ; DW_AT_name
	.long	749                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.byte	80                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x21a:0x9 DW_TAG_member
	.byte	37                              ; DW_AT_name
	.long	624                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	148                             ; DW_AT_decl_line
	.byte	88                              ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x223:0x9 DW_TAG_member
	.byte	38                              ; DW_AT_name
	.long	785                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	149                             ; DW_AT_decl_line
	.byte	104                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x22c:0x9 DW_TAG_member
	.byte	40                              ; DW_AT_name
	.long	403                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	150                             ; DW_AT_decl_line
	.byte	112                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x235:0x9 DW_TAG_member
	.byte	41                              ; DW_AT_name
	.long	792                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.byte	116                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x23e:0x9 DW_TAG_member
	.byte	42                              ; DW_AT_name
	.long	804                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	154                             ; DW_AT_decl_line
	.byte	119                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x247:0x9 DW_TAG_member
	.byte	43                              ; DW_AT_name
	.long	624                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	157                             ; DW_AT_decl_line
	.byte	120                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x250:0x9 DW_TAG_member
	.byte	44                              ; DW_AT_name
	.long	403                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.byte	136                             ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x259:0x9 DW_TAG_member
	.byte	45                              ; DW_AT_name
	.long	721                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.byte	144                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x263:0x5 DW_TAG_pointer_type
	.long	616                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x268:0x4 DW_TAG_base_type
	.byte	17                              ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	5                               ; Abbrev [5] 0x26c:0x4 DW_TAG_base_type
	.byte	21                              ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	2                               ; DW_AT_byte_size
	.byte	9                               ; Abbrev [9] 0x270:0x18 DW_TAG_structure_type
	.byte	26                              ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	3                               ; DW_AT_decl_file
	.byte	97                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x275:0x9 DW_TAG_member
	.byte	24                              ; DW_AT_name
	.long	611                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	98                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x27e:0x9 DW_TAG_member
	.byte	25                              ; DW_AT_name
	.long	403                             ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	99                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x288:0x5 DW_TAG_pointer_type
	.long	653                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x28d:0xb DW_TAG_subroutine_type
	.long	403                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x292:0x5 DW_TAG_formal_parameter
	.long	334                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x298:0x5 DW_TAG_pointer_type
	.long	669                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x29d:0x15 DW_TAG_subroutine_type
	.long	403                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x2a2:0x5 DW_TAG_formal_parameter
	.long	334                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x2a7:0x5 DW_TAG_formal_parameter
	.long	690                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x2ac:0x5 DW_TAG_formal_parameter
	.long	403                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x2b2:0x5 DW_TAG_pointer_type
	.long	63                              ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x2b7:0x5 DW_TAG_pointer_type
	.long	700                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x2bc:0x15 DW_TAG_subroutine_type
	.long	721                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x2c1:0x5 DW_TAG_formal_parameter
	.long	334                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x2c6:0x5 DW_TAG_formal_parameter
	.long	721                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x2cb:0x5 DW_TAG_formal_parameter
	.long	403                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	8                               ; Abbrev [8] 0x2d1:0x8 DW_TAG_typedef
	.long	729                             ; DW_AT_type
	.byte	35                              ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x2d9:0x8 DW_TAG_typedef
	.long	737                             ; DW_AT_type
	.byte	34                              ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x2e1:0x8 DW_TAG_typedef
	.long	745                             ; DW_AT_type
	.byte	33                              ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	37                              ; DW_AT_decl_line
	.byte	5                               ; Abbrev [5] 0x2e9:0x4 DW_TAG_base_type
	.byte	32                              ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	21                              ; Abbrev [21] 0x2ed:0x5 DW_TAG_pointer_type
	.long	754                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x2f2:0x15 DW_TAG_subroutine_type
	.long	403                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x2f7:0x5 DW_TAG_formal_parameter
	.long	334                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x2fc:0x5 DW_TAG_formal_parameter
	.long	775                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x301:0x5 DW_TAG_formal_parameter
	.long	403                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x307:0x5 DW_TAG_pointer_type
	.long	780                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x30c:0x5 DW_TAG_const_type
	.long	63                              ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x311:0x5 DW_TAG_pointer_type
	.long	790                             ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x316:0x2 DW_TAG_structure_type
	.byte	39                              ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	3                               ; Abbrev [3] 0x318:0xc DW_TAG_array_type
	.long	616                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x31d:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	3                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x324:0xc DW_TAG_array_type
	.long	616                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x329:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	1                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x330:0x5 DW_TAG_restrict_type
	.long	775                             ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x335:0x30 DW_TAG_subprogram
	.byte	14                              ; DW_AT_low_pc
.set Lset19, Lfunc_end1-Lfunc_begin1    ; DW_AT_high_pc
	.long	Lset19
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.byte	71                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	334                             ; DW_AT_type
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	13                              ; Abbrev [13] 0x344:0x9 DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	81                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	334                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x34d:0x9 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	82                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	76                              ; DW_AT_decl_line
	.long	403                             ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x356:0x8 DW_TAG_variable
	.byte	83                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	1562                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x35e:0x6 DW_TAG_call_site
	.long	383                             ; DW_AT_call_origin
	.byte	15                              ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x365:0xde DW_TAG_subprogram
	.byte	16                              ; DW_AT_low_pc
.set Lset20, Lfunc_end2-Lfunc_begin2    ; DW_AT_high_pc
	.long	Lset20
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.byte	72                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	403                             ; DW_AT_type
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	13                              ; Abbrev [13] 0x374:0x9 DW_TAG_formal_parameter
	.byte	4                               ; DW_AT_location
	.byte	84                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.long	403                             ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x37d:0x9 DW_TAG_formal_parameter
	.byte	5                               ; DW_AT_location
	.byte	85                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.long	1572                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x386:0x9 DW_TAG_variable
	.byte	6                               ; DW_AT_location
	.byte	86                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	403                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x38f:0x9 DW_TAG_variable
	.byte	7                               ; DW_AT_location
	.byte	87                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	403                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x398:0x9 DW_TAG_variable
	.byte	8                               ; DW_AT_location
	.byte	88                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	112                             ; DW_AT_decl_line
	.long	1228                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x3a1:0x9 DW_TAG_variable
	.byte	9                               ; DW_AT_location
	.byte	89                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	112                             ; DW_AT_decl_line
	.long	1228                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x3aa:0x8 DW_TAG_variable
	.byte	90                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	403                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x3b2:0xc DW_TAG_call_site
	.long	1091                            ; DW_AT_call_origin
	.byte	17                              ; DW_AT_call_return_pc
	.byte	26                              ; Abbrev [26] 0x3b8:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x3be:0x18 DW_TAG_call_site
	.long	1188                            ; DW_AT_call_origin
	.byte	18                              ; DW_AT_call_return_pc
	.byte	26                              ; Abbrev [26] 0x3c4:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	26                              ; Abbrev [26] 0x3c9:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	83
	.byte	2                               ; DW_AT_call_value
	.byte	145
	.byte	108
	.byte	26                              ; Abbrev [26] 0x3cf:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	143
	.byte	32
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x3d6:0x18 DW_TAG_call_site
	.long	1188                            ; DW_AT_call_origin
	.byte	19                              ; DW_AT_call_return_pc
	.byte	26                              ; Abbrev [26] 0x3dc:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	26                              ; Abbrev [26] 0x3e1:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	83
	.byte	2                               ; DW_AT_call_value
	.byte	145
	.byte	108
	.byte	26                              ; Abbrev [26] 0x3e7:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	143
	.byte	24
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x3ee:0xc DW_TAG_call_site
	.long	1422                            ; DW_AT_call_origin
	.byte	20                              ; DW_AT_call_return_pc
	.byte	26                              ; Abbrev [26] 0x3f4:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x3fa:0xc DW_TAG_call_site
	.long	1422                            ; DW_AT_call_origin
	.byte	21                              ; DW_AT_call_return_pc
	.byte	26                              ; Abbrev [26] 0x400:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	0                               ; End Of Children Mark
	.byte	16                              ; Abbrev [16] 0x406:0x6 DW_TAG_call_site
	.long	1448                            ; DW_AT_call_origin
	.byte	22                              ; DW_AT_call_return_pc
	.byte	16                              ; Abbrev [16] 0x40c:0x6 DW_TAG_call_site
	.long	1463                            ; DW_AT_call_origin
	.byte	23                              ; DW_AT_call_return_pc
	.byte	16                              ; Abbrev [16] 0x412:0x6 DW_TAG_call_site
	.long	1478                            ; DW_AT_call_origin
	.byte	24                              ; DW_AT_call_return_pc
	.byte	16                              ; Abbrev [16] 0x418:0x6 DW_TAG_call_site
	.long	1491                            ; DW_AT_call_origin
	.byte	25                              ; DW_AT_call_return_pc
	.byte	16                              ; Abbrev [16] 0x41e:0x6 DW_TAG_call_site
	.long	1478                            ; DW_AT_call_origin
	.byte	26                              ; DW_AT_call_return_pc
	.byte	16                              ; Abbrev [16] 0x424:0x6 DW_TAG_call_site
	.long	1491                            ; DW_AT_call_origin
	.byte	27                              ; DW_AT_call_return_pc
	.byte	16                              ; Abbrev [16] 0x42a:0x6 DW_TAG_call_site
	.long	1502                            ; DW_AT_call_origin
	.byte	28                              ; DW_AT_call_return_pc
	.byte	16                              ; Abbrev [16] 0x430:0x6 DW_TAG_call_site
	.long	1512                            ; DW_AT_call_origin
	.byte	29                              ; DW_AT_call_return_pc
	.byte	16                              ; Abbrev [16] 0x436:0x6 DW_TAG_call_site
	.long	1522                            ; DW_AT_call_origin
	.byte	30                              ; DW_AT_call_return_pc
	.byte	16                              ; Abbrev [16] 0x43c:0x6 DW_TAG_call_site
	.long	1532                            ; DW_AT_call_origin
	.byte	31                              ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x443:0x14 DW_TAG_subprogram
	.byte	48                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	388                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	403                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	18                              ; Abbrev [18] 0x44c:0x5 DW_TAG_formal_parameter
	.long	1111                            ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x451:0x5 DW_TAG_formal_parameter
	.long	1121                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x457:0x5 DW_TAG_restrict_type
	.long	1116                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x45c:0x5 DW_TAG_pointer_type
	.long	278                             ; DW_AT_type
	.byte	20                              ; Abbrev [20] 0x461:0x5 DW_TAG_restrict_type
	.long	1126                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x466:0x5 DW_TAG_pointer_type
	.long	1131                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x46b:0x5 DW_TAG_const_type
	.long	1136                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x470:0x8 DW_TAG_typedef
	.long	1144                            ; DW_AT_type
	.byte	51                              ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x478:0x8 DW_TAG_typedef
	.long	1152                            ; DW_AT_type
	.byte	50                              ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	114                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x480:0x18 DW_TAG_structure_type
	.byte	49                              ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x485:0x9 DW_TAG_member
	.byte	8                               ; DW_AT_name
	.long	318                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x48e:0x9 DW_TAG_member
	.byte	10                              ; DW_AT_name
	.long	1176                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	85                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x498:0xc DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x49d:0x6 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.byte	8                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x4a4:0x1e DW_TAG_subprogram
	.byte	52                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	338                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	403                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	18                              ; Abbrev [18] 0x4ad:0x5 DW_TAG_formal_parameter
	.long	1218                            ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x4b2:0x5 DW_TAG_formal_parameter
	.long	1346                            ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x4b7:0x5 DW_TAG_formal_parameter
	.long	1401                            ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x4bc:0x5 DW_TAG_formal_parameter
	.long	1417                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x4c2:0x5 DW_TAG_restrict_type
	.long	1223                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x4c7:0x5 DW_TAG_pointer_type
	.long	1228                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x4cc:0x8 DW_TAG_typedef
	.long	1236                            ; DW_AT_type
	.byte	60                              ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x4d4:0x8 DW_TAG_typedef
	.long	1244                            ; DW_AT_type
	.byte	59                              ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	118                             ; DW_AT_decl_line
	.byte	21                              ; Abbrev [21] 0x4dc:0x5 DW_TAG_pointer_type
	.long	1249                            ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x4e1:0x22 DW_TAG_structure_type
	.byte	58                              ; DW_AT_name
	.short	8192                            ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x4e7:0x9 DW_TAG_member
	.byte	8                               ; DW_AT_name
	.long	318                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	104                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x4f0:0x9 DW_TAG_member
	.byte	53                              ; DW_AT_name
	.long	1283                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	105                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x4f9:0x9 DW_TAG_member
	.byte	10                              ; DW_AT_name
	.long	1333                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x503:0x5 DW_TAG_pointer_type
	.long	1288                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x508:0x21 DW_TAG_structure_type
	.byte	57                              ; DW_AT_name
	.byte	24                              ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x50d:0x9 DW_TAG_member
	.byte	54                              ; DW_AT_name
	.long	1321                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	58                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x516:0x9 DW_TAG_member
	.byte	55                              ; DW_AT_name
	.long	334                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x51f:0x9 DW_TAG_member
	.byte	56                              ; DW_AT_name
	.long	1283                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x529:0x5 DW_TAG_pointer_type
	.long	1326                            ; DW_AT_type
	.byte	29                              ; Abbrev [29] 0x52e:0x7 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x52f:0x5 DW_TAG_formal_parameter
	.long	334                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x535:0xd DW_TAG_array_type
	.long	63                              ; DW_AT_type
	.byte	30                              ; Abbrev [30] 0x53a:0x7 DW_TAG_subrange_type
	.long	67                              ; DW_AT_type
	.short	8176                            ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x542:0x5 DW_TAG_restrict_type
	.long	1351                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x547:0x5 DW_TAG_pointer_type
	.long	1356                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x54c:0x5 DW_TAG_const_type
	.long	1361                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x551:0x8 DW_TAG_typedef
	.long	1369                            ; DW_AT_type
	.byte	63                              ; DW_AT_name
	.byte	9                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x559:0x8 DW_TAG_typedef
	.long	1377                            ; DW_AT_type
	.byte	62                              ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x561:0x18 DW_TAG_structure_type
	.byte	61                              ; DW_AT_name
	.byte	64                              ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	63                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x566:0x9 DW_TAG_member
	.byte	8                               ; DW_AT_name
	.long	318                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	64                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	10                              ; Abbrev [10] 0x56f:0x9 DW_TAG_member
	.byte	10                              ; DW_AT_name
	.long	322                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x579:0x5 DW_TAG_pointer_type
	.long	1406                            ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x57e:0xb DW_TAG_subroutine_type
	.long	334                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x583:0x5 DW_TAG_formal_parameter
	.long	334                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x589:0x5 DW_TAG_restrict_type
	.long	334                             ; DW_AT_type
	.byte	31                              ; Abbrev [31] 0x58e:0x15 DW_TAG_subprogram
	.byte	64                              ; DW_AT_linkage_name
	.byte	65                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	371                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	403                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	18                              ; Abbrev [18] 0x598:0x5 DW_TAG_formal_parameter
	.long	1228                            ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x59d:0x5 DW_TAG_formal_parameter
	.long	1443                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x5a3:0x5 DW_TAG_pointer_type
	.long	334                             ; DW_AT_type
	.byte	17                              ; Abbrev [17] 0x5a8:0xf DW_TAG_subprogram
	.byte	66                              ; DW_AT_name
	.byte	10                              ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	403                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	18                              ; Abbrev [18] 0x5b0:0x5 DW_TAG_formal_parameter
	.long	816                             ; DW_AT_type
	.byte	19                              ; Abbrev [19] 0x5b5:0x1 DW_TAG_unspecified_parameters
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x5b7:0xf DW_TAG_subprogram
	.byte	67                              ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.short	381                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	403                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	18                              ; Abbrev [18] 0x5c0:0x5 DW_TAG_formal_parameter
	.long	1116                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	32                              ; Abbrev [32] 0x5c6:0x8 DW_TAG_subprogram
	.byte	68                              ; DW_AT_name
	.byte	11                              ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1486                            ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x5ce:0x5 DW_TAG_pointer_type
	.long	403                             ; DW_AT_type
	.byte	33                              ; Abbrev [33] 0x5d3:0xb DW_TAG_subprogram
	.byte	69                              ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.short	264                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	18                              ; Abbrev [18] 0x5d8:0x5 DW_TAG_formal_parameter
	.long	775                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	34                              ; Abbrev [34] 0x5de:0xa DW_TAG_subprogram
	.byte	32                              ; DW_AT_low_pc
.set Lset21, Lfunc_end3-Lfunc_begin3    ; DW_AT_high_pc
	.long	Lset21
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	73                              ; DW_AT_linkage_name
	.byte	73                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	34                              ; Abbrev [34] 0x5e8:0xa DW_TAG_subprogram
	.byte	33                              ; DW_AT_low_pc
.set Lset22, Lfunc_end4-Lfunc_begin4    ; DW_AT_high_pc
	.long	Lset22
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	74                              ; DW_AT_linkage_name
	.byte	74                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	34                              ; Abbrev [34] 0x5f2:0xa DW_TAG_subprogram
	.byte	34                              ; DW_AT_low_pc
.set Lset23, Lfunc_end5-Lfunc_begin5    ; DW_AT_high_pc
	.long	Lset23
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	75                              ; DW_AT_linkage_name
	.byte	75                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	34                              ; Abbrev [34] 0x5fc:0xa DW_TAG_subprogram
	.byte	35                              ; DW_AT_low_pc
.set Lset24, Lfunc_end6-Lfunc_begin6    ; DW_AT_high_pc
	.long	Lset24
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	76                              ; DW_AT_linkage_name
	.byte	76                              ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	35                              ; Abbrev [35] 0x606:0xa DW_TAG_subprogram
	.byte	36                              ; DW_AT_low_pc
.set Lset25, Lfunc_end7-Lfunc_begin7    ; DW_AT_high_pc
	.long	Lset25
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	77                              ; DW_AT_linkage_name
	.byte	78                              ; DW_AT_name
                                        ; DW_AT_artificial
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	35                              ; Abbrev [35] 0x610:0xa DW_TAG_subprogram
	.byte	37                              ; DW_AT_low_pc
.set Lset26, Lfunc_end8-Lfunc_begin8    ; DW_AT_high_pc
	.long	Lset26
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	79                              ; DW_AT_linkage_name
	.byte	80                              ; DW_AT_name
                                        ; DW_AT_artificial
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x61a:0x5 DW_TAG_pointer_type
	.long	1567                            ; DW_AT_type
	.byte	36                              ; Abbrev [36] 0x61f:0x5 DW_TAG_volatile_type
	.long	403                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x624:0x5 DW_TAG_pointer_type
	.long	690                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str_offs,regular,debug
Lsection_str_off:
	.long	368                             ; Length of String Offsets Set
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
	.asciz	"decrease_fn"                   ; string offset=522
	.asciz	"main"                          ; string offset=534
	.asciz	"pthread_mutex_init"            ; string offset=539
	.asciz	"pthread_mutexattr_t"           ; string offset=558
	.asciz	"__darwin_pthread_mutexattr_t"  ; string offset=578
	.asciz	"_opaque_pthread_mutexattr_t"   ; string offset=607
	.asciz	"pthread_create"                ; string offset=635
	.asciz	"pthread_t"                     ; string offset=650
	.asciz	"__darwin_pthread_t"            ; string offset=660
	.asciz	"_opaque_pthread_t"             ; string offset=679
	.asciz	"__cleanup_stack"               ; string offset=697
	.asciz	"__darwin_pthread_handler_rec"  ; string offset=713
	.asciz	"__routine"                     ; string offset=742
	.asciz	"__arg"                         ; string offset=752
	.asciz	"__next"                        ; string offset=758
	.asciz	"pthread_attr_t"                ; string offset=765
	.asciz	"__darwin_pthread_attr_t"       ; string offset=780
	.asciz	"_opaque_pthread_attr_t"        ; string offset=804
	.asciz	"_pthread_join"                 ; string offset=827
	.asciz	"pthread_join"                  ; string offset=841
	.asciz	"printf"                        ; string offset=854
	.asciz	"pthread_mutex_destroy"         ; string offset=861
	.asciz	"__error"                       ; string offset=883
	.asciz	"perror"                        ; string offset=891
	.asciz	"main.cold.1"                   ; string offset=898
	.asciz	"main.cold.2"                   ; string offset=910
	.asciz	"main.cold.3"                   ; string offset=922
	.asciz	"main.cold.4"                   ; string offset=934
	.asciz	"OUTLINED_FUNCTION_0"           ; string offset=946
	.asciz	"_OUTLINED_FUNCTION_0"          ; string offset=966
	.asciz	"OUTLINED_FUNCTION_1"           ; string offset=987
	.asciz	"_OUTLINED_FUNCTION_1"          ; string offset=1007
	.asciz	"arg"                           ; string offset=1028
	.asciz	"i"                             ; string offset=1032
	.asciz	"ip"                            ; string offset=1034
	.asciz	"argc"                          ; string offset=1037
	.asciz	"argv"                          ; string offset=1042
	.asciz	"val"                           ; string offset=1047
	.asciz	"ret"                           ; string offset=1051
	.asciz	"t1"                            ; string offset=1055
	.asciz	"t2"                            ; string offset=1058
	.asciz	"ok"                            ; string offset=1061
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
	.long	539
	.long	607
	.long	578
	.long	558
	.long	635
	.long	697
	.long	742
	.long	752
	.long	758
	.long	713
	.long	679
	.long	660
	.long	650
	.long	804
	.long	780
	.long	765
	.long	827
	.long	841
	.long	854
	.long	861
	.long	883
	.long	891
	.long	278
	.long	522
	.long	534
	.long	898
	.long	910
	.long	922
	.long	934
	.long	966
	.long	946
	.long	1007
	.long	987
	.long	1028
	.long	1032
	.long	1034
	.long	1037
	.long	1042
	.long	1047
	.long	1051
	.long	1055
	.long	1058
	.long	1061
	.section	__DWARF,__debug_addr,regular,debug
Lsection_info0:
.set Lset27, Ldebug_addr_end0-Ldebug_addr_start0 ; Length of contribution
	.long	Lset27
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
	.quad	_mutex
	.quad	Lfunc_begin0
	.quad	Ltmp2
	.quad	Lfunc_begin1
	.quad	Ltmp12
	.quad	Lfunc_begin2
	.quad	Ltmp23
	.quad	Ltmp26
	.quad	Ltmp29
	.quad	Ltmp32
	.quad	Ltmp35
	.quad	Ltmp38
	.quad	Ltmp39
	.quad	Ltmp45
	.quad	Ltmp46
	.quad	Ltmp49
	.quad	Ltmp50
	.quad	Ltmp52
	.quad	Ltmp53
	.quad	Ltmp54
	.quad	Ltmp55
	.quad	Lfunc_begin3
	.quad	Lfunc_begin4
	.quad	Lfunc_begin5
	.quad	Lfunc_begin6
	.quad	Lfunc_begin7
	.quad	Lfunc_begin8
Ldebug_addr_end0:
	.section	__DWARF,__debug_names,regular,debug
Ldebug_names_begin:
.set Lset28, Lnames_end0-Lnames_start0  ; Header: unit length
	.long	Lset28
Lnames_start0:
	.short	5                               ; Header: version
	.short	0                               ; Header: padding
	.long	1                               ; Header: compilation unit count
	.long	0                               ; Header: local type unit count
	.long	0                               ; Header: foreign type unit count
	.long	19                              ; Header: bucket count
	.long	38                              ; Header: name count
.set Lset29, Lnames_abbrev_end0-Lnames_abbrev_start0 ; Header: abbreviation table size
	.long	Lset29
	.long	8                               ; Header: augmentation string size
	.ascii	"LLVM0700"                      ; Header: augmentation string
.set Lset30, Lcu_begin0-Lsection_info   ; Compilation unit 0
	.long	Lset30
	.long	1                               ; Bucket 0
	.long	2                               ; Bucket 1
	.long	4                               ; Bucket 2
	.long	0                               ; Bucket 3
	.long	5                               ; Bucket 4
	.long	8                               ; Bucket 5
	.long	13                              ; Bucket 6
	.long	14                              ; Bucket 7
	.long	15                              ; Bucket 8
	.long	18                              ; Bucket 9
	.long	21                              ; Bucket 10
	.long	25                              ; Bucket 11
	.long	0                               ; Bucket 12
	.long	30                              ; Bucket 13
	.long	31                              ; Bucket 14
	.long	33                              ; Bucket 15
	.long	37                              ; Bucket 16
	.long	0                               ; Bucket 17
	.long	38                              ; Bucket 18
	.long	193495088                       ; Hash in Bucket 0
	.long	943712540                       ; Hash in Bucket 1
	.long	-143589579                      ; Hash in Bucket 1
	.long	1015836598                      ; Hash in Bucket 2
	.long	922188013                       ; Hash in Bucket 4
	.long	1297205472                      ; Hash in Bucket 4
	.long	-1601712561                     ; Hash in Bucket 4
	.long	77135977                        ; Hash in Bucket 5
	.long	730786460                       ; Hash in Bucket 5
	.long	2090147939                      ; Hash in Bucket 5
	.long	2090257189                      ; Hash in Bucket 5
	.long	2090479413                      ; Hash in Bucket 5
	.long	730786461                       ; Hash in Bucket 6
	.long	-440181150                      ; Hash in Bucket 7
	.long	647281140                       ; Hash in Bucket 8
	.long	1261628793                      ; Hash in Bucket 8
	.long	1950644907                      ; Hash in Bucket 8
	.long	274395349                       ; Hash in Bucket 9
	.long	1261628794                      ; Hash in Bucket 9
	.long	-328142765                      ; Hash in Bucket 9
	.long	217009403                       ; Hash in Bucket 10
	.long	519921938                       ; Hash in Bucket 10
	.long	1261628795                      ; Hash in Bucket 10
	.long	-461612197                      ; Hash in Bucket 10
	.long	1261628796                      ; Hash in Bucket 11
	.long	2065860549                      ; Hash in Bucket 11
	.long	-1921963995                     ; Hash in Bucket 11
	.long	-565815948                      ; Hash in Bucket 11
	.long	-34160304                       ; Hash in Bucket 11
	.long	-104093792                      ; Hash in Bucket 13
	.long	1595644866                      ; Hash in Bucket 14
	.long	-154593283                      ; Hash in Bucket 14
	.long	267752024                       ; Hash in Bucket 15
	.long	2056321622                      ; Hash in Bucket 15
	.long	-1235945222                     ; Hash in Bucket 15
	.long	-154593282                      ; Hash in Bucket 15
	.long	-1656140253                     ; Hash in Bucket 16
	.long	2090499946                      ; Hash in Bucket 18
	.long	298                             ; String in Bucket 0: int
	.long	780                             ; String in Bucket 1: __darwin_pthread_attr_t
	.long	423                             ; String in Bucket 1: __darwin_off_t
	.long	607                             ; String in Bucket 2: _opaque_pthread_mutexattr_t
	.long	558                             ; String in Bucket 4: pthread_mutexattr_t
	.long	650                             ; String in Bucket 4: pthread_t
	.long	578                             ; String in Bucket 4: __darwin_pthread_mutexattr_t
	.long	679                             ; String in Bucket 5: _opaque_pthread_t
	.long	966                             ; String in Bucket 5: _OUTLINED_FUNCTION_0
	.long	162                             ; String in Bucket 5: char
	.long	302                             ; String in Bucket 5: FILE
	.long	264                             ; String in Bucket 5: long
	.long	1007                            ; String in Bucket 6: _OUTLINED_FUNCTION_1
	.long	278                             ; String in Bucket 7: increase_fn
	.long	522                             ; String in Bucket 8: decrease_fn
	.long	898                             ; String in Bucket 8: main.cold.1
	.long	438                             ; String in Bucket 8: __int64_t
	.long	345                             ; String in Bucket 9: short
	.long	910                             ; String in Bucket 9: main.cold.2
	.long	361                             ; String in Bucket 9: __sbuf
	.long	167                             ; String in Bucket 10: __ARRAY_SIZE_TYPE__
	.long	193                             ; String in Bucket 10: pthread_mutex_t
	.long	922                             ; String in Bucket 10: main.cold.3
	.long	234                             ; String in Bucket 10: _opaque_pthread_mutex_t
	.long	934                             ; String in Bucket 11: main.cold.4
	.long	713                             ; String in Bucket 11: __darwin_pthread_handler_rec
	.long	448                             ; String in Bucket 11: long long
	.long	209                             ; String in Bucket 11: __darwin_pthread_mutex_t
	.long	416                             ; String in Bucket 11: fpos_t
	.long	318                             ; String in Bucket 13: unsigned char
	.long	660                             ; String in Bucket 14: __darwin_pthread_t
	.long	946                             ; String in Bucket 14: OUTLINED_FUNCTION_0
	.long	187                             ; String in Bucket 15: mutex
	.long	307                             ; String in Bucket 15: __sFILE
	.long	765                             ; String in Bucket 15: pthread_attr_t
	.long	987                             ; String in Bucket 15: OUTLINED_FUNCTION_1
	.long	804                             ; String in Bucket 16: _opaque_pthread_attr_t
	.long	534                             ; String in Bucket 18: main
.set Lset31, Lnames8-Lnames_entries0    ; Offset in Bucket 0
	.long	Lset31
.set Lset32, Lnames28-Lnames_entries0   ; Offset in Bucket 1
	.long	Lset32
.set Lset33, Lnames15-Lnames_entries0   ; Offset in Bucket 1
	.long	Lset33
.set Lset34, Lnames22-Lnames_entries0   ; Offset in Bucket 2
	.long	Lset34
.set Lset35, Lnames20-Lnames_entries0   ; Offset in Bucket 4
	.long	Lset35
.set Lset36, Lnames23-Lnames_entries0   ; Offset in Bucket 4
	.long	Lset36
.set Lset37, Lnames21-Lnames_entries0   ; Offset in Bucket 4
	.long	Lset37
.set Lset38, Lnames25-Lnames_entries0   ; Offset in Bucket 5
	.long	Lset38
.set Lset39, Lnames35-Lnames_entries0   ; Offset in Bucket 5
	.long	Lset39
.set Lset40, Lnames0-Lnames_entries0    ; Offset in Bucket 5
	.long	Lset40
.set Lset41, Lnames9-Lnames_entries0    ; Offset in Bucket 5
	.long	Lset41
.set Lset42, Lnames5-Lnames_entries0    ; Offset in Bucket 5
	.long	Lset42
.set Lset43, Lnames37-Lnames_entries0   ; Offset in Bucket 6
	.long	Lset43
.set Lset44, Lnames7-Lnames_entries0    ; Offset in Bucket 7
	.long	Lset44
.set Lset45, Lnames18-Lnames_entries0   ; Offset in Bucket 8
	.long	Lset45
.set Lset46, Lnames30-Lnames_entries0   ; Offset in Bucket 8
	.long	Lset46
.set Lset47, Lnames16-Lnames_entries0   ; Offset in Bucket 8
	.long	Lset47
.set Lset48, Lnames12-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset48
.set Lset49, Lnames31-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset49
.set Lset50, Lnames13-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset50
.set Lset51, Lnames1-Lnames_entries0    ; Offset in Bucket 10
	.long	Lset51
.set Lset52, Lnames2-Lnames_entries0    ; Offset in Bucket 10
	.long	Lset52
.set Lset53, Lnames32-Lnames_entries0   ; Offset in Bucket 10
	.long	Lset53
.set Lset54, Lnames4-Lnames_entries0    ; Offset in Bucket 10
	.long	Lset54
.set Lset55, Lnames33-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset55
.set Lset56, Lnames26-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset56
.set Lset57, Lnames17-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset57
.set Lset58, Lnames3-Lnames_entries0    ; Offset in Bucket 11
	.long	Lset58
.set Lset59, Lnames14-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset59
.set Lset60, Lnames11-Lnames_entries0   ; Offset in Bucket 13
	.long	Lset60
.set Lset61, Lnames24-Lnames_entries0   ; Offset in Bucket 14
	.long	Lset61
.set Lset62, Lnames34-Lnames_entries0   ; Offset in Bucket 14
	.long	Lset62
.set Lset63, Lnames6-Lnames_entries0    ; Offset in Bucket 15
	.long	Lset63
.set Lset64, Lnames10-Lnames_entries0   ; Offset in Bucket 15
	.long	Lset64
.set Lset65, Lnames27-Lnames_entries0   ; Offset in Bucket 15
	.long	Lset65
.set Lset66, Lnames36-Lnames_entries0   ; Offset in Bucket 15
	.long	Lset66
.set Lset67, Lnames29-Lnames_entries0   ; Offset in Bucket 16
	.long	Lset67
.set Lset68, Lnames19-Lnames_entries0   ; Offset in Bucket 18
	.long	Lset68
Lnames_abbrev_start0:
	.byte	1                               ; Abbrev code
	.byte	36                              ; DW_TAG_base_type
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	2                               ; Abbrev code
	.byte	22                              ; DW_TAG_typedef
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	3                               ; Abbrev code
	.byte	19                              ; DW_TAG_structure_type
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	4                               ; Abbrev code
	.byte	46                              ; DW_TAG_subprogram
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
Lnames8:
L6:
	.byte	1                               ; Abbreviation code
	.long	403                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int
Lnames28:
L5:
	.byte	2                               ; Abbreviation code
	.long	1369                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_attr_t
Lnames15:
L13:
	.byte	2                               ; Abbreviation code
	.long	729                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_off_t
Lnames22:
L26:
	.byte	3                               ; Abbreviation code
	.long	1152                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _opaque_pthread_mutexattr_t
Lnames20:
L17:
	.byte	2                               ; Abbreviation code
	.long	1136                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: pthread_mutexattr_t
Lnames23:
L7:
	.byte	2                               ; Abbreviation code
	.long	1228                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: pthread_t
Lnames21:
L27:
	.byte	2                               ; Abbreviation code
	.long	1144                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_mutexattr_t
Lnames25:
L14:
	.byte	3                               ; Abbreviation code
	.long	1249                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _opaque_pthread_t
Lnames35:
L2:
	.byte	4                               ; Abbreviation code
	.long	1542                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _OUTLINED_FUNCTION_0
Lnames0:
L24:
	.byte	1                               ; Abbreviation code
	.long	63                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: char
Lnames9:
L8:
	.byte	2                               ; Abbreviation code
	.long	417                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: FILE
Lnames5:
L25:
	.byte	1                               ; Abbreviation code
	.long	318                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: long
Lnames37:
L31:
	.byte	4                               ; Abbreviation code
	.long	1552                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _OUTLINED_FUNCTION_1
Lnames7:
L20:
	.byte	4                               ; Abbreviation code
	.long	335                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: increase_fn
Lnames18:
L32:
	.byte	4                               ; Abbreviation code
	.long	821                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: decrease_fn
Lnames30:
L3:
	.byte	4                               ; Abbreviation code
	.long	1502                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main.cold.1
Lnames16:
L1:
	.byte	2                               ; Abbreviation code
	.long	737                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __int64_t
Lnames12:
L9:
	.byte	1                               ; Abbreviation code
	.long	620                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: short
Lnames31:
L23:
	.byte	4                               ; Abbreviation code
	.long	1512                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main.cold.2
Lnames13:
L11:
	.byte	3                               ; Abbreviation code
	.long	624                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __sbuf
Lnames1:
L18:
	.byte	1                               ; Abbreviation code
	.long	67                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __ARRAY_SIZE_TYPE__
Lnames2:
L16:
	.byte	2                               ; Abbreviation code
	.long	278                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: pthread_mutex_t
Lnames32:
L29:
	.byte	4                               ; Abbreviation code
	.long	1522                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main.cold.3
Lnames4:
L30:
	.byte	3                               ; Abbreviation code
	.long	294                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _opaque_pthread_mutex_t
Lnames33:
L4:
	.byte	4                               ; Abbreviation code
	.long	1532                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main.cold.4
Lnames26:
L28:
	.byte	3                               ; Abbreviation code
	.long	1288                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_handler_rec
Lnames17:
L10:
	.byte	1                               ; Abbreviation code
	.long	745                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: long long
Lnames3:
L21:
	.byte	2                               ; Abbreviation code
	.long	286                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_mutex_t
Lnames14:
L15:
	.byte	2                               ; Abbreviation code
	.long	721                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: fpos_t
Lnames11:
L22:
	.byte	1                               ; Abbreviation code
	.long	616                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned char
Lnames24:
L19:
	.byte	2                               ; Abbreviation code
	.long	1236                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_pthread_t
Lnames34:
	.byte	4                               ; Abbreviation code
	.long	1542                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: OUTLINED_FUNCTION_0
Lnames6:
L12:
	.byte	5                               ; Abbreviation code
	.long	267                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: mutex
Lnames10:
L33:
	.byte	3                               ; Abbreviation code
	.long	425                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __sFILE
Lnames27:
L35:
	.byte	2                               ; Abbreviation code
	.long	1361                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: pthread_attr_t
Lnames36:
	.byte	4                               ; Abbreviation code
	.long	1552                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: OUTLINED_FUNCTION_1
Lnames29:
L34:
	.byte	3                               ; Abbreviation code
	.long	1377                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: _opaque_pthread_attr_t
Lnames19:
L0:
	.byte	4                               ; Abbreviation code
	.long	869                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: main
	.p2align	2, 0x0
Lnames_end0:
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
