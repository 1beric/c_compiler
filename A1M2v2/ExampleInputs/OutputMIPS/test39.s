.text
# function f
# formals: x (loc: 8); y (loc: 12); z (loc: 16); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); 
# space for locals: 8 bytes
#
_f:
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -8($sp)   # allocate stack frame

    # no_op 

    # no_op 

    # add x, y, tmp$1
    lb $t0, 8($fp)	# x
    lb $t1, 12($fp)	# y
    add $t2, $t0, $t1
    sw $t2, -8($fp)	# tmp$1

    # no_op 

    # add tmp$1, z, tmp$0
    lw $t0, -8($fp)	# tmp$1
    lb $t1, 16($fp)	# z
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
# locals: x (loc: -4); tmp$2 (loc: -8); tmp$3 (loc: -12); tmp$4 (loc: -16); tmp$5 (loc: -20); 
# space for locals: 20 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -20($sp)   # allocate stack frame

    # no_op 

    # move 111, tmp$2
    li $t0, 111
    sw $t0, -8($fp)	# tmp$2

    # move 222, tmp$3
    li $t0, 222
    sw $t0, -12($fp)	# tmp$3

    # move 0, tmp$4
    li $t0, 0
    sw $t0, -16($fp)	# tmp$4

    # param tmp$4
    lw $t0, -16($fp)	# tmp$4
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param tmp$3
    lw $t0, -12($fp)	# tmp$3
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param tmp$2
    lw $t0, -8($fp)	# tmp$2
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 3
    jal _f
    la $sp, 12($sp)

    # retrieve tmp$5
    sw $v0, -20($fp)	# tmp$5

    # move tmp$5, x
    lw $t0, -20($fp)	# tmp$5
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

