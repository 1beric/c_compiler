.text
# function main
# formals: 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -36); tmp$9 (loc: -40); tmp$10 (loc: -44); tmp$11 (loc: -48); tmp$12 (loc: -52); tmp$13 (loc: -56); tmp$14 (loc: -60); tmp$15 (loc: -64); tmp$16 (loc: -68); tmp$17 (loc: -72); tmp$18 (loc: -76); 
# space for locals: 76 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -76($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$0
    li $t0, 0
    sw $t0, -4($fp)	# tmp$0

    # move tmp$0, a
    lw $t0, -4($fp)	# tmp$0
    sw $t0, _a

    # no_op 

    # move 3, tmp$1
    li $t0, 3
    sw $t0, -8($fp)	# tmp$1

    # move tmp$1, LIM
    lw $t0, -8($fp)	# tmp$1
    sw $t0, _LIM

    # no_op 

    # move 0, tmp$2
    li $t0, 0
    sw $t0, -12($fp)	# tmp$2

    # move tmp$2, res
    lw $t0, -12($fp)	# tmp$2
    sw $t0, _res

    # label 0
Lbl0:

    # no_op 

    # no_op 

    # if_lt a, LIM, label 1
    lw $t0, _a
    lw $t1, _LIM
    blt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move 0, tmp$3
    li $t0, 0
    sw $t0, -16($fp)	# tmp$3

    # move tmp$3, b
    lw $t0, -16($fp)	# tmp$3
    sw $t0, _b

    # label 3
Lbl3:

    # no_op 

    # no_op 

    # if_lt b, LIM, label 4
    lw $t0, _b
    lw $t1, _LIM
    blt $t0, $t1, Lbl4

    # goto label 5
    j Lbl5

    # label 4
Lbl4:

    # no_op 

    # move 0, tmp$4
    li $t0, 0
    sw $t0, -20($fp)	# tmp$4

    # move tmp$4, c
    lw $t0, -20($fp)	# tmp$4
    sw $t0, _c

    # label 6
Lbl6:

    # no_op 

    # no_op 

    # if_lt c, LIM, label 7
    lw $t0, _c
    lw $t1, _LIM
    blt $t0, $t1, Lbl7

    # goto label 8
    j Lbl8

    # label 7
Lbl7:

    # no_op 

    # move 0, tmp$5
    li $t0, 0
    sw $t0, -24($fp)	# tmp$5

    # move tmp$5, d
    lw $t0, -24($fp)	# tmp$5
    sw $t0, _d

    # label 9
Lbl9:

    # no_op 

    # no_op 

    # if_lt d, LIM, label 10
    lw $t0, _d
    lw $t1, _LIM
    blt $t0, $t1, Lbl10

    # goto label 11
    j Lbl11

    # label 10
Lbl10:

    # no_op 

    # move 0, tmp$6
    li $t0, 0
    sw $t0, -28($fp)	# tmp$6

    # move tmp$6, e
    lw $t0, -28($fp)	# tmp$6
    sw $t0, _e

    # label 12
Lbl12:

    # no_op 

    # no_op 

    # if_lt e, LIM, label 13
    lw $t0, _e
    lw $t1, _LIM
    blt $t0, $t1, Lbl13

    # goto label 14
    j Lbl14

    # label 13
Lbl13:

    # no_op 

    # no_op 

    # move 1, tmp$8
    li $t0, 1
    sw $t0, -36($fp)	# tmp$8

    # add res, tmp$8, tmp$7
    lw $t0, _res
    lw $t1, -36($fp)	# tmp$8
    add $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$7

    # move tmp$7, res
    lw $t0, -32($fp)	# tmp$7
    sw $t0, _res

    # no_op 

    # no_op 

    # move 1, tmp$10
    li $t0, 1
    sw $t0, -44($fp)	# tmp$10

    # add e, tmp$10, tmp$9
    lw $t0, _e
    lw $t1, -44($fp)	# tmp$10
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$9

    # move tmp$9, e
    lw $t0, -40($fp)	# tmp$9
    sw $t0, _e

    # goto label 12
    j Lbl12

    # label 14
Lbl14:

    # no_op 

    # no_op 

    # move 1, tmp$12
    li $t0, 1
    sw $t0, -52($fp)	# tmp$12

    # add d, tmp$12, tmp$11
    lw $t0, _d
    lw $t1, -52($fp)	# tmp$12
    add $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$11

    # move tmp$11, d
    lw $t0, -48($fp)	# tmp$11
    sw $t0, _d

    # goto label 9
    j Lbl9

    # label 11
Lbl11:

    # no_op 

    # no_op 

    # move 1, tmp$14
    li $t0, 1
    sw $t0, -60($fp)	# tmp$14

    # add c, tmp$14, tmp$13
    lw $t0, _c
    lw $t1, -60($fp)	# tmp$14
    add $t2, $t0, $t1
    sw $t2, -56($fp)	# tmp$13

    # move tmp$13, c
    lw $t0, -56($fp)	# tmp$13
    sw $t0, _c

    # goto label 6
    j Lbl6

    # label 8
Lbl8:

    # no_op 

    # no_op 

    # move 1, tmp$16
    li $t0, 1
    sw $t0, -68($fp)	# tmp$16

    # add b, tmp$16, tmp$15
    lw $t0, _b
    lw $t1, -68($fp)	# tmp$16
    add $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$15

    # move tmp$15, b
    lw $t0, -64($fp)	# tmp$15
    sw $t0, _b

    # goto label 3
    j Lbl3

    # label 5
Lbl5:

    # no_op 

    # no_op 

    # move 1, tmp$18
    li $t0, 1
    sw $t0, -76($fp)	# tmp$18

    # add a, tmp$18, tmp$17
    lw $t0, _a
    lw $t1, -76($fp)	# tmp$18
    add $t2, $t0, $t1
    sw $t2, -72($fp)	# tmp$17

    # move tmp$17, a
    lw $t0, -72($fp)	# tmp$17
    sw $t0, _a

    # goto label 0
    j Lbl0

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
_LIM:  .space 4

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

