.text
# function main
# formals: 
# locals: u (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); tmp$7 (loc: -36); tmp$8 (loc: -40); tmp$9 (loc: -44); tmp$10 (loc: -48); tmp$11 (loc: -52); tmp$12 (loc: -56); 
# space for locals: 56 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -56($sp)   # allocate stack frame

    # block (0)
    # move 7, tmp$2
    li $t0, 7
    sw $t0, -16($fp)	# tmp$2

    # block (0)
    # move addr(y), tmp$0
    la $t0, _y
    sw $t0, -8($fp)	# tmp$0

    # block (0)
    # move 28, tmp$1
    li $t0, 28
    sw $t0, -12($fp)	# tmp$1

    # block (0)
    # add addr(y), tmp$1, tmp$0
    la $t0, _y
    lw $t1, -12($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -8($fp)	# tmp$0

    # block (0)
    # move 1234, tmp$3
    li $t0, 1234
    sw $t0, -20($fp)	# tmp$3

    # block (0)
    # move 1234, deref(tmp$0)
    li $t0, 1234
    lw $t1, -8($fp)	# tmp$0
    sw $t0, 0($t1)	# deref(tmp$0)

    # block (0)
    # move 0, tmp$6
    li $t0, 0
    sw $t0, -32($fp)	# tmp$6

    # block (0)
    # move addr(x), tmp$4
    la $t0, _x
    sw $t0, -24($fp)	# tmp$4

    # block (0)
    # move 0, tmp$5
    li $t0, 0
    sw $t0, -28($fp)	# tmp$5

    # block (0)
    # add addr(x), tmp$5, tmp$4
    la $t0, _x
    lw $t1, -28($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$4

    # block (0)
    # move 7, tmp$9
    li $t0, 7
    sw $t0, -44($fp)	# tmp$9

    # block (0)
    # move addr(y), tmp$7
    la $t0, _y
    sw $t0, -36($fp)	# tmp$7

    # block (0)
    # move 28, tmp$8
    li $t0, 28
    sw $t0, -40($fp)	# tmp$8

    # block (0)
    # add addr(y), tmp$8, tmp$7
    la $t0, _y
    lw $t1, -40($fp)	# tmp$8
    add $t2, $t0, $t1
    sw $t2, -36($fp)	# tmp$7

    # block (0)
    # move deref(tmp$7), deref(tmp$4)
    lw $t0, -36($fp)	# tmp$7
    lw $t0, 0($t0)	# deref(tmp$7)
    lw $t1, -24($fp)	# tmp$4
    sw $t0, 0($t1)	# deref(tmp$4)

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$12
    li $t0, 0
    sw $t0, -56($fp)	# tmp$12

    # block (0)
    # move addr(x), tmp$10
    la $t0, _x
    sw $t0, -48($fp)	# tmp$10

    # block (0)
    # move 0, tmp$11
    li $t0, 0
    sw $t0, -52($fp)	# tmp$11

    # block (0)
    # add addr(x), tmp$11, tmp$10
    la $t0, _x
    lw $t1, -52($fp)	# tmp$11
    add $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$10

    # block (0)
    # move deref(tmp$10), u
    lw $t0, -48($fp)	# tmp$10
    lw $t0, 0($t0)	# deref(tmp$10)
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param deref(tmp$10)
    lw $t0, -48($fp)	# tmp$10
    lw $t0, 0($t0)	# deref(tmp$10)
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
_y:  .space 40

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

