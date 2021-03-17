.text
# function main
# formals: 
# locals: x (loc: -40); y (loc: -44); tmp$0 (loc: -48); tmp$1 (loc: -52); tmp$2 (loc: -56); tmp$3 (loc: -60); tmp$4 (loc: -64); tmp$5 (loc: -68); tmp$6 (loc: -72); 
# space for locals: 72 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -72($sp)   # allocate stack frame

    # block (0)
    # move 5, tmp$2
    li $t0, 5
    sw $t0, -56($fp)	# tmp$2

    # block (0)
    # move addr(x), tmp$0
    la $t0, -40($fp)	# addr(x)
    sw $t0, -48($fp)	# tmp$0

    # block (0)
    # move 20, tmp$1
    li $t0, 20
    sw $t0, -52($fp)	# tmp$1

    # block (0)
    # add addr(x), tmp$1, tmp$0
    la $t0, -40($fp)	# addr(x)
    lw $t1, -52($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$0

    # block (0)
    # move 4321, tmp$3
    li $t0, 4321
    sw $t0, -60($fp)	# tmp$3

    # block (0)
    # move 4321, deref(tmp$0)
    li $t0, 4321
    lw $t1, -48($fp)	# tmp$0
    sw $t0, 0($t1)	# deref(tmp$0)

    # block (0)
    # no_op 

    # block (0)
    # move 5, tmp$6
    li $t0, 5
    sw $t0, -72($fp)	# tmp$6

    # block (0)
    # move addr(x), tmp$4
    la $t0, -40($fp)	# addr(x)
    sw $t0, -64($fp)	# tmp$4

    # block (0)
    # move 20, tmp$5
    li $t0, 20
    sw $t0, -68($fp)	# tmp$5

    # block (0)
    # add addr(x), tmp$5, tmp$4
    la $t0, -40($fp)	# addr(x)
    lw $t1, -68($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$4

    # block (0)
    # move deref(tmp$4), y
    lw $t0, -64($fp)	# tmp$4
    lw $t0, 0($t0)	# deref(tmp$4)
    sw $t0, -44($fp)	# y

    # block (0)
    # no_op 

    # block (0)
    # param deref(tmp$4)
    lw $t0, -64($fp)	# tmp$4
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

