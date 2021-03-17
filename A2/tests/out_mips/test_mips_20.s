.text
# function main
# formals: 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -36); tmp$9 (loc: -40); tmp$10 (loc: -44); tmp$11 (loc: -48); 
# space for locals: 48 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -48($sp)   # allocate stack frame

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
    # move 7, tmp$6
    li $t0, 7
    sw $t0, -28($fp)	# tmp$6

    # block (0)
    # move 7, g
    li $t0, 7
    sw $t0, _g

    # block (0)
    # no_op 

    # block (0)
    # move 8, tmp$7
    li $t0, 8
    sw $t0, -32($fp)	# tmp$7

    # block (0)
    # move 8, h
    li $t0, 8
    sw $t0, _h

    # block (0)
    # no_op 

    # block (0)
    # move 9, tmp$8
    li $t0, 9
    sw $t0, -36($fp)	# tmp$8

    # block (0)
    # move 9, i
    li $t0, 9
    sw $t0, _i

    # block (0)
    # no_op 

    # block (0)
    # move 10, tmp$9
    li $t0, 10
    sw $t0, -40($fp)	# tmp$9

    # block (0)
    # move 10, j
    li $t0, 10
    sw $t0, _j

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # if_gt 1, 2, label 1
    li $t0, 1
    li $t1, 2
    bgt $t0, $t1, Lbl1

    # -LEADER- block (1)
    # label 6
Lbl6:

    # block (1)
    # no_op 

    # block (1)
    # no_op 

    # block (1)
    # if_gt b, c, label 1
    lw $t0, _b
    lw $t1, _c
    bgt $t0, $t1, Lbl1

    # -LEADER- block (2)
    # label 5
Lbl5:

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # if_gt c, d, label 1
    lw $t0, _c
    lw $t1, _d
    bgt $t0, $t1, Lbl1

    # -LEADER- block (3)
    # label 4
Lbl4:

    # block (3)
    # no_op 

    # block (3)
    # no_op 

    # block (3)
    # if_gt d, e, label 1
    lw $t0, _d
    lw $t1, _e
    bgt $t0, $t1, Lbl1

    # -LEADER- block (4)
    # label 3
Lbl3:

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # if_gt e, f, label 1
    lw $t0, _e
    lw $t1, _f
    bgt $t0, $t1, Lbl1

    # -LEADER- block (5)
    # goto label 10
    j Lbl10

    # -LEADER- block (6)
    # label 10
Lbl10:

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # if_gt f, g, label 1
    lw $t0, _f
    lw $t1, _g
    bgt $t0, $t1, Lbl1

    # -LEADER- block (7)
    # goto label 9
    j Lbl9

    # -LEADER- block (8)
    # label 9
Lbl9:

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # if_gt g, h, label 1
    lw $t0, _g
    lw $t1, _h
    bgt $t0, $t1, Lbl1

    # -LEADER- block (9)
    # goto label 8
    j Lbl8

    # -LEADER- block (10)
    # label 8
Lbl8:

    # block (10)
    # no_op 

    # block (10)
    # no_op 

    # block (10)
    # if_gt h, i, label 1
    lw $t0, _h
    lw $t1, _i
    bgt $t0, $t1, Lbl1

    # -LEADER- block (11)
    # goto label 7
    j Lbl7

    # -LEADER- block (12)
    # label 7
Lbl7:

    # block (12)
    # no_op 

    # block (12)
    # no_op 

    # block (12)
    # if_gt i, j, label 1
    lw $t0, _i
    lw $t1, _j
    bgt $t0, $t1, Lbl1

    # -LEADER- block (13)
    # goto label 0
    j Lbl0

    # -LEADER- block (14)
    # label 0
Lbl0:

    # block (14)
    # no_op 

    # block (14)
    # move 1111, tmp$10
    li $t0, 1111
    sw $t0, -44($fp)	# tmp$10

    # block (14)
    # move 1111, res
    li $t0, 1111
    sw $t0, _res

    # block (14)
    # goto label 2
    j Lbl2

    # -LEADER- block (15)
    # label 1
Lbl1:

    # block (15)
    # no_op 

    # block (15)
    # move 2222, tmp$11
    li $t0, 2222
    sw $t0, -48($fp)	# tmp$11

    # block (15)
    # move 2222, res
    li $t0, 2222
    sw $t0, _res

    # -LEADER- block (16)
    # label 2
Lbl2:

    # block (16)
    # no_op 

    # block (16)
    # param res
    lw $t0, _res
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (16)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (16)
    # no_op 

    # block (16)
    # leave main

    # block (16)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (16)
    # leave main

    # block (16)
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
_h:  .space 4
.align 2
_i:  .space 4
.align 2
_j:  .space 4

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

