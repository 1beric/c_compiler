.text
# function main
# formals: 
# locals: y (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); 
# space for locals: 32 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -32($sp)   # allocate stack frame

    # block (0)
    # move 7, tmp$2
    li $t0, 7
    sw $t0, -16($fp)	# tmp$2

    # block (0)
    # move addr(x), tmp$0
    la $t0, _x
    sw $t0, -8($fp)	# tmp$0

    # block (0)
    # move 28, tmp$1
    li $t0, 28
    sw $t0, -12($fp)	# tmp$1

    # block (0)
    # add addr(x), tmp$1, tmp$0
    la $t0, _x
    lw $t1, -12($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -8($fp)	# tmp$0

    # block (0)
    # move 3142, tmp$3
    li $t0, 3142
    sw $t0, -20($fp)	# tmp$3

    # block (0)
    # move 3142, deref(tmp$0)
    li $t0, 3142
    lw $t1, -8($fp)	# tmp$0
    sw $t0, 0($t1)	# deref(tmp$0)

    # block (0)
    # no_op 

    # block (0)
    # move 7, tmp$6
    li $t0, 7
    sw $t0, -32($fp)	# tmp$6

    # block (0)
    # move addr(x), tmp$4
    la $t0, _x
    sw $t0, -24($fp)	# tmp$4

    # block (0)
    # move 28, tmp$5
    li $t0, 28
    sw $t0, -28($fp)	# tmp$5

    # block (0)
    # add addr(x), tmp$5, tmp$4
    la $t0, _x
    lw $t1, -28($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$4

    # block (0)
    # move deref(tmp$4), y
    lw $t0, -24($fp)	# tmp$4
    lw $t0, 0($t0)	# deref(tmp$4)
    sw $t0, -4($fp)	# y

    # block (0)
    # no_op 

    # block (0)
    # param deref(tmp$4)
    lw $t0, -24($fp)	# tmp$4
    lw $t0, 0($t0)	# deref(tmp$4)
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
_x:  .space 40

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

