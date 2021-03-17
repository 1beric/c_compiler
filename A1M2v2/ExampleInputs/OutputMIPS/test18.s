.text
# function main
# formals: 
# locals: a (loc: -1); b (loc: -2); c (loc: -3); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); tmp$7 (loc: -36); tmp$8 (loc: -40); tmp$9 (loc: -44); tmp$10 (loc: -48); tmp$11 (loc: -52); tmp$12 (loc: -56); 
# space for locals: 56 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -56($sp)   # allocate stack frame

    # no_op 

    # move 2, tmp$0
    li $t0, 2
    sw $t0, -8($fp)	# tmp$0

    # move tmp$0, x
    lw $t0, -8($fp)	# tmp$0
    sw $t0, _x

    # no_op 

    # move 3, tmp$1
    li $t0, 3
    sw $t0, -12($fp)	# tmp$1

    # move tmp$1, y
    lw $t0, -12($fp)	# tmp$1
    sw $t0, _y

    # no_op 

    # move 4, tmp$2
    li $t0, 4
    sw $t0, -16($fp)	# tmp$2

    # move tmp$2, z
    lw $t0, -16($fp)	# tmp$2
    sw $t0, _z

    # no_op 

    # move 97, tmp$4
    li $t0, 97
    sw $t0, -24($fp)	# tmp$4

    # no_op 

    # mul tmp$4, x, tmp$3
    lw $t0, -24($fp)	# tmp$4
    lw $t1, _x
    mul $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$3

    # move tmp$3, a
    lw $t0, -20($fp)	# tmp$3
    sb $t0, -1($fp)	# a

    # no_op 

    # no_op 

    # no_op 

    # no_op 

    # add x, y, tmp$7
    lw $t0, _x
    lw $t1, _y
    add $t2, $t0, $t1
    sw $t2, -36($fp)	# tmp$7

    # div a, tmp$7, tmp$6
    lb $t0, -1($fp)	# a
    lw $t1, -36($fp)	# tmp$7
    div $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$6

    # no_op 

    # mul tmp$6, z, tmp$5
    lw $t0, -32($fp)	# tmp$6
    lw $t1, _z
    mul $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$5

    # move tmp$5, b
    lw $t0, -28($fp)	# tmp$5
    sb $t0, -2($fp)	# b

    # no_op 

    # no_op 

    # no_op 

    # no_op 

    # add x, y, tmp$12
    lw $t0, _x
    lw $t1, _y
    add $t2, $t0, $t1
    sw $t2, -56($fp)	# tmp$12

    # div a, tmp$12, tmp$11
    lb $t0, -1($fp)	# a
    lw $t1, -56($fp)	# tmp$12
    div $t2, $t0, $t1
    sw $t2, -52($fp)	# tmp$11

    # no_op 

    # mul tmp$11, z, tmp$10
    lw $t0, -52($fp)	# tmp$11
    lw $t1, _z
    mul $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$10

    # no_op 

    # sub tmp$10, a, tmp$9
    lw $t0, -48($fp)	# tmp$10
    lb $t1, -1($fp)	# a
    sub $t2, $t0, $t1
    sw $t2, -44($fp)	# tmp$9

    # no_op 

    # add tmp$9, b, tmp$8
    lw $t0, -44($fp)	# tmp$9
    lb $t1, -2($fp)	# b
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$8

    # move tmp$8, c
    lw $t0, -40($fp)	# tmp$8
    sb $t0, -3($fp)	# c

    # no_op 

    # param c
    lb $t0, -3($fp)	# c
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

