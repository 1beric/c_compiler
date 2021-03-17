.text
# function main
# formals: 
# locals: u (loc: -4); v (loc: -8); x (loc: -12); y (loc: -16); z (loc: -20); tmp$0 (loc: -24); tmp$1 (loc: -28); tmp$2 (loc: -32); tmp$3 (loc: -36); tmp$4 (loc: -40); 
# space for locals: 40 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -40($sp)   # allocate stack frame

    # no_op 

    # move 111, tmp$0
    li $t0, 111
    sw $t0, -24($fp)	# tmp$0

    # move tmp$0, x
    lw $t0, -24($fp)	# tmp$0
    sw $t0, -12($fp)	# x

    # no_op 

    # move 222, tmp$1
    li $t0, 222
    sw $t0, -28($fp)	# tmp$1

    # move tmp$1, y
    lw $t0, -28($fp)	# tmp$1
    sw $t0, -16($fp)	# y

    # no_op 

    # move 333, tmp$2
    li $t0, 333
    sw $t0, -32($fp)	# tmp$2

    # move tmp$2, z
    lw $t0, -32($fp)	# tmp$2
    sw $t0, -20($fp)	# z

    # no_op 

    # move 444, tmp$3
    li $t0, 444
    sw $t0, -36($fp)	# tmp$3

    # move tmp$3, u
    lw $t0, -36($fp)	# tmp$3
    sw $t0, -4($fp)	# u

    # no_op 

    # move 555, tmp$4
    li $t0, 555
    sw $t0, -40($fp)	# tmp$4

    # move tmp$4, v
    lw $t0, -40($fp)	# tmp$4
    sw $t0, -8($fp)	# v

    # no_op 

    # param x
    lw $t0, -12($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param y
    lw $t0, -16($fp)	# y
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param z
    lw $t0, -20($fp)	# z
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param u
    lw $t0, -4($fp)	# u
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param v
    lw $t0, -8($fp)	# v
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

