.text
# function f
# formals: x (loc: 8); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -9); 
# space for locals: 12 bytes
#
_f:
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -12($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$1
    li $t0, 1
    sw $t0, -8($fp)	# tmp$1

    # add x, tmp$1, tmp$0
    lw $t0, 8($fp)	# x
    lw $t1, -8($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # move tmp$0, tmp$2
    lw $t0, -4($fp)	# tmp$0
    sb $t0, -9($fp)	# tmp$2

    # leave f

    # ret tmp$2
    lb $v0, -9($fp)	# tmp$2
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
# locals: x (loc: -4); y (loc: -5); tmp$3 (loc: -12); tmp$4 (loc: -16); tmp$5 (loc: -20); tmp$6 (loc: -24); tmp$7 (loc: -28); tmp$8 (loc: -32); tmp$9 (loc: -36); 
# space for locals: 36 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -36($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$3
    li $t0, 1
    sw $t0, -12($fp)	# tmp$3

    # move tmp$3, y
    lw $t0, -12($fp)	# tmp$3
    sb $t0, -5($fp)	# y

    # no_op 

    # no_op 

    # param y
    lb $t0, -5($fp)	# y
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 1
    jal _f
    la $sp, 4($sp)

    # retrieve tmp$4
    sw $v0, -16($fp)	# tmp$4

    # move tmp$4, x
    lw $t0, -16($fp)	# tmp$4
    sw $t0, -4($fp)	# x

    # no_op 

    # no_op 

    # no_op 

    # param x
    lw $t0, -4($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 1
    jal _f
    la $sp, 4($sp)

    # retrieve tmp$6
    sw $v0, -24($fp)	# tmp$6

    # add x, tmp$6, tmp$5
    lw $t0, -4($fp)	# x
    lw $t1, -24($fp)	# tmp$6
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$5

    # move tmp$5, y
    lw $t0, -20($fp)	# tmp$5
    sb $t0, -5($fp)	# y

    # no_op 

    # no_op 

    # move 81, tmp$8
    li $t0, 81
    sw $t0, -32($fp)	# tmp$8

    # param tmp$8
    lw $t0, -32($fp)	# tmp$8
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 1
    jal _f
    la $sp, 4($sp)

    # retrieve tmp$9
    sw $v0, -36($fp)	# tmp$9

    # add y, tmp$9, tmp$7
    lb $t0, -5($fp)	# y
    lw $t1, -36($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$7

    # move tmp$7, x
    lw $t0, -28($fp)	# tmp$7
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

