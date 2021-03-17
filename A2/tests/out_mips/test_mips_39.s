.text
# function f
# formals: x (loc: 8); y (loc: 12); z (loc: 16); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); 
# space for locals: 8 bytes
#
_f:
    # -LEADER- block (0)
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -8($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # add x, y, tmp$1
    lb $t0, 8($fp)	# x
    lb $t1, 12($fp)	# y
    add $t2, $t0, $t1
    sw $t2, -8($fp)	# tmp$1

    # block (0)
    # no_op 

    # block (0)
    # add tmp$1, z, tmp$0
    lw $t0, -8($fp)	# tmp$1
    lb $t1, 16($fp)	# z
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # block (0)
    # leave f

    # block (0)
    # ret tmp$0
    lw $v0, -4($fp)	# tmp$0
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (0)
    # leave f

    # block (0)
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
    # -LEADER- block (1)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -20($sp)   # allocate stack frame

    # block (1)
    # no_op 

    # block (1)
    # move 111, tmp$2
    li $t0, 111
    sw $t0, -8($fp)	# tmp$2

    # block (1)
    # move 222, tmp$3
    li $t0, 222
    sw $t0, -12($fp)	# tmp$3

    # block (1)
    # move 0, tmp$4
    li $t0, 0
    sw $t0, -16($fp)	# tmp$4

    # block (1)
    # param 0
    li $t0, 0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (1)
    # param 222
    li $t0, 222
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (1)
    # param 111
    li $t0, 111
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (1)
    # call f, 3
    jal _f
    la $sp, 12($sp)

    # block (1)
    # retrieve tmp$5
    sw $v0, -20($fp)	# tmp$5

    # block (1)
    # move tmp$5, x
    lw $t0, -20($fp)	# tmp$5
    sw $t0, -4($fp)	# x

    # block (1)
    # no_op 

    # block (1)
    # param tmp$5
    lw $t0, -20($fp)	# tmp$5
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (1)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (1)
    # no_op 

    # block (1)
    # leave main

    # block (1)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (1)
    # leave main

    # block (1)
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

