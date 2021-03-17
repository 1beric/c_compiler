.text
# function main
# formals: 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -36); tmp$9 (loc: -40); tmp$10 (loc: -44); tmp$11 (loc: -48); tmp$12 (loc: -52); tmp$13 (loc: -56); tmp$14 (loc: -60); tmp$15 (loc: -64); tmp$16 (loc: -68); tmp$17 (loc: -72); tmp$18 (loc: -76); 
# space for locals: 76 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -76($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$0
    li $t0, 0
    sw $t0, -4($fp)	# tmp$0

    # block (0)
    # move 0, a
    li $t0, 0
    sw $t0, _a

    # block (0)
    # no_op 

    # block (0)
    # move 3, tmp$1
    li $t0, 3
    sw $t0, -8($fp)	# tmp$1

    # block (0)
    # move 3, LIM
    li $t0, 3
    sw $t0, _LIM

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$2
    li $t0, 0
    sw $t0, -12($fp)	# tmp$2

    # block (0)
    # move 0, res
    li $t0, 0
    sw $t0, _res

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # no_op 

    # block (1)
    # no_op 

    # block (1)
    # if_ge a, LIM, label 2
    lw $t0, _a
    lw $t1, _LIM
    bge $t0, $t1, Lbl2

    # -LEADER- block (2)
    # label 1
Lbl1:

    # block (2)
    # no_op 

    # block (2)
    # move 0, tmp$3
    li $t0, 0
    sw $t0, -16($fp)	# tmp$3

    # block (2)
    # move 0, b
    li $t0, 0
    sw $t0, _b

    # -LEADER- block (3)
    # label 3
Lbl3:

    # block (3)
    # no_op 

    # block (3)
    # no_op 

    # block (3)
    # if_ge b, LIM, label 5
    lw $t0, _b
    lw $t1, _LIM
    bge $t0, $t1, Lbl5

    # -LEADER- block (4)
    # label 4
Lbl4:

    # block (4)
    # no_op 

    # block (4)
    # move 0, tmp$4
    li $t0, 0
    sw $t0, -20($fp)	# tmp$4

    # block (4)
    # move 0, c
    li $t0, 0
    sw $t0, _c

    # -LEADER- block (5)
    # label 6
Lbl6:

    # block (5)
    # no_op 

    # block (5)
    # no_op 

    # block (5)
    # if_ge c, LIM, label 8
    lw $t0, _c
    lw $t1, _LIM
    bge $t0, $t1, Lbl8

    # -LEADER- block (6)
    # label 7
Lbl7:

    # block (6)
    # no_op 

    # block (6)
    # move 0, tmp$5
    li $t0, 0
    sw $t0, -24($fp)	# tmp$5

    # block (6)
    # move 0, d
    li $t0, 0
    sw $t0, _d

    # -LEADER- block (7)
    # label 9
Lbl9:

    # block (7)
    # no_op 

    # block (7)
    # no_op 

    # block (7)
    # if_ge d, LIM, label 11
    lw $t0, _d
    lw $t1, _LIM
    bge $t0, $t1, Lbl11

    # -LEADER- block (8)
    # label 10
Lbl10:

    # block (8)
    # no_op 

    # block (8)
    # move 0, tmp$6
    li $t0, 0
    sw $t0, -28($fp)	# tmp$6

    # block (8)
    # move 0, e
    li $t0, 0
    sw $t0, _e

    # -LEADER- block (9)
    # label 12
Lbl12:

    # block (9)
    # no_op 

    # block (9)
    # no_op 

    # block (9)
    # if_ge e, LIM, label 14
    lw $t0, _e
    lw $t1, _LIM
    bge $t0, $t1, Lbl14

    # -LEADER- block (10)
    # label 13
Lbl13:

    # block (10)
    # no_op 

    # block (10)
    # no_op 

    # block (10)
    # move 1, tmp$8
    li $t0, 1
    sw $t0, -36($fp)	# tmp$8

    # block (10)
    # add res, 1, tmp$7
    lw $t0, _res
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$7

    # block (10)
    # move tmp$7, res
    lw $t0, -32($fp)	# tmp$7
    sw $t0, _res

    # block (10)
    # no_op 

    # block (10)
    # no_op 

    # block (10)
    # move 1, tmp$10
    li $t0, 1
    sw $t0, -44($fp)	# tmp$10

    # block (10)
    # add e, 1, tmp$9
    lw $t0, _e
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$9

    # block (10)
    # move tmp$9, e
    lw $t0, -40($fp)	# tmp$9
    sw $t0, _e

    # block (10)
    # goto label 12
    j Lbl12

    # -LEADER- block (11)
    # label 14
Lbl14:

    # block (11)
    # no_op 

    # block (11)
    # no_op 

    # block (11)
    # move 1, tmp$12
    li $t0, 1
    sw $t0, -52($fp)	# tmp$12

    # block (11)
    # add d, 1, tmp$11
    lw $t0, _d
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$11

    # block (11)
    # move tmp$11, d
    lw $t0, -48($fp)	# tmp$11
    sw $t0, _d

    # block (11)
    # goto label 9
    j Lbl9

    # -LEADER- block (12)
    # label 11
Lbl11:

    # block (12)
    # no_op 

    # block (12)
    # no_op 

    # block (12)
    # move 1, tmp$14
    li $t0, 1
    sw $t0, -60($fp)	# tmp$14

    # block (12)
    # add c, 1, tmp$13
    lw $t0, _c
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -56($fp)	# tmp$13

    # block (12)
    # move tmp$13, c
    lw $t0, -56($fp)	# tmp$13
    sw $t0, _c

    # block (12)
    # goto label 6
    j Lbl6

    # -LEADER- block (13)
    # label 8
Lbl8:

    # block (13)
    # no_op 

    # block (13)
    # no_op 

    # block (13)
    # move 1, tmp$16
    li $t0, 1
    sw $t0, -68($fp)	# tmp$16

    # block (13)
    # add b, 1, tmp$15
    lw $t0, _b
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$15

    # block (13)
    # move tmp$15, b
    lw $t0, -64($fp)	# tmp$15
    sw $t0, _b

    # block (13)
    # goto label 3
    j Lbl3

    # -LEADER- block (14)
    # label 5
Lbl5:

    # block (14)
    # no_op 

    # block (14)
    # no_op 

    # block (14)
    # move 1, tmp$18
    li $t0, 1
    sw $t0, -76($fp)	# tmp$18

    # block (14)
    # add a, 1, tmp$17
    lw $t0, _a
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -72($fp)	# tmp$17

    # block (14)
    # move tmp$17, a
    lw $t0, -72($fp)	# tmp$17
    sw $t0, _a

    # block (14)
    # goto label 0
    j Lbl0

    # -LEADER- block (15)
    # label 2
Lbl2:

    # block (15)
    # no_op 

    # block (15)
    # param res
    lw $t0, _res
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (15)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (15)
    # no_op 

    # block (15)
    # leave main

    # block (15)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (15)
    # leave main

    # block (15)
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

