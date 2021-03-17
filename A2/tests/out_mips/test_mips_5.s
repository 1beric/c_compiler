.text
# function main
# formals: 
# locals: u (loc: -4); v (loc: -8); x (loc: -12); y (loc: -16); z (loc: -20); tmp$0 (loc: -24); tmp$1 (loc: -28); tmp$2 (loc: -32); tmp$3 (loc: -36); tmp$4 (loc: -40); 
# space for locals: 40 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -40($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 111, tmp$0
    li $t0, 111
    sw $t0, -24($fp)	# tmp$0

    # block (0)
    # move 111, x
    li $t0, 111
    sw $t0, -12($fp)	# x

    # block (0)
    # no_op 

    # block (0)
    # move 222, tmp$1
    li $t0, 222
    sw $t0, -28($fp)	# tmp$1

    # block (0)
    # move 222, y
    li $t0, 222
    sw $t0, -16($fp)	# y

    # block (0)
    # no_op 

    # block (0)
    # move 333, tmp$2
    li $t0, 333
    sw $t0, -32($fp)	# tmp$2

    # block (0)
    # move 333, z
    li $t0, 333
    sw $t0, -20($fp)	# z

    # block (0)
    # no_op 

    # block (0)
    # move 444, tmp$3
    li $t0, 444
    sw $t0, -36($fp)	# tmp$3

    # block (0)
    # move 444, u
    li $t0, 444
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # move 555, tmp$4
    li $t0, 555
    sw $t0, -40($fp)	# tmp$4

    # block (0)
    # move 555, v
    li $t0, 555
    sw $t0, -8($fp)	# v

    # block (0)
    # no_op 

    # block (0)
    # param 111
    li $t0, 111
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # param 222
    li $t0, 222
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # param 333
    li $t0, 333
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # param 444
    li $t0, 444
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # param 555
    li $t0, 555
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # leave main

    # block (0)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (0)
    # leave main

    # block (0)
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

