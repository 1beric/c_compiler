.text
# function side_effect
# formals: x (loc: 8); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); 
# space for locals: 8 bytes
#
_side_effect:
    # enter side_effect
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -8($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$1
    li $t0, 1
    sw $t0, -8($fp)	# tmp$1

    # uminus tmp$1, tmp$0
    lw $t0, -8($fp)	# tmp$1
    neg $t2, $t0
    sw $t2, -4($fp)	# tmp$0

    # move tmp$0, flag
    lw $t0, -4($fp)	# tmp$0
    sw $t0, _flag

    # no_op 

    # leave side_effect

    # ret x
    lw $v0, 8($fp)	# x
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave side_effect

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
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -76($sp)   # allocate stack frame

    # no_op 

    # move 3, tmp$2
    li $t0, 3
    sw $t0, -16($fp)	# tmp$2

    # move tmp$2, x
    lw $t0, -16($fp)	# tmp$2
    sw $t0, -4($fp)	# x

    # no_op 

    # move 4, tmp$3
    li $t0, 4
    sw $t0, -20($fp)	# tmp$3

    # move tmp$3, y
    lw $t0, -20($fp)	# tmp$3
    sw $t0, -8($fp)	# y

    # no_op 

    # move 5, tmp$4
    li $t0, 5
    sw $t0, -24($fp)	# tmp$4

    # move tmp$4, z
    lw $t0, -24($fp)	# tmp$4
    sw $t0, -12($fp)	# z

    # no_op 

    # move 1, tmp$5
    li $t0, 1
    sw $t0, -28($fp)	# tmp$5

    # move tmp$5, flag
    lw $t0, -28($fp)	# tmp$5
    sw $t0, _flag

    # no_op 

    # move 1234, tmp$6
    li $t0, 1234
    sw $t0, -32($fp)	# tmp$6

    # move tmp$6, val
    lw $t0, -32($fp)	# tmp$6
    sw $t0, _val

    # no_op 

    # no_op 

    # if_lt x, y, label 4
    lw $t0, -4($fp)	# x
    lw $t1, -8($fp)	# y
    blt $t0, $t1, Lbl4

    # goto label 1
    j Lbl1

    # label 4
Lbl4:

    # no_op 

    # no_op 

    # if_gt y, z, label 3
    lw $t0, -8($fp)	# y
    lw $t1, -12($fp)	# z
    bgt $t0, $t1, Lbl3

    # goto label 1
    j Lbl1

    # label 3
Lbl3:

    # no_op 

    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call side_effect, 1
    jal _side_effect
    la $sp, 4($sp)

    # retrieve tmp$7
    sw $v0, -36($fp)	# tmp$7

    # no_op 

    # if_lt tmp$7, z, label 0
    lw $t0, -36($fp)	# tmp$7
    lw $t1, -12($fp)	# z
    blt $t0, $t1, Lbl0

    # goto label 1
    j Lbl1

    # label 0
Lbl0:

    # no_op 

    # no_op 

    # move 1, tmp$9
    li $t0, 1
    sw $t0, -44($fp)	# tmp$9

    # sub x, tmp$9, tmp$8
    lw $t0, -4($fp)	# x
    lw $t1, -44($fp)	# tmp$9
    sub $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$8

    # move tmp$8, x
    lw $t0, -40($fp)	# tmp$8
    sw $t0, -4($fp)	# x

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # label 2
Lbl2:

    # no_op 

    # move 0, tmp$10
    li $t0, 0
    sw $t0, -48($fp)	# tmp$10

    # if_lt flag, tmp$10, label 5
    lw $t0, _flag
    lw $t1, -48($fp)	# tmp$10
    blt $t0, $t1, Lbl5

    # goto label 6
    j Lbl6

    # label 5
Lbl5:

    # no_op 

    # move 4321, tmp$11
    li $t0, 4321
    sw $t0, -52($fp)	# tmp$11

    # move tmp$11, val
    lw $t0, -52($fp)	# tmp$11
    sw $t0, _val

    # goto label 7
    j Lbl7

    # label 6
Lbl6:

    # label 7
Lbl7:

    # no_op 

    # no_op 

    # if_lt x, y, label 8
    lw $t0, -4($fp)	# x
    lw $t1, -8($fp)	# y
    blt $t0, $t1, Lbl8

    # goto label 12
    j Lbl12

    # label 12
Lbl12:

    # no_op 

    # no_op 

    # if_gt y, z, label 8
    lw $t0, -8($fp)	# y
    lw $t1, -12($fp)	# z
    bgt $t0, $t1, Lbl8

    # goto label 11
    j Lbl11

    # label 11
Lbl11:

    # no_op 

    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call side_effect, 1
    jal _side_effect
    la $sp, 4($sp)

    # retrieve tmp$12
    sw $v0, -56($fp)	# tmp$12

    # no_op 

    # if_lt tmp$12, z, label 8
    lw $t0, -56($fp)	# tmp$12
    lw $t1, -12($fp)	# z
    blt $t0, $t1, Lbl8

    # goto label 9
    j Lbl9

    # label 8
Lbl8:

    # no_op 

    # no_op 

    # move 1, tmp$14
    li $t0, 1
    sw $t0, -64($fp)	# tmp$14

    # sub x, tmp$14, tmp$13
    lw $t0, -4($fp)	# x
    lw $t1, -64($fp)	# tmp$14
    sub $t2, $t0, $t1
    sw $t2, -60($fp)	# tmp$13

    # move tmp$13, x
    lw $t0, -60($fp)	# tmp$13
    sw $t0, -4($fp)	# x

    # goto label 10
    j Lbl10

    # label 9
Lbl9:

    # label 10
Lbl10:

    # no_op 

    # move 0, tmp$15
    li $t0, 0
    sw $t0, -68($fp)	# tmp$15

    # if_lt flag, tmp$15, label 13
    lw $t0, _flag
    lw $t1, -68($fp)	# tmp$15
    blt $t0, $t1, Lbl13

    # goto label 14
    j Lbl14

    # label 13
Lbl13:

    # no_op 

    # move 4321, tmp$16
    li $t0, 4321
    sw $t0, -72($fp)	# tmp$16

    # move tmp$16, val
    lw $t0, -72($fp)	# tmp$16
    sw $t0, _val

    # goto label 15
    j Lbl15

    # label 14
Lbl14:

    # label 15
Lbl15:

    # no_op 

    # no_op 

    # no_op 

    # mul x, val, tmp$17
    lw $t0, -4($fp)	# x
    lw $t1, _val
    mul $t2, $t0, $t1
    sw $t2, -76($fp)	# tmp$17

    # move tmp$17, val
    lw $t0, -76($fp)	# tmp$17
    sw $t0, _val

    # no_op 

    # param val
    lw $t0, _val
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

