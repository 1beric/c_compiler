.text
# function main
# formals: 
# locals: res (loc: -4); a (loc: -8); b (loc: -12); i (loc: -16); j (loc: -20); k (loc: -24); tmp$0 (loc: -28); tmp$1 (loc: -32); tmp$2 (loc: -36); tmp$3 (loc: -40); tmp$4 (loc: -44); tmp$5 (loc: -48); tmp$6 (loc: -52); tmp$7 (loc: -56); tmp$8 (loc: -60); tmp$9 (loc: -64); tmp$10 (loc: -68); tmp$20 (loc: -72); tmp$11 (loc: -76); tmp$12 (loc: -80); tmp$13 (loc: -84); tmp$14 (loc: -88); tmp$15 (loc: -92); tmp$16 (loc: -96); tmp$17 (loc: -100); tmp$18 (loc: -104); tmp$19 (loc: -108); 
# space for locals: 108 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -108($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$0
    li $t0, 0
    sw $t0, -28($fp)	# tmp$0

    # move tmp$0, i
    lw $t0, -28($fp)	# tmp$0
    sw $t0, -16($fp)	# i

    # no_op 

    # move 123, tmp$1
    li $t0, 123
    sw $t0, -32($fp)	# tmp$1

    # move tmp$1, res
    lw $t0, -32($fp)	# tmp$1
    sw $t0, -4($fp)	# res

    # label 0
Lbl0:

    # no_op 

    # move 5, tmp$2
    li $t0, 5
    sw $t0, -36($fp)	# tmp$2

    # if_lt i, tmp$2, label 1
    lw $t0, -16($fp)	# i
    lw $t1, -36($fp)	# tmp$2
    blt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move 0, tmp$3
    li $t0, 0
    sw $t0, -40($fp)	# tmp$3

    # move tmp$3, j
    lw $t0, -40($fp)	# tmp$3
    sw $t0, -20($fp)	# j

    # label 3
Lbl3:

    # no_op 

    # move 5, tmp$4
    li $t0, 5
    sw $t0, -44($fp)	# tmp$4

    # if_lt j, tmp$4, label 4
    lw $t0, -20($fp)	# j
    lw $t1, -44($fp)	# tmp$4
    blt $t0, $t1, Lbl4

    # goto label 5
    j Lbl5

    # label 4
Lbl4:

    # no_op 

    # no_op 

    # no_op 

    # add i, j, tmp$6
    lw $t0, -16($fp)	# i
    lw $t1, -20($fp)	# j
    add $t2, $t0, $t1
    sw $t2, -52($fp)	# tmp$6

    # move 2, tmp$7
    li $t0, 2
    sw $t0, -56($fp)	# tmp$7

    # div tmp$6, tmp$7, tmp$5
    lw $t0, -52($fp)	# tmp$6
    lw $t1, -56($fp)	# tmp$7
    div $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$5

    # move tmp$5, k
    lw $t0, -48($fp)	# tmp$5
    sw $t0, -24($fp)	# k

    # no_op 

    # no_op 

    # if_gt k, i, label 6
    lw $t0, -24($fp)	# k
    lw $t1, -16($fp)	# i
    bgt $t0, $t1, Lbl6

    # goto label 7
    j Lbl7

    # label 6
Lbl6:

    # no_op 

    # move 0, tmp$8
    li $t0, 0
    sw $t0, -60($fp)	# tmp$8

    # move tmp$8, a
    lw $t0, -60($fp)	# tmp$8
    sw $t0, -8($fp)	# a

    # label 9
Lbl9:

    # no_op 

    # move 5, tmp$9
    li $t0, 5
    sw $t0, -64($fp)	# tmp$9

    # if_lt a, tmp$9, label 10
    lw $t0, -8($fp)	# a
    lw $t1, -64($fp)	# tmp$9
    blt $t0, $t1, Lbl10

    # goto label 11
    j Lbl11

    # label 10
Lbl10:

    # no_op 

    # no_op 

    # no_op 

    # add a, k, tmp$11
    lw $t0, -8($fp)	# a
    lw $t1, -24($fp)	# k
    add $t2, $t0, $t1
    sw $t2, -76($fp)	# tmp$11

    # move 2, tmp$12
    li $t0, 2
    sw $t0, -80($fp)	# tmp$12

    # div tmp$11, tmp$12, tmp$10
    lw $t0, -76($fp)	# tmp$11
    lw $t1, -80($fp)	# tmp$12
    div $t2, $t0, $t1
    sw $t2, -68($fp)	# tmp$10

    # move tmp$10, b
    lw $t0, -68($fp)	# tmp$10
    sw $t0, -12($fp)	# b

    # no_op 

    # no_op 

    # if_gt b, j, label 12
    lw $t0, -12($fp)	# b
    lw $t1, -20($fp)	# j
    bgt $t0, $t1, Lbl12

    # goto label 13
    j Lbl13

    # label 12
Lbl12:

    # no_op 

    # no_op 

    # no_op 

    # add res, b, tmp$13
    lw $t0, -4($fp)	# res
    lw $t1, -12($fp)	# b
    add $t2, $t0, $t1
    sw $t2, -84($fp)	# tmp$13

    # move tmp$13, res
    lw $t0, -84($fp)	# tmp$13
    sw $t0, -4($fp)	# res

    # goto label 14
    j Lbl14

    # label 13
Lbl13:

    # no_op 

    # no_op 

    # no_op 

    # add res, k, tmp$14
    lw $t0, -4($fp)	# res
    lw $t1, -24($fp)	# k
    add $t2, $t0, $t1
    sw $t2, -88($fp)	# tmp$14

    # move tmp$14, res
    lw $t0, -88($fp)	# tmp$14
    sw $t0, -4($fp)	# res

    # label 14
Lbl14:

    # no_op 

    # no_op 

    # move 1, tmp$16
    li $t0, 1
    sw $t0, -96($fp)	# tmp$16

    # add a, tmp$16, tmp$15
    lw $t0, -8($fp)	# a
    lw $t1, -96($fp)	# tmp$16
    add $t2, $t0, $t1
    sw $t2, -92($fp)	# tmp$15

    # move tmp$15, a
    lw $t0, -92($fp)	# tmp$15
    sw $t0, -8($fp)	# a

    # goto label 9
    j Lbl9

    # label 11
Lbl11:

    # goto label 8
    j Lbl8

    # label 7
Lbl7:

    # label 8
Lbl8:

    # no_op 

    # no_op 

    # move 1, tmp$18
    li $t0, 1
    sw $t0, -104($fp)	# tmp$18

    # add j, tmp$18, tmp$17
    lw $t0, -20($fp)	# j
    lw $t1, -104($fp)	# tmp$18
    add $t2, $t0, $t1
    sw $t2, -100($fp)	# tmp$17

    # move tmp$17, j
    lw $t0, -100($fp)	# tmp$17
    sw $t0, -20($fp)	# j

    # goto label 3
    j Lbl3

    # label 5
Lbl5:

    # no_op 

    # no_op 

    # move 1, tmp$20
    li $t0, 1
    sw $t0, -72($fp)	# tmp$20

    # add i, tmp$20, tmp$19
    lw $t0, -16($fp)	# i
    lw $t1, -72($fp)	# tmp$20
    add $t2, $t0, $t1
    sw $t2, -108($fp)	# tmp$19

    # move tmp$19, i
    lw $t0, -108($fp)	# tmp$19
    sw $t0, -16($fp)	# i

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

