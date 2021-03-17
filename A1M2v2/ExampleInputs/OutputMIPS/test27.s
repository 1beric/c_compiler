.text
# function main
# formals: 
# locals: res (loc: -4); i (loc: -8); j (loc: -12); k (loc: -16); tmp$0 (loc: -20); tmp$1 (loc: -24); tmp$2 (loc: -28); tmp$3 (loc: -32); tmp$4 (loc: -36); tmp$5 (loc: -40); tmp$6 (loc: -44); tmp$7 (loc: -48); tmp$8 (loc: -52); tmp$9 (loc: -56); tmp$10 (loc: -60); tmp$11 (loc: -64); tmp$12 (loc: -68); tmp$13 (loc: -72); tmp$14 (loc: -76); tmp$15 (loc: -80); tmp$16 (loc: -84); tmp$17 (loc: -88); 
# space for locals: 88 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -88($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$0
    li $t0, 0
    sw $t0, -20($fp)	# tmp$0

    # move tmp$0, res
    lw $t0, -20($fp)	# tmp$0
    sw $t0, -4($fp)	# res

    # no_op 

    # move 0, tmp$1
    li $t0, 0
    sw $t0, -24($fp)	# tmp$1

    # move tmp$1, i
    lw $t0, -24($fp)	# tmp$1
    sw $t0, -8($fp)	# i

    # label 0
Lbl0:

    # no_op 

    # move 5, tmp$2
    li $t0, 5
    sw $t0, -28($fp)	# tmp$2

    # if_lt i, tmp$2, label 1
    lw $t0, -8($fp)	# i
    lw $t1, -28($fp)	# tmp$2
    blt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move 0, tmp$5
    li $t0, 0
    sw $t0, -40($fp)	# tmp$5

    # move tmp$5, j
    lw $t0, -40($fp)	# tmp$5
    sw $t0, -12($fp)	# j

    # label 3
Lbl3:

    # no_op 

    # move 10, tmp$6
    li $t0, 10
    sw $t0, -44($fp)	# tmp$6

    # if_lt j, tmp$6, label 4
    lw $t0, -12($fp)	# j
    lw $t1, -44($fp)	# tmp$6
    blt $t0, $t1, Lbl4

    # goto label 5
    j Lbl5

    # label 4
Lbl4:

    # no_op 

    # move 0, tmp$7
    li $t0, 0
    sw $t0, -48($fp)	# tmp$7

    # move tmp$7, k
    lw $t0, -48($fp)	# tmp$7
    sw $t0, -16($fp)	# k

    # label 6
Lbl6:

    # no_op 

    # move 15, tmp$8
    li $t0, 15
    sw $t0, -52($fp)	# tmp$8

    # if_lt k, tmp$8, label 7
    lw $t0, -16($fp)	# k
    lw $t1, -52($fp)	# tmp$8
    blt $t0, $t1, Lbl7

    # goto label 8
    j Lbl8

    # label 7
Lbl7:

    # no_op 

    # no_op 

    # no_op 

    # no_op 

    # add i, j, tmp$14
    lw $t0, -8($fp)	# i
    lw $t1, -12($fp)	# j
    add $t2, $t0, $t1
    sw $t2, -76($fp)	# tmp$14

    # no_op 

    # add tmp$14, k, tmp$13
    lw $t0, -76($fp)	# tmp$14
    lw $t1, -16($fp)	# k
    add $t2, $t0, $t1
    sw $t2, -72($fp)	# tmp$13

    # move 3, tmp$15
    li $t0, 3
    sw $t0, -80($fp)	# tmp$15

    # div tmp$13, tmp$15, tmp$12
    lw $t0, -72($fp)	# tmp$13
    lw $t1, -80($fp)	# tmp$15
    div $t2, $t0, $t1
    sw $t2, -68($fp)	# tmp$12

    # add res, tmp$12, tmp$11
    lw $t0, -4($fp)	# res
    lw $t1, -68($fp)	# tmp$12
    add $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$11

    # move tmp$11, res
    lw $t0, -64($fp)	# tmp$11
    sw $t0, -4($fp)	# res

    # no_op 

    # no_op 

    # move 3, tmp$10
    li $t0, 3
    sw $t0, -60($fp)	# tmp$10

    # add k, tmp$10, tmp$9
    lw $t0, -16($fp)	# k
    lw $t1, -60($fp)	# tmp$10
    add $t2, $t0, $t1
    sw $t2, -56($fp)	# tmp$9

    # move tmp$9, k
    lw $t0, -56($fp)	# tmp$9
    sw $t0, -16($fp)	# k

    # goto label 6
    j Lbl6

    # label 8
Lbl8:

    # no_op 

    # no_op 

    # move 2, tmp$17
    li $t0, 2
    sw $t0, -88($fp)	# tmp$17

    # add j, tmp$17, tmp$16
    lw $t0, -12($fp)	# j
    lw $t1, -88($fp)	# tmp$17
    add $t2, $t0, $t1
    sw $t2, -84($fp)	# tmp$16

    # move tmp$16, j
    lw $t0, -84($fp)	# tmp$16
    sw $t0, -12($fp)	# j

    # goto label 3
    j Lbl3

    # label 5
Lbl5:

    # no_op 

    # no_op 

    # move 1, tmp$4
    li $t0, 1
    sw $t0, -36($fp)	# tmp$4

    # add i, tmp$4, tmp$3
    lw $t0, -8($fp)	# i
    lw $t1, -36($fp)	# tmp$4
    add $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$3

    # move tmp$3, i
    lw $t0, -32($fp)	# tmp$3
    sw $t0, -8($fp)	# i

    # goto label 0
    j Lbl0

    # label 2
Lbl2:

    # no_op 

    # param res
    lw $t0, -4($fp)	# res
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

