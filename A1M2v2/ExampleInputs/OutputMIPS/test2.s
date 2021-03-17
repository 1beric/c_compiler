.text
# function main
# formals: 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); 
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

    # move 13579, tmp$0
    li $t0, 13579
    sw $t0, -4($fp)	# tmp$0

    # move tmp$0, x
    lw $t0, -4($fp)	# tmp$0
    sw $t0, _x

    # no_op 

    # move 24680, tmp$1
    li $t0, 24680
    sw $t0, -8($fp)	# tmp$1

    # move tmp$1, y
    lw $t0, -8($fp)	# tmp$1
    sw $t0, _y

    # no_op 

    # move 21436, tmp$2
    li $t0, 21436
    sw $t0, -12($fp)	# tmp$2

    # move tmp$2, z
    lw $t0, -12($fp)	# tmp$2
    sw $t0, _z

    # no_op 

    # param x
    lw $t0, _x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param y
    lw $t0, _y
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param z
    lw $t0, _z
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
_x:  .space 4
.align 2
_y:  .space 4
.align 2
_z:  .space 4

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

