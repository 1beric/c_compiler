.text
# function sum
# formals: x (loc: 8); i (loc: 12); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -9); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -33); tmp$9 (loc: -40); tmp$10 (loc: -44); tmp$11 (loc: -48); 
# space for locals: 48 bytes
#
_sum:
    # -LEADER- block (0)
    # enter sum
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -48($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move x, tmp$0
    lw $t0, 8($fp)	# x
    sw $t0, -4($fp)	# tmp$0

    # block (0)
    # move i, tmp$1
    lw $t0, 12($fp)	# i
    sw $t0, -8($fp)	# tmp$1

    # block (0)
    # add x, tmp$1, tmp$0
    lw $t0, 8($fp)	# x
    lw $t1, -8($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # block (0)
    # move deref(tmp$0), tmp$2
    lw $t0, -4($fp)	# tmp$0
    lb $t0, 0($t0)	# deref(tmp$0)
    sb $t0, -9($fp)	# tmp$2

    # block (0)
    # move 0, tmp$3
    li $t0, 0
    sw $t0, -16($fp)	# tmp$3

    # block (0)
    # if_ne tmp$2, 0, label 1
    lb $t0, -9($fp)	# tmp$2
    li $t1, 0
    bne $t0, $t1, Lbl1

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # move 0, tmp$4
    li $t0, 0
    sw $t0, -20($fp)	# tmp$4

    # block (1)
    # leave sum

    # block (1)
    # ret 0
    li $v0, 0
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
    # move x, tmp$6
    lw $t0, 8($fp)	# x
    sw $t0, -28($fp)	# tmp$6

    # block (2)
    # move i, tmp$7
    lw $t0, 12($fp)	# i
    sw $t0, -32($fp)	# tmp$7

    # block (2)
    # add x, tmp$7, tmp$6
    lw $t0, 8($fp)	# x
    lw $t1, -32($fp)	# tmp$7
    add $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$6

    # block (2)
    # move deref(tmp$6), tmp$8
    lw $t0, -28($fp)	# tmp$6
    lb $t0, 0($t0)	# deref(tmp$6)
    sb $t0, -33($fp)	# tmp$8

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # move 1, tmp$10
    li $t0, 1
    sw $t0, -44($fp)	# tmp$10

    # block (2)
    # add i, 1, tmp$9
    lw $t0, 12($fp)	# i
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$9

    # block (2)
    # param tmp$9
    lw $t0, -40($fp)	# tmp$9
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (2)
    # param addr(x)
    lw $t0, 8($fp)	# addr(x)
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (2)
    # call sum, 2
    jal _sum
    la $sp, 8($sp)

    # block (2)
    # retrieve tmp$11
    sw $v0, -48($fp)	# tmp$11

    # block (2)
    # add tmp$8, tmp$11, tmp$5
    lb $t0, -33($fp)	# tmp$8
    lw $t1, -48($fp)	# tmp$11
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$5

    # block (2)
    # leave sum

    # block (2)
    # ret tmp$5
    lw $v0, -24($fp)	# tmp$5
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # -LEADER- block (3)
    # label 2
Lbl2:

    # block (3)
    # leave sum

    # block (3)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (3)
    # leave sum

    # block (3)
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
    # -LEADER- block (4)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -12($sp)   # allocate stack frame

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # move 0, tmp$12
    li $t0, 0
    sw $t0, -8($fp)	# tmp$12

    # block (4)
    # param 0
    li $t0, 0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # param addr(_Str0)
    la $t0, __Str0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call sum, 2
    jal _sum
    la $sp, 8($sp)

    # block (4)
    # retrieve tmp$13
    sw $v0, -12($fp)	# tmp$13

    # block (4)
    # move tmp$13, x
    lw $t0, -12($fp)	# tmp$13
    sw $t0, -4($fp)	# x

    # block (4)
    # no_op 

    # block (4)
    # param tmp$13
    lw $t0, -12($fp)	# tmp$13
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (4)
    # no_op 

    # block (4)
    # leave main

    # block (4)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (4)
    # leave main

    # block (4)
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

