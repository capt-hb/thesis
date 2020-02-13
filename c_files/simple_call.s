	.text
	.abicalls
	.section	.mdebug.abi64,"",@progbits
	.nan	legacy
	.file	"simple_call.c"
	.text
	.globl	doSomething             # -- Begin function doSomething
	.p2align	3
	.type	doSomething,@function
	.set	nomicromips
	.set	nomips16
	.ent	doSomething
doSomething:                            # @doSomething
	.frame	$c11,16,$c17
	.mask 	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:                                # %entry
	cincoffset	$c11, $c11, -16
                                        # kill: def $a0 killed $a0 killed $a0_64
	cincoffset	$c1, $c11, 12
	csetbounds	$c1, $c1, 4
	csw	$4, $zero, 0($c1)
	clw	$2, $zero, 0($c1)
	cincoffset	$c11, $c11, 16
	cjr	$c17
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	doSomething
.Lfunc_end0:
	.size	doSomething, .Lfunc_end0-doSomething
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	3
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.frame	$c11,64,$c17
	.mask 	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:                                # %entry
	cincoffset	$c11, $c11, -64
	csc	$c17, $zero, 48($c11)   # 16-byte Folded Spill
	lui	$1, %hi(%neg(%captab_rel(main)))
	daddiu	$1, $1, %lo(%neg(%captab_rel(main)))
	cincoffset	$c26, $c12, $1
	cmove	$c1, $c26
	cincoffset	$c2, $c11, 44
	csetbounds	$c2, $c2, 4
	cincoffset	$c3, $c11, 40
	csetbounds	$c3, $c3, 4
	addiu	$2, $zero, 0
	csw	$zero, $zero, 0($c2)
	clcbi	$c12, %capcall20(doSomething)($c1)
	daddiu	$4, $zero, 100
	cgetnull	$c13
	csc	$c3, $zero, 16($c11)    # 16-byte Folded Spill
	csw	$2, $zero, 12($c11)     # 4-byte Folded Spill
	cjalr	$c12, $c17
	nop
	clc	$c1, $zero, 16($c11)    # 16-byte Folded Reload
	csw	$2, $zero, 0($c1)
	clw	$2, $zero, 0($c1)
	clc	$c17, $zero, 48($c11)   # 16-byte Folded Reload
	cincoffset	$c11, $c11, 64
	cjr	$c17
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	main
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
                                        # -- End function

	.ident	"clang version 9.0.0 (git@github.com:capt-hb/llvm-project.git 39c89f7d086070b149443c4bd3ca31c30ba14c97)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym doSomething
	.text
