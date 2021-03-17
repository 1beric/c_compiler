.text
# function init
# formals: x (loc: 8); n (loc: 12); 
# locals: i (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); 
# space for locals: 24 bytes
#
_init:
    # -LEADER- block (0)
    # enter init
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -24($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$0
    li $t0, 0
    sw $t0, -8($fp)	# tmp$0

    # block (0)
    # move 0, i
    li $t0, 0
    sw $t0, -4($fp)	# i

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # no_op 

    # block (1)
    # no_op 

    # block (1)
    # if_ge i, n, label 2
    lw $t0, -4($fp)	# i
    lw $t1, 12($fp)	# n
    bge $t0, $t1, Lbl2

    # -LEADER- block (2)
    # label 1
Lbl1:

    # block (2)
    # no_op 

    # block (2)
    # move x, tmp$3
    lw $t0, 8($fp)	# x
    sw $t0, -20($fp)	# tmp$3

    # block (2)
    # mul i, 4, tmp$4
    lw $t0, -4($fp)	# i
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$4

    # block (2)
    # add x, tmp$4, tmp$3
    lw $t0, 8($fp)	# x
    lw $t1, -24($fp)	# tmp$4
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$3

    # block (2)
    # no_op 

    # block (2)
    # move i, deref(tmp$3)
    lw $t0, -4($fp)	# i
    lw $t1, -20($fp)	# tmp$3
    sw $t0, 0($t1)	# deref(tmp$3)

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # move 1, tmp$2
    li $t0, 1
    sw $t0, -16($fp)	# tmp$2

    # block (2)
    # add i, 1, tmp$1
    lw $t0, -4($fp)	# i
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$1

    # block (2)
    # move tmp$1, i
    lw $t0, -12($fp)	# tmp$1
    sw $t0, -4($fp)	# i

    # block (2)
    # goto label 0
    j Lbl0

    # -LEADER- block (3)
    # label 2
Lbl2:

    # block (3)
    # no_op 

    # block (3)
    # leave init

    # block (3)
    # ret n
    lw $v0, 12($fp)	# n
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (3)
    # leave init

    # block (3)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function init

.text
# function count
# formals: x (loc: 8); n (loc: 12); 
# locals: c (loc: -4); tmp$5 (loc: -8); tmp$6 (loc: -12); tmp$7 (loc: -16); tmp$8 (loc: -20); tmp$9 (loc: -24); tmp$10 (loc: -28); tmp$11 (loc: -32); tmp$12 (loc: -36); tmp$13 (loc: -40); tmp$14 (loc: -44); 
# space for locals: 44 bytes
#
_count:
    # -LEADER- block (4)
    # enter count
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -44($sp)   # allocate stack frame

    # block (4)
    # no_op 

    # block (4)
    # move 0, tmp$5
    li $t0, 0
    sw $t0, -8($fp)	# tmp$5

    # block (4)
    # move 0, c
    li $t0, 0
    sw $t0, -4($fp)	# c

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # move 1, tmp$7
    li $t0, 1
    sw $t0, -16($fp)	# tmp$7

    # block (4)
    # sub n, 1, tmp$6
    lw $t0, 12($fp)	# n
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$6

    # block (4)
    # move tmp$6, n
    lw $t0, -12($fp)	# tmp$6
    sw $t0, 12($fp)	# n

    # -LEADER- block (5)
    # label 3
Lbl3:

    # block (5)
    # no_op 

    # block (5)
    # move 0, tmp$8
    li $t0, 0
    sw $t0, -20($fp)	# tmp$8

    # block (5)
    # if_lt n, 0, label 5
    lw $t0, 12($fp)	# n
    li $t1, 0
    blt $t0, $t1, Lbl5

    # -LEADER- block (6)
    # label 4
Lbl4:

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # move x, tmp$10
    lw $t0, 8($fp)	# x
    sw $t0, -28($fp)	# tmp$10

    # block (6)
    # mul n, 4, tmp$11
    lw $t0, 12($fp)	# n
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$11

    # block (6)
    # add x, tmp$11, tmp$10
    lw $t0, 8($fp)	# x
    lw $t1, -32($fp)	# tmp$11
    add $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$10

    # block (6)
    # move deref(tmp$10), tmp$12
    lw $t0, -28($fp)	# tmp$10
    lw $t0, 0($t0)	# deref(tmp$10)
    sw $t0, -36($fp)	# tmp$12

    # block (6)
    # add c, deref(tmp$10), tmp$9
    lw $t0, -4($fp)	# c
    lw $t1, -28($fp)	# tmp$10
    lw $t1, 0($t1)	# deref(tmp$10)
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$9

    # block (6)
    # move tmp$9, c
    lw $t0, -24($fp)	# tmp$9
    sw $t0, -4($fp)	# c

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # move 1, tmp$14
    li $t0, 1
    sw $t0, -44($fp)	# tmp$14

    # block (6)
    # sub n, 1, tmp$13
    lw $t0, 12($fp)	# n
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$13

    # block (6)
    # move tmp$13, n
    lw $t0, -40($fp)	# tmp$13
    sw $t0, 12($fp)	# n

    # block (6)
    # goto label 3
    j Lbl3

    # -LEADER- block (7)
    # label 5
Lbl5:

    # block (7)
    # no_op 

    # block (7)
    # leave count

    # block (7)
    # ret c
    lw $v0, -4($fp)	# c
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (7)
    # leave count

    # block (7)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function count

.text
# function main
# formals: 
# locals: z (loc: -4); tmp$15 (loc: -8); tmp$16 (loc: -12); tmp$17 (loc: -16); tmp$18 (loc: -20); tmp$19 (loc: -24); 
# space for locals: 24 bytes
#
_main:
    # -LEADER- block (8)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -24($sp)   # allocate stack frame

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # move 10, tmp$15
    li $t0, 10
    sw $t0, -8($fp)	# tmp$15

    # block (8)
    # param 10
    li $t0, 10
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # param addr(x)
    la $t0, _x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # call init, 2
    jal _init
    la $sp, 8($sp)

    # block (8)
    # retrieve tmp$16
    sw $v0, -12($fp)	# tmp$16

    # block (8)
    # move tmp$16, z
    lw $t0, -12($fp)	# tmp$16
    sw $t0, -4($fp)	# z

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # move 10, tmp$18
    li $t0, 10
    sw $t0, -20($fp)	# tmp$18

    # block (8)
    # param 10
    li $t0, 10
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # param addr(x)
    la $t0, _x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # call count, 2
    jal _count
    la $sp, 8($sp)

    # block (8)
    # retrieve tmp$19
    sw $v0, -24($fp)	# tmp$19

    # block (8)
    # add tmp$16, tmp$19, tmp$17
    lw $t0, -12($fp)	# tmp$16
    lw $t1, -24($fp)	# tmp$19
    add $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$17

    # block (8)
    # move tmp$17, z
    lw $t0, -16($fp)	# tmp$17
    sw $t0, -4($fp)	# z

    # block (8)
    # no_op 

    # block (8)
    # param tmp$17
    lw $t0, -16($fp)	# tmp$17
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
_x:  .space 40

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

