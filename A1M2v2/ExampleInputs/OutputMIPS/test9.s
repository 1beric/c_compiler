.text
# function main
# formals: 
# locals: c2 (loc: -1); i2 (loc: -8); tmp$0 (loc: -12); 
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

    # move 255, tmp$0
    li $t0, 255
    sw $t0, -12($fp)	# tmp$0

    # move tmp$0, i0
    lw $t0, -12($fp)	# tmp$0
    sw $t0, _i0

    # no_op 

    # no_op 

    # move i0, c2
    lw $t0, _i0
    sb $t0, -1($fp)	# c2

    # no_op 

    # no_op 

    # move c2, i1
    lb $t0, -1($fp)	# c2
    sw $t0, _i1

    # no_op 

    # no_op 

    # move i1, c0
    lw $t0, _i1
    sb $t0, _c0

    # no_op 

    # no_op 

    # move c0, i2
    lb $t0, _c0
    sw $t0, -8($fp)	# i2

    # no_op 

    # no_op 

    # move i2, c2
    lw $t0, -8($fp)	# i2
    sb $t0, -1($fp)	# c2

    # no_op 

    # no_op 

    # move c2, c1
    lb $t0, -1($fp)	# c2
    sb $t0, _c1

    # no_op 

    # param i0
    lw $t0, _i0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param i1
    lw $t0, _i1
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param i2
    lw $t0, -8($fp)	# i2
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param c0
    lb $t0, _c0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param c1
    lb $t0, _c1
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # param c2
    lb $t0, -1($fp)	# c2
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
_c0:  .space 1
_c1:  .space 1
.align 2
_i0:  .space 4
.align 2
_i1:  .space 4

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

