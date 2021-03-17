.text
# function f
# formals: n (loc: 8); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -36); 
# space for locals: 36 bytes
#
_f:
    # -LEADER- block (0)
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -36($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 1, tmp$0
    li $t0, 1
    sw $t0, -4($fp)	# tmp$0

    # block (0)
    # if_gt n, 1, label 1
    lw $t0, 8($fp)	# n
    li $t1, 1
    bgt $t0, $t1, Lbl1

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # move 1, tmp$1
    li $t0, 1
    sw $t0, -8($fp)	# tmp$1

    # block (1)
    # leave f

    # block (1)
    # ret 1
    li $v0, 1
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (1)
    # goto label 2
    j Lbl2

    # -LEADER- block (2)
    # label 1
Lbl1:

    # block (2)
    # no_op 

    # block (2)
    # move 1, tmp$4
    li $t0, 1
    sw $t0, -20($fp)	# tmp$4

    # block (2)
    # sub n, 1, tmp$3
    lw $t0, 8($fp)	# n
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$3

    # block (2)
    # param tmp$3
    lw $t0, -16($fp)	# tmp$3
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (2)
    # call g, 1
    jal _g
    la $sp, 4($sp)

    # block (2)
    # retrieve tmp$5
    sw $v0, -24($fp)	# tmp$5

    # block (2)
    # no_op 

    # block (2)
    # move 2, tmp$7
    li $t0, 2
    sw $t0, -32($fp)	# tmp$7

    # block (2)
    # sub n, 2, tmp$6
    lw $t0, 8($fp)	# n
    li $t1, 2
    sub $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$6

    # block (2)
    # param tmp$6
    lw $t0, -28($fp)	# tmp$6
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (2)
    # call f, 1
    jal _f
    la $sp, 4($sp)

    # block (2)
    # retrieve tmp$8
    sw $v0, -36($fp)	# tmp$8

    # block (2)
    # add tmp$5, tmp$8, tmp$2
    lw $t0, -24($fp)	# tmp$5
    lw $t1, -36($fp)	# tmp$8
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$2

    # block (2)
    # leave f

    # block (2)
    # ret tmp$2
    lw $v0, -12($fp)	# tmp$2
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # -LEADER- block (3)
    # label 2
Lbl2:

    # block (3)
    # leave f

    # block (3)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (3)
    # leave f

    # block (3)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function f

.text
# function g
# formals: n (loc: 8); 
# locals: tmp$9 (loc: -4); tmp$10 (loc: -8); tmp$11 (loc: -12); tmp$12 (loc: -16); tmp$13 (loc: -20); tmp$14 (loc: -24); tmp$15 (loc: -28); tmp$16 (loc: -32); tmp$17 (loc: -36); 
# space for locals: 36 bytes
#
_g:
    # -LEADER- block (4)
    # enter g
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -36($sp)   # allocate stack frame

    # block (4)
    # no_op 

    # block (4)
    # move 1, tmp$9
    li $t0, 1
    sw $t0, -4($fp)	# tmp$9

    # block (4)
    # if_gt n, 1, label 4
    lw $t0, 8($fp)	# n
    li $t1, 1
    bgt $t0, $t1, Lbl4

    # -LEADER- block (5)
    # label 3
Lbl3:

    # block (5)
    # move 1, tmp$10
    li $t0, 1
    sw $t0, -8($fp)	# tmp$10

    # block (5)
    # leave g

    # block (5)
    # ret 1
    li $v0, 1
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (5)
    # goto label 5
    j Lbl5

    # -LEADER- block (6)
    # label 4
Lbl4:

    # block (6)
    # no_op 

    # block (6)
    # move 1, tmp$13
    li $t0, 1
    sw $t0, -20($fp)	# tmp$13

    # block (6)
    # sub n, 1, tmp$12
    lw $t0, 8($fp)	# n
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$12

    # block (6)
    # param tmp$12
    lw $t0, -16($fp)	# tmp$12
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (6)
    # call f, 1
    jal _f
    la $sp, 4($sp)

    # block (6)
    # retrieve tmp$14
    sw $v0, -24($fp)	# tmp$14

    # block (6)
    # no_op 

    # block (6)
    # move 2, tmp$16
    li $t0, 2
    sw $t0, -32($fp)	# tmp$16

    # block (6)
    # sub n, 2, tmp$15
    lw $t0, 8($fp)	# n
    li $t1, 2
    sub $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$15

    # block (6)
    # param tmp$15
    lw $t0, -28($fp)	# tmp$15
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (6)
    # call g, 1
    jal _g
    la $sp, 4($sp)

    # block (6)
    # retrieve tmp$17
    sw $v0, -36($fp)	# tmp$17

    # block (6)
    # add tmp$14, tmp$17, tmp$11
    lw $t0, -24($fp)	# tmp$14
    lw $t1, -36($fp)	# tmp$17
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$11

    # block (6)
    # leave g

    # block (6)
    # ret tmp$11
    lw $v0, -12($fp)	# tmp$11
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # -LEADER- block (7)
    # label 5
Lbl5:

    # block (7)
    # leave g

    # block (7)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (7)
    # leave g

    # block (7)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function g

.text
# function main
# formals: 
# locals: x (loc: -4); tmp$18 (loc: -8); tmp$19 (loc: -12); 
# space for locals: 12 bytes
#
_main:
    # -LEADER- block (8)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -12($sp)   # allocate stack frame

    # block (8)
    # no_op 

    # block (8)
    # move 5, tmp$18
    li $t0, 5
    sw $t0, -8($fp)	# tmp$18

    # block (8)
    # param 5
    li $t0, 5
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # call f, 1
    jal _f
    la $sp, 4($sp)

    # block (8)
    # retrieve tmp$19
    sw $v0, -12($fp)	# tmp$19

    # block (8)
    # move tmp$19, x
    lw $t0, -12($fp)	# tmp$19
    sw $t0, -4($fp)	# x

    # block (8)
    # no_op 

    # block (8)
    # param tmp$19
    lw $t0, -12($fp)	# tmp$19
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (8)
    # no_op 

    # block (8)
    # leave main

    # block (8)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (8)
    # leave main

    # block (8)
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

