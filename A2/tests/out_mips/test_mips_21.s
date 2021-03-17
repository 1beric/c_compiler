.text
# function main
# formals: 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -36); tmp$9 (loc: -40); tmp$10 (loc: -44); tmp$11 (loc: -48); tmp$12 (loc: -52); tmp$13 (loc: -56); 
# space for locals: 56 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -56($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 1, tmp$0
    li $t0, 1
    sw $t0, -4($fp)	# tmp$0

    # block (0)
    # move 1, a
    li $t0, 1
    sw $t0, _a

    # block (0)
    # no_op 

    # block (0)
    # move 2, tmp$1
    li $t0, 2
    sw $t0, -8($fp)	# tmp$1

    # block (0)
    # move 2, b
    li $t0, 2
    sw $t0, _b

    # block (0)
    # no_op 

    # block (0)
    # move 3, tmp$2
    li $t0, 3
    sw $t0, -12($fp)	# tmp$2

    # block (0)
    # move 3, c
    li $t0, 3
    sw $t0, _c

    # block (0)
    # no_op 

    # block (0)
    # move 4, tmp$3
    li $t0, 4
    sw $t0, -16($fp)	# tmp$3

    # block (0)
    # move 4, d
    li $t0, 4
    sw $t0, _d

    # block (0)
    # no_op 

    # block (0)
    # move 5, tmp$4
    li $t0, 5
    sw $t0, -20($fp)	# tmp$4

    # block (0)
    # move 5, e
    li $t0, 5
    sw $t0, _e

    # block (0)
    # no_op 

    # block (0)
    # move 6, tmp$5
    li $t0, 6
    sw $t0, -24($fp)	# tmp$5

    # block (0)
    # move 6, f
    li $t0, 6
    sw $t0, _f

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # if_ge 1, 2, label 1
    li $t0, 1
    li $t1, 2
    bge $t0, $t1, Lbl1

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # no_op 

    # block (1)
    # no_op 

    # block (1)
    # if_lt b, c, label 4
    lw $t0, _b
    lw $t1, _c
    blt $t0, $t1, Lbl4

    # -LEADER- block (2)
    # label 3
Lbl3:

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # if_ge c, d, label 7
    lw $t0, _c
    lw $t1, _d
    bge $t0, $t1, Lbl7

    # -LEADER- block (3)
    # label 6
Lbl6:

    # block (3)
    # no_op 

    # block (3)
    # no_op 

    # block (3)
    # if_eq d, e, label 10
    lw $t0, _d
    lw $t1, _e
    beq $t0, $t1, Lbl10

    # -LEADER- block (4)
    # goto label 9
    j Lbl9

    # -LEADER- block (5)
    # label 9
Lbl9:

    # block (5)
    # no_op 

    # block (5)
    # no_op 

    # block (5)
    # if_ge e, f, label 13
    lw $t0, _e
    lw $t1, _f
    bge $t0, $t1, Lbl13

    # -LEADER- block (6)
    # label 12
Lbl12:

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # if_ge g, f, label 16
    lw $t0, _g
    lw $t1, _f
    bge $t0, $t1, Lbl16

    # -LEADER- block (7)
    # label 15
Lbl15:

    # block (7)
    # no_op 

    # block (7)
    # no_op 

    # block (7)
    # if_ge g, a, label 19
    lw $t0, _g
    lw $t1, _a
    bge $t0, $t1, Lbl19

    # -LEADER- block (8)
    # label 18
Lbl18:

    # block (8)
    # no_op 

    # block (8)
    # move 1111, tmp$6
    li $t0, 1111
    sw $t0, -28($fp)	# tmp$6

    # block (8)
    # move 1111, res
    li $t0, 1111
    sw $t0, _res

    # block (8)
    # goto label 20
    j Lbl20

    # -LEADER- block (9)
    # label 19
Lbl19:

    # block (9)
    # no_op 

    # block (9)
    # move 2222, tmp$7
    li $t0, 2222
    sw $t0, -32($fp)	# tmp$7

    # block (9)
    # move 2222, res
    li $t0, 2222
    sw $t0, _res

    # -LEADER- block (10)
    # label 20
Lbl20:

    # block (10)
    # goto label 17
    j Lbl17

    # -LEADER- block (11)
    # label 16
Lbl16:

    # block (11)
    # no_op 

    # block (11)
    # move 3333, tmp$8
    li $t0, 3333
    sw $t0, -36($fp)	# tmp$8

    # block (11)
    # move 3333, res
    li $t0, 3333
    sw $t0, _res

    # -LEADER- block (12)
    # label 17
Lbl17:

    # block (12)
    # goto label 14
    j Lbl14

    # -LEADER- block (13)
    # label 13
Lbl13:

    # block (13)
    # no_op 

    # block (13)
    # move 4444, tmp$9
    li $t0, 4444
    sw $t0, -40($fp)	# tmp$9

    # block (13)
    # move 4444, res
    li $t0, 4444
    sw $t0, _res

    # -LEADER- block (14)
    # label 14
Lbl14:

    # block (14)
    # goto label 11
    j Lbl11

    # -LEADER- block (15)
    # label 10
Lbl10:

    # block (15)
    # no_op 

    # block (15)
    # move 5555, tmp$10
    li $t0, 5555
    sw $t0, -44($fp)	# tmp$10

    # block (15)
    # move 5555, res
    li $t0, 5555
    sw $t0, _res

    # -LEADER- block (16)
    # label 11
Lbl11:

    # block (16)
    # goto label 8
    j Lbl8

    # -LEADER- block (17)
    # label 7
Lbl7:

    # block (17)
    # no_op 

    # block (17)
    # move 6666, tmp$11
    li $t0, 6666
    sw $t0, -48($fp)	# tmp$11

    # block (17)
    # move 6666, res
    li $t0, 6666
    sw $t0, _res

    # -LEADER- block (18)
    # label 8
Lbl8:

    # block (18)
    # goto label 5
    j Lbl5

    # -LEADER- block (19)
    # label 4
Lbl4:

    # block (19)
    # no_op 

    # block (19)
    # move 7777, tmp$12
    li $t0, 7777
    sw $t0, -52($fp)	# tmp$12

    # block (19)
    # move 7777, res
    li $t0, 7777
    sw $t0, _res

    # -LEADER- block (20)
    # label 5
Lbl5:

    # block (20)
    # goto label 2
    j Lbl2

    # -LEADER- block (21)
    # label 1
Lbl1:

    # block (21)
    # no_op 

    # block (21)
    # move 8888, tmp$13
    li $t0, 8888
    sw $t0, -56($fp)	# tmp$13

    # block (21)
    # move 8888, res
    li $t0, 8888
    sw $t0, _res

    # -LEADER- block (22)
    # label 2
Lbl2:

    # block (22)
    # no_op 

    # block (22)
    # param res
    lw $t0, _res
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (22)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (22)
    # no_op 

    # block (22)
    # leave main

    # block (22)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (22)
    # leave main

    # block (22)
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

