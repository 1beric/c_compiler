.text
# function main
# formals: 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -36); tmp$9 (loc: -40); tmp$10 (loc: -44); tmp$11 (loc: -48); 
# space for locals: 48 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -48($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$0
    li $t0, 1
    sw $t0, -4($fp)	# tmp$0

    # move tmp$0, a
    lw $t0, -4($fp)	# tmp$0
    sw $t0, _a

    # no_op 

    # move 2, tmp$1
    li $t0, 2
    sw $t0, -8($fp)	# tmp$1

    # move tmp$1, b
    lw $t0, -8($fp)	# tmp$1
    sw $t0, _b

    # no_op 

    # move 3, tmp$2
    li $t0, 3
    sw $t0, -12($fp)	# tmp$2

    # move tmp$2, c
    lw $t0, -12($fp)	# tmp$2
    sw $t0, _c

    # no_op 

    # move 4, tmp$3
    li $t0, 4
    sw $t0, -16($fp)	# tmp$3

    # move tmp$3, d
    lw $t0, -16($fp)	# tmp$3
    sw $t0, _d

    # no_op 

    # move 5, tmp$4
    li $t0, 5
    sw $t0, -20($fp)	# tmp$4

    # move tmp$4, e
    lw $t0, -20($fp)	# tmp$4
    sw $t0, _e

    # no_op 

    # move 6, tmp$5
    li $t0, 6
    sw $t0, -24($fp)	# tmp$5

    # move tmp$5, f
    lw $t0, -24($fp)	# tmp$5
    sw $t0, _f

    # no_op 

    # move 7, tmp$6
    li $t0, 7
    sw $t0, -28($fp)	# tmp$6

    # move tmp$6, g
    lw $t0, -28($fp)	# tmp$6
    sw $t0, _g

    # no_op 

    # move 8, tmp$7
    li $t0, 8
    sw $t0, -32($fp)	# tmp$7

    # move tmp$7, h
    lw $t0, -32($fp)	# tmp$7
    sw $t0, _h

    # no_op 

    # move 9, tmp$8
    li $t0, 9
    sw $t0, -36($fp)	# tmp$8

    # move tmp$8, i
    lw $t0, -36($fp)	# tmp$8
    sw $t0, _i

    # no_op 

    # move 10, tmp$9
    li $t0, 10
    sw $t0, -40($fp)	# tmp$9

    # move tmp$9, j
    lw $t0, -40($fp)	# tmp$9
    sw $t0, _j

    # no_op 

    # no_op 

    # if_le a, b, label 6
    lw $t0, _a
    lw $t1, _b
    ble $t0, $t1, Lbl6

    # goto label 1
    j Lbl1

    # label 6
Lbl6:

    # no_op 

    # no_op 

    # if_le b, c, label 5
    lw $t0, _b
    lw $t1, _c
    ble $t0, $t1, Lbl5

    # goto label 1
    j Lbl1

    # label 5
Lbl5:

    # no_op 

    # no_op 

    # if_le c, d, label 4
    lw $t0, _c
    lw $t1, _d
    ble $t0, $t1, Lbl4

    # goto label 1
    j Lbl1

    # label 4
Lbl4:

    # no_op 

    # no_op 

    # if_le d, e, label 3
    lw $t0, _d
    lw $t1, _e
    ble $t0, $t1, Lbl3

    # goto label 1
    j Lbl1

    # label 3
Lbl3:

    # no_op 

    # no_op 

    # if_gt e, f, label 1
    lw $t0, _e
    lw $t1, _f
    bgt $t0, $t1, Lbl1

    # goto label 10
    j Lbl10

    # label 10
Lbl10:

    # no_op 

    # no_op 

    # if_gt f, g, label 1
    lw $t0, _f
    lw $t1, _g
    bgt $t0, $t1, Lbl1

    # goto label 9
    j Lbl9

    # label 9
Lbl9:

    # no_op 

    # no_op 

    # if_gt g, h, label 1
    lw $t0, _g
    lw $t1, _h
    bgt $t0, $t1, Lbl1

    # goto label 8
    j Lbl8

    # label 8
Lbl8:

    # no_op 

    # no_op 

    # if_gt h, i, label 1
    lw $t0, _h
    lw $t1, _i
    bgt $t0, $t1, Lbl1

    # goto label 7
    j Lbl7

    # label 7
Lbl7:

    # no_op 

    # no_op 

    # if_gt i, j, label 1
    lw $t0, _i
    lw $t1, _j
    bgt $t0, $t1, Lbl1

    # goto label 0
    j Lbl0

    # label 0
Lbl0:

    # no_op 

    # move 1111, tmp$10
    li $t0, 1111
    sw $t0, -44($fp)	# tmp$10

    # move tmp$10, res
    lw $t0, -44($fp)	# tmp$10
    sw $t0, _res

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move 2222, tmp$11
    li $t0, 2222
    sw $t0, -48($fp)	# tmp$11

    # move tmp$11, res
    lw $t0, -48($fp)	# tmp$11
    sw $t0, _res

    # label 2
Lbl2:

    # no_op 

    # param res
    lw $t0, _res
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # leave main

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave main

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function main


.data
.align 2
.align 2
_res:  .space 4
.align 2
_a:  .space 4
.align 2
_b:  .space 4
.align 2
_c:  .space 4
.align 2
_d:  .space 4
.align 2
_e:  .space 4
.align 2
_f:  .space 4
.align 2
_g:  .space 4
.align 2
_h:  .space 4
.align 2
_i:  .space 4
.align 2
_j:  .space 4

.align 2
.data
__nl: .asciiz "\n"
.align 2
.text
# println: print out an integer followed by a newline
 _println:
    li $v0, 1
    lw $a0, 0($sp)
    syscall
    li $v0, 4
    la $a0, __nl
    syscall
    jr $ra

# jump to _main, where user code starts, at start of execution
main:
    j _main

