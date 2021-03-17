.text
# function f
# formals: a (loc: 8); b (loc: 12); c (loc: 16); d (loc: 20); e (loc: 24); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); 
# space for locals: 16 bytes
#
_f:
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -16($sp)   # allocate stack frame

    # no_op 

    # no_op 

    # no_op 

    # no_op 

    # no_op 

    # mul d, e, tmp$3
    lw $t0, 20($fp)	# d
    lw $t1, 24($fp)	# e
    mul $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$3

    # add c, tmp$3, tmp$2
    lw $t0, 16($fp)	# c
    lw $t1, -16($fp)	# tmp$3
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$2

    # mul b, tmp$2, tmp$1
    lw $t0, 12($fp)	# b
    lw $t1, -12($fp)	# tmp$2
    mul $t2, $t0, $t1
    sw $t2, -8($fp)	# tmp$1

    # add a, tmp$1, tmp$0
    lw $t0, 8($fp)	# a
    lw $t1, -8($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # leave f

    # ret tmp$0
    lw $v0, -4($fp)	# tmp$0
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave f

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function f

.text
# function main
# formals: 
# locals: x (loc: -4); tmp$4 (loc: -8); tmp$5 (loc: -12); tmp$6 (loc: -16); tmp$7 (loc: -20); tmp$8 (loc: -24); tmp$9 (loc: -28); tmp$10 (loc: -32); 
# space for locals: 32 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -32($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$4
    li $t0, 1
    sw $t0, -8($fp)	# tmp$4

    # move 2, tmp$5
    li $t0, 2
    sw $t0, -12($fp)	# tmp$5

    # move 3, tmp$6
    li $t0, 3
    sw $t0, -16($fp)	# tmp$6

    # move 4, tmp$7
    li $t0, 4
    sw $t0, -20($fp)	# tmp$7

    # move 5, tmp$8
    li $t0, 5
    sw $t0, -24($fp)	# tmp$8

    # param tmp$8
    lw $t0, -24($fp)	# tmp$8
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param tmp$7
    lw $t0, -20($fp)	# tmp$7
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param tmp$6
    lw $t0, -16($fp)	# tmp$6
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param tmp$5
    lw $t0, -12($fp)	# tmp$5
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param tmp$4
    lw $t0, -8($fp)	# tmp$4
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 5
    jal _f
    la $sp, 20($sp)

    # retrieve tmp$9
    sw $v0, -28($fp)	# tmp$9

    # move tmp$9, x
    lw $t0, -28($fp)	# tmp$9
    sw $t0, -4($fp)	# x

    # no_op 

    # no_op 

    # no_op 

    # no_op 

    # no_op 

    # no_op 

    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 5
    jal _f
    la $sp, 20($sp)

    # retrieve tmp$10
    sw $v0, -32($fp)	# tmp$10

    # move tmp$10, x
    lw $t0, -32($fp)	# tmp$10
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

