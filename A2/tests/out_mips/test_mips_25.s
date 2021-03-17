.text
# function main
# formals: 
# locals: res (loc: -4); i (loc: -8); j (loc: -12); k (loc: -16); tmp$0 (loc: -20); tmp$1 (loc: -24); tmp$2 (loc: -28); tmp$3 (loc: -32); tmp$4 (loc: -36); tmp$5 (loc: -40); tmp$6 (loc: -44); tmp$7 (loc: -48); tmp$8 (loc: -52); tmp$9 (loc: -56); tmp$10 (loc: -60); tmp$11 (loc: -64); tmp$12 (loc: -68); tmp$13 (loc: -72); tmp$14 (loc: -76); tmp$15 (loc: -80); tmp$16 (loc: -84); tmp$17 (loc: -88); 
# space for locals: 88 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -88($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$0
    li $t0, 0
    sw $t0, -20($fp)	# tmp$0

    # block (0)
    # move 0, res
    li $t0, 0
    sw $t0, -4($fp)	# res

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$1
    li $t0, 0
    sw $t0, -24($fp)	# tmp$1

    # block (0)
    # move 0, i
    li $t0, 0
    sw $t0, -8($fp)	# i

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # no_op 

    # block (1)
    # move 5, tmp$2
    li $t0, 5
    sw $t0, -28($fp)	# tmp$2

    # block (1)
    # if_ge i, 5, label 2
    lw $t0, -8($fp)	# i
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
    sw $t0, -40($fp)	# tmp$5

    # block (2)
    # move 0, j
    li $t0, 0
    sw $t0, -12($fp)	# j

    # -LEADER- block (3)
    # label 3
Lbl3:

    # block (3)
    # no_op 

    # block (3)
    # move 10, tmp$6
    li $t0, 10
    sw $t0, -44($fp)	# tmp$6

    # block (3)
    # if_ge j, 10, label 5
    lw $t0, -12($fp)	# j
    li $t1, 10
    bge $t0, $t1, Lbl5

    # -LEADER- block (4)
    # label 4
Lbl4:

    # block (4)
    # no_op 

    # block (4)
    # move 0, tmp$9
    li $t0, 0
    sw $t0, -56($fp)	# tmp$9

    # block (4)
    # move 0, k
    li $t0, 0
    sw $t0, -16($fp)	# k

    # -LEADER- block (5)
    # label 6
Lbl6:

    # block (5)
    # no_op 

    # block (5)
    # move 15, tmp$10
    li $t0, 15
    sw $t0, -60($fp)	# tmp$10

    # block (5)
    # if_ge k, 15, label 8
    lw $t0, -16($fp)	# k
    li $t1, 15
    bge $t0, $t1, Lbl8

    # -LEADER- block (6)
    # label 7
Lbl7:

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # add i, j, tmp$16
    lw $t0, -8($fp)	# i
    lw $t1, -12($fp)	# j
    add $t2, $t0, $t1
    sw $t2, -84($fp)	# tmp$16

    # block (6)
    # no_op 

    # block (6)
    # add tmp$16, k, tmp$15
    lw $t0, -84($fp)	# tmp$16
    lw $t1, -16($fp)	# k
    add $t2, $t0, $t1
    sw $t2, -80($fp)	# tmp$15

    # block (6)
    # move 3, tmp$17
    li $t0, 3
    sw $t0, -88($fp)	# tmp$17

    # block (6)
    # div tmp$15, 3, tmp$14
    lw $t0, -80($fp)	# tmp$15
    li $t1, 3
    div $t2, $t0, $t1
    sw $t2, -76($fp)	# tmp$14

    # block (6)
    # add res, tmp$14, tmp$13
    lw $t0, -4($fp)	# res
    lw $t1, -76($fp)	# tmp$14
    add $t2, $t0, $t1
    sw $t2, -72($fp)	# tmp$13

    # block (6)
    # move tmp$13, res
    lw $t0, -72($fp)	# tmp$13
    sw $t0, -4($fp)	# res

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # move 3, tmp$12
    li $t0, 3
    sw $t0, -68($fp)	# tmp$12

    # block (6)
    # add k, 3, tmp$11
    lw $t0, -16($fp)	# k
    li $t1, 3
    add $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$11

    # block (6)
    # move tmp$11, k
    lw $t0, -64($fp)	# tmp$11
    sw $t0, -16($fp)	# k

    # block (6)
    # goto label 6
    j Lbl6

    # -LEADER- block (7)
    # label 8
Lbl8:

    # block (7)
    # no_op 

    # block (7)
    # no_op 

    # block (7)
    # move 2, tmp$8
    li $t0, 2
    sw $t0, -52($fp)	# tmp$8

    # block (7)
    # add j, 2, tmp$7
    lw $t0, -12($fp)	# j
    li $t1, 2
    add $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$7

    # block (7)
    # move tmp$7, j
    lw $t0, -48($fp)	# tmp$7
    sw $t0, -12($fp)	# j

    # block (7)
    # goto label 3
    j Lbl3

    # -LEADER- block (8)
    # label 5
Lbl5:

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # move 1, tmp$4
    li $t0, 1
    sw $t0, -36($fp)	# tmp$4

    # block (8)
    # add i, 1, tmp$3
    lw $t0, -8($fp)	# i
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$3

    # block (8)
    # move tmp$3, i
    lw $t0, -32($fp)	# tmp$3
    sw $t0, -8($fp)	# i

    # block (8)
    # goto label 0
    j Lbl0

    # -LEADER- block (9)
    # label 2
Lbl2:

    # block (9)
    # no_op 

    # block (9)
    # param res
    lw $t0, -4($fp)	# res
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (9)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (9)
    # no_op 

    # block (9)
    # leave main

    # block (9)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (9)
    # leave main

    # block (9)
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

