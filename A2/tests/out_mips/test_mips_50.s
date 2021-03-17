.text
# function side_effect
# formals: x (loc: 8); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); 
# space for locals: 8 bytes
#
_side_effect:
    # -LEADER- block (0)
    # enter side_effect
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -8($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 1, tmp$1
    li $t0, 1
    sw $t0, -8($fp)	# tmp$1

    # block (0)
    # uminus 1, tmp$0
    li $t0, 1
    neg $t2, $t0
    sw $t2, -4($fp)	# tmp$0

    # block (0)
    # move tmp$0, flag
    lw $t0, -4($fp)	# tmp$0
    sw $t0, _flag

    # block (0)
    # no_op 

    # block (0)
    # leave side_effect

    # block (0)
    # ret x
    lw $v0, 8($fp)	# x
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (0)
    # leave side_effect

    # block (0)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function side_effect

.text
# function main
# formals: 
# locals: x (loc: -4); y (loc: -8); z (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); tmp$7 (loc: -36); tmp$8 (loc: -40); tmp$9 (loc: -44); tmp$10 (loc: -48); tmp$11 (loc: -52); tmp$12 (loc: -56); tmp$13 (loc: -60); tmp$14 (loc: -64); tmp$15 (loc: -68); tmp$16 (loc: -72); tmp$17 (loc: -76); 
# space for locals: 76 bytes
#
_main:
    # -LEADER- block (1)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -76($sp)   # allocate stack frame

    # block (1)
    # no_op 

    # block (1)
    # move 3, tmp$2
    li $t0, 3
    sw $t0, -16($fp)	# tmp$2

    # block (1)
    # move 3, x
    li $t0, 3
    sw $t0, -4($fp)	# x

    # block (1)
    # no_op 

    # block (1)
    # move 4, tmp$3
    li $t0, 4
    sw $t0, -20($fp)	# tmp$3

    # block (1)
    # move 4, y
    li $t0, 4
    sw $t0, -8($fp)	# y

    # block (1)
    # no_op 

    # block (1)
    # move 5, tmp$4
    li $t0, 5
    sw $t0, -24($fp)	# tmp$4

    # block (1)
    # move 5, z
    li $t0, 5
    sw $t0, -12($fp)	# z

    # block (1)
    # no_op 

    # block (1)
    # move 1, tmp$5
    li $t0, 1
    sw $t0, -28($fp)	# tmp$5

    # block (1)
    # move 1, flag
    li $t0, 1
    sw $t0, _flag

    # block (1)
    # no_op 

    # block (1)
    # move 1234, tmp$6
    li $t0, 1234
    sw $t0, -32($fp)	# tmp$6

    # block (1)
    # move 1234, val
    li $t0, 1234
    sw $t0, _val

    # block (1)
    # no_op 

    # block (1)
    # no_op 

    # block (1)
    # if_ge 3, 4, label 1
    li $t0, 3
    li $t1, 4
    bge $t0, $t1, Lbl1

    # -LEADER- block (2)
    # label 4
Lbl4:

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # if_le y, z, label 1
    lw $t0, -8($fp)	# y
    lw $t1, -12($fp)	# z
    ble $t0, $t1, Lbl1

    # -LEADER- block (3)
    # label 3
Lbl3:

    # block (3)
    # no_op 

    # block (3)
    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # call side_effect, 1
    jal _side_effect
    la $sp, 4($sp)

    # block (3)
    # retrieve tmp$7
    sw $v0, -36($fp)	# tmp$7

    # block (3)
    # no_op 

    # block (3)
    # if_ge tmp$7, z, label 1
    lw $t0, -36($fp)	# tmp$7
    lw $t1, -12($fp)	# z
    bge $t0, $t1, Lbl1

    # -LEADER- block (4)
    # label 0
Lbl0:

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # move 1, tmp$9
    li $t0, 1
    sw $t0, -44($fp)	# tmp$9

    # block (4)
    # sub x, 1, tmp$8
    lw $t0, -4($fp)	# x
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$8

    # block (4)
    # move tmp$8, x
    lw $t0, -40($fp)	# tmp$8
    sw $t0, -4($fp)	# x

    # block (4)
    # goto label 2
    j Lbl2

    # -LEADER- block (5)
    # label 1
Lbl1:

    # -LEADER- block (6)
    # label 2
Lbl2:

    # block (6)
    # no_op 

    # block (6)
    # move 0, tmp$10
    li $t0, 0
    sw $t0, -48($fp)	# tmp$10

    # block (6)
    # if_ge flag, 0, label 6
    lw $t0, _flag
    li $t1, 0
    bge $t0, $t1, Lbl6

    # -LEADER- block (7)
    # label 5
Lbl5:

    # block (7)
    # no_op 

    # block (7)
    # move 4321, tmp$11
    li $t0, 4321
    sw $t0, -52($fp)	# tmp$11

    # block (7)
    # move 4321, val
    li $t0, 4321
    sw $t0, _val

    # block (7)
    # goto label 7
    j Lbl7

    # -LEADER- block (8)
    # label 6
Lbl6:

    # -LEADER- block (9)
    # label 7
Lbl7:

    # block (9)
    # no_op 

    # block (9)
    # no_op 

    # block (9)
    # if_lt x, y, label 8
    lw $t0, -4($fp)	# x
    lw $t1, -8($fp)	# y
    blt $t0, $t1, Lbl8

    # -LEADER- block (10)
    # goto label 12
    j Lbl12

    # -LEADER- block (11)
    # label 12
Lbl12:

    # block (11)
    # no_op 

    # block (11)
    # no_op 

    # block (11)
    # if_gt y, z, label 8
    lw $t0, -8($fp)	# y
    lw $t1, -12($fp)	# z
    bgt $t0, $t1, Lbl8

    # -LEADER- block (12)
    # goto label 11
    j Lbl11

    # -LEADER- block (13)
    # label 11
Lbl11:

    # block (13)
    # no_op 

    # block (13)
    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (13)
    # call side_effect, 1
    jal _side_effect
    la $sp, 4($sp)

    # block (13)
    # retrieve tmp$12
    sw $v0, -56($fp)	# tmp$12

    # block (13)
    # no_op 

    # block (13)
    # if_ge tmp$12, z, label 9
    lw $t0, -56($fp)	# tmp$12
    lw $t1, -12($fp)	# z
    bge $t0, $t1, Lbl9

    # -LEADER- block (14)
    # label 8
Lbl8:

    # block (14)
    # no_op 

    # block (14)
    # no_op 

    # block (14)
    # move 1, tmp$14
    li $t0, 1
    sw $t0, -64($fp)	# tmp$14

    # block (14)
    # sub x, 1, tmp$13
    lw $t0, -4($fp)	# x
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -60($fp)	# tmp$13

    # block (14)
    # move tmp$13, x
    lw $t0, -60($fp)	# tmp$13
    sw $t0, -4($fp)	# x

    # block (14)
    # goto label 10
    j Lbl10

    # -LEADER- block (15)
    # label 9
Lbl9:

    # -LEADER- block (16)
    # label 10
Lbl10:

    # block (16)
    # no_op 

    # block (16)
    # move 0, tmp$15
    li $t0, 0
    sw $t0, -68($fp)	# tmp$15

    # block (16)
    # if_ge flag, 0, label 14
    lw $t0, _flag
    li $t1, 0
    bge $t0, $t1, Lbl14

    # -LEADER- block (17)
    # label 13
Lbl13:

    # block (17)
    # no_op 

    # block (17)
    # move 4321, tmp$16
    li $t0, 4321
    sw $t0, -72($fp)	# tmp$16

    # block (17)
    # move 4321, val
    li $t0, 4321
    sw $t0, _val

    # block (17)
    # goto label 15
    j Lbl15

    # -LEADER- block (18)
    # label 14
Lbl14:

    # -LEADER- block (19)
    # label 15
Lbl15:

    # block (19)
    # no_op 

    # block (19)
    # no_op 

    # block (19)
    # no_op 

    # block (19)
    # mul x, val, tmp$17
    lw $t0, -4($fp)	# x
    lw $t1, _val
    mul $t2, $t0, $t1
    sw $t2, -76($fp)	# tmp$17

    # block (19)
    # move tmp$17, val
    lw $t0, -76($fp)	# tmp$17
    sw $t0, _val

    # block (19)
    # no_op 

    # block (19)
    # param tmp$17
    lw $t0, -76($fp)	# tmp$17
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (19)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (19)
    # no_op 

    # block (19)
    # leave main

    # block (19)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (19)
    # leave main

    # block (19)
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
_val:  .space 4
.align 2
_flag:  .space 4

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

