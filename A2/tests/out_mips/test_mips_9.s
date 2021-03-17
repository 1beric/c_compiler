.text
# function main
# formals: 
# locals: c2 (loc: -4); i2 (loc: -8); tmp$0 (loc: -12); 
# space for locals: 12 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -12($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 255, tmp$0
    li $t0, 255
    sw $t0, -12($fp)	# tmp$0

    # block (0)
    # move 255, i0
    li $t0, 255
    sw $t0, _i0

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 255, c2
    li $t0, 255
    sw $t0, -4($fp)	# c2

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 255, i1
    li $t0, 255
    sw $t0, _i1

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 255, c0
    li $t0, 255
    sw $t0, _c0

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 255, i2
    li $t0, 255
    sw $t0, -8($fp)	# i2

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 255, c2
    li $t0, 255
    sw $t0, -4($fp)	# c2

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 255, c1
    li $t0, 255
    sw $t0, _c1

    # block (0)
    # no_op 

    # block (0)
    # param 255
    li $t0, 255
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
    # param i1
    lw $t0, _i1
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
    # param 255
    li $t0, 255
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
    # param c0
    lw $t0, _c0
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
    # param c1
    lw $t0, _c1
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
    # param 255
    li $t0, 255
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
_c0:  .space 4
.align 2
_c1:  .space 4
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

