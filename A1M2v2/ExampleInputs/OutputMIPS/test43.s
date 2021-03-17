.text
# function sum
# formals: x (loc: 8); i (loc: 12); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -9); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -33); tmp$9 (loc: -40); tmp$10 (loc: -44); tmp$11 (loc: -48); 
# space for locals: 48 bytes
#
_sum:
    # enter sum
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -48($sp)   # allocate stack frame

    # no_op 

    # move x, tmp$0
    lw $t0, 8($fp)	# x
    sw $t0, -4($fp)	# tmp$0

    # mul i, 1, tmp$1
    lw $t0, 12($fp)	# i
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -8($fp)	# tmp$1

    # add tmp$0, tmp$1, tmp$0
    lw $t0, -4($fp)	# tmp$0
    lw $t1, -8($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # move deref(tmp$0), tmp$2
    lw $t0, -4($fp)	# tmp$0
    lb $t0, 0($t0)	# deref(tmp$0)
    sb $t0, -9($fp)	# tmp$2

    # move 0, tmp$3
    li $t0, 0
    sw $t0, -16($fp)	# tmp$3

    # if_eq tmp$2, tmp$3, label 0
    lb $t0, -9($fp)	# tmp$2
    lw $t1, -16($fp)	# tmp$3
    beq $t0, $t1, Lbl0

    # goto label 1
    j Lbl1

    # label 0
Lbl0:

    # move 0, tmp$4
    li $t0, 0
    sw $t0, -20($fp)	# tmp$4

    # leave sum

    # ret tmp$4
    lw $v0, -20($fp)	# tmp$4
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move x, tmp$6
    lw $t0, 8($fp)	# x
    sw $t0, -28($fp)	# tmp$6

    # mul i, 1, tmp$7
    lw $t0, 12($fp)	# i
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$7

    # add tmp$6, tmp$7, tmp$6
    lw $t0, -28($fp)	# tmp$6
    lw $t1, -32($fp)	# tmp$7
    add $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$6

    # move deref(tmp$6), tmp$8
    lw $t0, -28($fp)	# tmp$6
    lb $t0, 0($t0)	# deref(tmp$6)
    sb $t0, -33($fp)	# tmp$8

    # no_op 

    # no_op 

    # move 1, tmp$10
    li $t0, 1
    sw $t0, -44($fp)	# tmp$10

    # add i, tmp$10, tmp$9
    lw $t0, 12($fp)	# i
    lw $t1, -44($fp)	# tmp$10
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$9

    # param tmp$9
    lw $t0, -40($fp)	# tmp$9
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param addr(x)
    lw $t0, 8($fp)	# addr(x)
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call sum, 2
    jal _sum
    la $sp, 8($sp)

    # retrieve tmp$11
    sw $v0, -48($fp)	# tmp$11

    # add tmp$8, tmp$11, tmp$5
    lb $t0, -33($fp)	# tmp$8
    lw $t1, -48($fp)	# tmp$11
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$5

    # leave sum

    # ret tmp$5
    lw $v0, -24($fp)	# tmp$5
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # label 2
Lbl2:

    # leave sum

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave sum

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function sum

.text
# function main
# formals: 
# locals: x (loc: -4); tmp$12 (loc: -8); tmp$13 (loc: -12); 
# space for locals: 12 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -12($sp)   # allocate stack frame

    # no_op 

    # no_op 

    # move 0, tmp$12
    li $t0, 0
    sw $t0, -8($fp)	# tmp$12

    # param tmp$12
    lw $t0, -8($fp)	# tmp$12
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param addr(_Str0)
    la $t0, __Str0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call sum, 2
    jal _sum
    la $sp, 8($sp)

    # retrieve tmp$13
    sw $v0, -12($fp)	# tmp$13

    # move tmp$13, x
    lw $t0, -12($fp)	# tmp$13
    sw $t0, -4($fp)	# x

    # no_op 

    # param x
    lw $t0, -4($fp)	# x
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

__Str0: .asciiz "hello world"
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

