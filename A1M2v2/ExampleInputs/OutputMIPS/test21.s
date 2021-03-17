.text
# function main
# formals: 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -36); tmp$9 (loc: -40); tmp$10 (loc: -44); tmp$11 (loc: -48); tmp$12 (loc: -52); tmp$13 (loc: -56); 
# space for locals: 56 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -56($sp)   # allocate stack frame

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

    # no_op 

    # if_lt a, b, label 0
    lw $t0, _a
    lw $t1, _b
    blt $t0, $t1, Lbl0

    # goto label 1
    j Lbl1

    # label 0
Lbl0:

    # no_op 

    # no_op 

    # if_ge b, c, label 3
    lw $t0, _b
    lw $t1, _c
    bge $t0, $t1, Lbl3

    # goto label 4
    j Lbl4

    # label 3
Lbl3:

    # no_op 

    # no_op 

    # if_lt c, d, label 6
    lw $t0, _c
    lw $t1, _d
    blt $t0, $t1, Lbl6

    # goto label 7
    j Lbl7

    # label 6
Lbl6:

    # no_op 

    # no_op 

    # if_eq d, e, label 10
    lw $t0, _d
    lw $t1, _e
    beq $t0, $t1, Lbl10

    # goto label 9
    j Lbl9

    # label 9
Lbl9:

    # no_op 

    # no_op 

    # if_lt e, f, label 12
    lw $t0, _e
    lw $t1, _f
    blt $t0, $t1, Lbl12

    # goto label 13
    j Lbl13

    # label 12
Lbl12:

    # no_op 

    # no_op 

    # if_lt g, f, label 15
    lw $t0, _g
    lw $t1, _f
    blt $t0, $t1, Lbl15

    # goto label 16
    j Lbl16

    # label 15
Lbl15:

    # no_op 

    # no_op 

    # if_lt g, a, label 18
    lw $t0, _g
    lw $t1, _a
    blt $t0, $t1, Lbl18

    # goto label 19
    j Lbl19

    # label 18
Lbl18:

    # no_op 

    # move 1111, tmp$6
    li $t0, 1111
    sw $t0, -28($fp)	# tmp$6

    # move tmp$6, res
    lw $t0, -28($fp)	# tmp$6
    sw $t0, _res

    # goto label 20
    j Lbl20

    # label 19
Lbl19:

    # no_op 

    # move 2222, tmp$7
    li $t0, 2222
    sw $t0, -32($fp)	# tmp$7

    # move tmp$7, res
    lw $t0, -32($fp)	# tmp$7
    sw $t0, _res

    # label 20
Lbl20:

    # goto label 17
    j Lbl17

    # label 16
Lbl16:

    # no_op 

    # move 3333, tmp$8
    li $t0, 3333
    sw $t0, -36($fp)	# tmp$8

    # move tmp$8, res
    lw $t0, -36($fp)	# tmp$8
    sw $t0, _res

    # label 17
Lbl17:

    # goto label 14
    j Lbl14

    # label 13
Lbl13:

    # no_op 

    # move 4444, tmp$9
    li $t0, 4444
    sw $t0, -40($fp)	# tmp$9

    # move tmp$9, res
    lw $t0, -40($fp)	# tmp$9
    sw $t0, _res

    # label 14
Lbl14:

    # goto label 11
    j Lbl11

    # label 10
Lbl10:

    # no_op 

    # move 5555, tmp$10
    li $t0, 5555
    sw $t0, -44($fp)	# tmp$10

    # move tmp$10, res
    lw $t0, -44($fp)	# tmp$10
    sw $t0, _res

    # label 11
Lbl11:

    # goto label 8
    j Lbl8

    # label 7
Lbl7:

    # no_op 

    # move 6666, tmp$11
    li $t0, 6666
    sw $t0, -48($fp)	# tmp$11

    # move tmp$11, res
    lw $t0, -48($fp)	# tmp$11
    sw $t0, _res

    # label 8
Lbl8:

    # goto label 5
    j Lbl5

    # label 4
Lbl4:

    # no_op 

    # move 7777, tmp$12
    li $t0, 7777
    sw $t0, -52($fp)	# tmp$12

    # move tmp$12, res
    lw $t0, -52($fp)	# tmp$12
    sw $t0, _res

    # label 5
Lbl5:

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move 8888, tmp$13
    li $t0, 8888
    sw $t0, -56($fp)	# tmp$13

    # move tmp$13, res
    lw $t0, -56($fp)	# tmp$13
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

