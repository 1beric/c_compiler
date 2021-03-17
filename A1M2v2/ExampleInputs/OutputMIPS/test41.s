.text
# function init
# formals: x (loc: 8); n (loc: 12); 
# locals: i (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); 
# space for locals: 24 bytes
#
_init:
    # enter init
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -24($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$0
    li $t0, 0
    sw $t0, -8($fp)	# tmp$0

    # move tmp$0, i
    lw $t0, -8($fp)	# tmp$0
    sw $t0, -4($fp)	# i

    # label 0
Lbl0:

    # no_op 

    # no_op 

    # if_lt i, n, label 1
    lw $t0, -4($fp)	# i
    lw $t1, 12($fp)	# n
    blt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move x, tmp$3
    lw $t0, 8($fp)	# x
    sw $t0, -20($fp)	# tmp$3

    # mul i, 4, tmp$4
    lw $t0, -4($fp)	# i
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$4

    # add tmp$3, tmp$4, tmp$3
    lw $t0, -20($fp)	# tmp$3
    lw $t1, -24($fp)	# tmp$4
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$3

    # no_op 

    # move i, deref(tmp$3)
    lw $t0, -4($fp)	# i
    lw $t1, -20($fp)	# tmp$3
    sw $t0, 0($t1)	# deref(tmp$3)

    # no_op 

    # no_op 

    # move 1, tmp$2
    li $t0, 1
    sw $t0, -16($fp)	# tmp$2

    # add i, tmp$2, tmp$1
    lw $t0, -4($fp)	# i
    lw $t1, -16($fp)	# tmp$2
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$1

    # move tmp$1, i
    lw $t0, -12($fp)	# tmp$1
    sw $t0, -4($fp)	# i

    # goto label 0
    j Lbl0

    # label 2
Lbl2:

    # no_op 

    # leave init

    # ret n
    lw $v0, 12($fp)	# n
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave init

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
    # enter count
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -44($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$5
    li $t0, 0
    sw $t0, -8($fp)	# tmp$5

    # move tmp$5, c
    lw $t0, -8($fp)	# tmp$5
    sw $t0, -4($fp)	# c

    # no_op 

    # no_op 

    # move 1, tmp$7
    li $t0, 1
    sw $t0, -16($fp)	# tmp$7

    # sub n, tmp$7, tmp$6
    lw $t0, 12($fp)	# n
    lw $t1, -16($fp)	# tmp$7
    sub $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$6

    # move tmp$6, n
    lw $t0, -12($fp)	# tmp$6
    sw $t0, 12($fp)	# n

    # label 3
Lbl3:

    # no_op 

    # move 0, tmp$8
    li $t0, 0
    sw $t0, -20($fp)	# tmp$8

    # if_ge n, tmp$8, label 4
    lw $t0, 12($fp)	# n
    lw $t1, -20($fp)	# tmp$8
    bge $t0, $t1, Lbl4

    # goto label 5
    j Lbl5

    # label 4
Lbl4:

    # no_op 

    # no_op 

    # no_op 

    # move x, tmp$10
    lw $t0, 8($fp)	# x
    sw $t0, -28($fp)	# tmp$10

    # mul n, 4, tmp$11
    lw $t0, 12($fp)	# n
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$11

    # add tmp$10, tmp$11, tmp$10
    lw $t0, -28($fp)	# tmp$10
    lw $t1, -32($fp)	# tmp$11
    add $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$10

    # move deref(tmp$10), tmp$12
    lw $t0, -28($fp)	# tmp$10
    lw $t0, 0($t0)	# deref(tmp$10)
    sw $t0, -36($fp)	# tmp$12

    # add c, tmp$12, tmp$9
    lw $t0, -4($fp)	# c
    lw $t1, -36($fp)	# tmp$12
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$9

    # move tmp$9, c
    lw $t0, -24($fp)	# tmp$9
    sw $t0, -4($fp)	# c

    # no_op 

    # no_op 

    # move 1, tmp$14
    li $t0, 1
    sw $t0, -44($fp)	# tmp$14

    # sub n, tmp$14, tmp$13
    lw $t0, 12($fp)	# n
    lw $t1, -44($fp)	# tmp$14
    sub $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$13

    # move tmp$13, n
    lw $t0, -40($fp)	# tmp$13
    sw $t0, 12($fp)	# n

    # goto label 3
    j Lbl3

    # label 5
Lbl5:

    # no_op 

    # leave count

    # ret c
    lw $v0, -4($fp)	# c
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave count

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
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -24($sp)   # allocate stack frame

    # no_op 

    # no_op 

    # move 10, tmp$15
    li $t0, 10
    sw $t0, -8($fp)	# tmp$15

    # param tmp$15
    lw $t0, -8($fp)	# tmp$15
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param addr(x)
    la $t0, _x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call init, 2
    jal _init
    la $sp, 8($sp)

    # retrieve tmp$16
    sw $v0, -12($fp)	# tmp$16

    # move tmp$16, z
    lw $t0, -12($fp)	# tmp$16
    sw $t0, -4($fp)	# z

    # no_op 

    # no_op 

    # no_op 

    # move 10, tmp$18
    li $t0, 10
    sw $t0, -20($fp)	# tmp$18

    # param tmp$18
    lw $t0, -20($fp)	# tmp$18
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param addr(x)
    la $t0, _x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call count, 2
    jal _count
    la $sp, 8($sp)

    # retrieve tmp$19
    sw $v0, -24($fp)	# tmp$19

    # add z, tmp$19, tmp$17
    lw $t0, -4($fp)	# z
    lw $t1, -24($fp)	# tmp$19
    add $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$17

    # move tmp$17, z
    lw $t0, -16($fp)	# tmp$17
    sw $t0, -4($fp)	# z

    # no_op 

    # param z
    lw $t0, -4($fp)	# z
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

