.text
# function main
# formals: 
# locals: res (loc: -4); a (loc: -8); b (loc: -12); i (loc: -16); j (loc: -20); k (loc: -24); tmp$0 (loc: -28); tmp$1 (loc: -32); tmp$2 (loc: -36); tmp$3 (loc: -40); tmp$4 (loc: -44); tmp$5 (loc: -48); tmp$6 (loc: -52); tmp$7 (loc: -56); tmp$8 (loc: -60); tmp$9 (loc: -64); tmp$10 (loc: -68); tmp$20 (loc: -72); tmp$11 (loc: -76); tmp$12 (loc: -80); tmp$13 (loc: -84); tmp$14 (loc: -88); tmp$15 (loc: -92); tmp$16 (loc: -96); tmp$17 (loc: -100); tmp$18 (loc: -104); tmp$19 (loc: -108); 
# space for locals: 108 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -108($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 123, tmp$0
    li $t0, 123
    sw $t0, -28($fp)	# tmp$0

    # block (0)
    # move 123, res
    li $t0, 123
    sw $t0, -4($fp)	# res

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$1
    li $t0, 0
    sw $t0, -32($fp)	# tmp$1

    # block (0)
    # move 0, i
    li $t0, 0
    sw $t0, -16($fp)	# i

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # no_op 

    # block (1)
    # move 5, tmp$2
    li $t0, 5
    sw $t0, -36($fp)	# tmp$2

    # block (1)
    # if_ge i, 5, label 2
    lw $t0, -16($fp)	# i
    li $t1, 5
    bge $t0, $t1, Lbl2

    # -LEADER- block (2)
    # label 1
Lbl1:

    # block (2)
    # no_op 

    # block (2)
    # move 0, tmp$5
    li $t0, 0
    sw $t0, -48($fp)	# tmp$5

    # block (2)
    # move 0, j
    li $t0, 0
    sw $t0, -20($fp)	# j

    # -LEADER- block (3)
    # label 3
Lbl3:

    # block (3)
    # no_op 

    # block (3)
    # move 5, tmp$6
    li $t0, 5
    sw $t0, -52($fp)	# tmp$6

    # block (3)
    # if_ge j, 5, label 5
    lw $t0, -20($fp)	# j
    li $t1, 5
    bge $t0, $t1, Lbl5

    # -LEADER- block (4)
    # label 4
Lbl4:

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # add i, j, tmp$10
    lw $t0, -16($fp)	# i
    lw $t1, -20($fp)	# j
    add $t2, $t0, $t1
    sw $t2, -68($fp)	# tmp$10

    # block (4)
    # move 2, tmp$11
    li $t0, 2
    sw $t0, -76($fp)	# tmp$11

    # block (4)
    # div tmp$10, 2, tmp$9
    lw $t0, -68($fp)	# tmp$10
    li $t1, 2
    div $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$9

    # block (4)
    # move tmp$9, k
    lw $t0, -64($fp)	# tmp$9
    sw $t0, -24($fp)	# k

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # if_le tmp$9, i, label 7
    lw $t0, -64($fp)	# tmp$9
    lw $t1, -16($fp)	# i
    ble $t0, $t1, Lbl7

    # -LEADER- block (5)
    # label 6
Lbl6:

    # block (5)
    # no_op 

    # block (5)
    # move 0, tmp$12
    li $t0, 0
    sw $t0, -80($fp)	# tmp$12

    # block (5)
    # move 0, a
    li $t0, 0
    sw $t0, -8($fp)	# a

    # -LEADER- block (6)
    # label 9
Lbl9:

    # block (6)
    # no_op 

    # block (6)
    # move 5, tmp$13
    li $t0, 5
    sw $t0, -84($fp)	# tmp$13

    # block (6)
    # if_ge a, 5, label 11
    lw $t0, -8($fp)	# a
    li $t1, 5
    bge $t0, $t1, Lbl11

    # -LEADER- block (7)
    # label 10
Lbl10:

    # block (7)
    # no_op 

    # block (7)
    # no_op 

    # block (7)
    # no_op 

    # block (7)
    # add a, k, tmp$17
    lw $t0, -8($fp)	# a
    lw $t1, -24($fp)	# k
    add $t2, $t0, $t1
    sw $t2, -100($fp)	# tmp$17

    # block (7)
    # move 2, tmp$18
    li $t0, 2
    sw $t0, -104($fp)	# tmp$18

    # block (7)
    # div tmp$17, 2, tmp$16
    lw $t0, -100($fp)	# tmp$17
    li $t1, 2
    div $t2, $t0, $t1
    sw $t2, -96($fp)	# tmp$16

    # block (7)
    # move tmp$16, b
    lw $t0, -96($fp)	# tmp$16
    sw $t0, -12($fp)	# b

    # block (7)
    # no_op 

    # block (7)
    # no_op 

    # block (7)
    # if_le tmp$16, j, label 13
    lw $t0, -96($fp)	# tmp$16
    lw $t1, -20($fp)	# j
    ble $t0, $t1, Lbl13

    # -LEADER- block (8)
    # label 12
Lbl12:

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # add res, b, tmp$19
    lw $t0, -4($fp)	# res
    lw $t1, -12($fp)	# b
    add $t2, $t0, $t1
    sw $t2, -108($fp)	# tmp$19

    # block (8)
    # move tmp$19, res
    lw $t0, -108($fp)	# tmp$19
    sw $t0, -4($fp)	# res

    # block (8)
    # goto label 14
    j Lbl14

    # -LEADER- block (9)
    # label 13
Lbl13:

    # block (9)
    # no_op 

    # block (9)
    # no_op 

    # block (9)
    # no_op 

    # block (9)
    # add res, k, tmp$20
    lw $t0, -4($fp)	# res
    lw $t1, -24($fp)	# k
    add $t2, $t0, $t1
    sw $t2, -72($fp)	# tmp$20

    # block (9)
    # move tmp$20, res
    lw $t0, -72($fp)	# tmp$20
    sw $t0, -4($fp)	# res

    # -LEADER- block (10)
    # label 14
Lbl14:

    # block (10)
    # no_op 

    # block (10)
    # no_op 

    # block (10)
    # move 1, tmp$15
    li $t0, 1
    sw $t0, -92($fp)	# tmp$15

    # block (10)
    # add a, 1, tmp$14
    lw $t0, -8($fp)	# a
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -88($fp)	# tmp$14

    # block (10)
    # move tmp$14, a
    lw $t0, -88($fp)	# tmp$14
    sw $t0, -8($fp)	# a

    # block (10)
    # goto label 9
    j Lbl9

    # -LEADER- block (11)
    # label 11
Lbl11:

    # block (11)
    # goto label 8
    j Lbl8

    # -LEADER- block (12)
    # label 7
Lbl7:

    # -LEADER- block (13)
    # label 8
Lbl8:

    # block (13)
    # no_op 

    # block (13)
    # no_op 

    # block (13)
    # move 1, tmp$8
    li $t0, 1
    sw $t0, -60($fp)	# tmp$8

    # block (13)
    # add j, 1, tmp$7
    lw $t0, -20($fp)	# j
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -56($fp)	# tmp$7

    # block (13)
    # move tmp$7, j
    lw $t0, -56($fp)	# tmp$7
    sw $t0, -20($fp)	# j

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
    # move 1, tmp$4
    li $t0, 1
    sw $t0, -44($fp)	# tmp$4

    # block (14)
    # add i, 1, tmp$3
    lw $t0, -16($fp)	# i
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$3

    # block (14)
    # move tmp$3, i
    lw $t0, -40($fp)	# tmp$3
    sw $t0, -16($fp)	# i

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
    lw $t0, -4($fp)	# res
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

