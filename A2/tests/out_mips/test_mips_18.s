.text
# function main
# formals: 
# locals: a (loc: -1); b (loc: -2); c (loc: -3); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); tmp$7 (loc: -36); tmp$8 (loc: -40); tmp$9 (loc: -44); tmp$10 (loc: -48); tmp$11 (loc: -52); tmp$12 (loc: -56); tmp$13 (loc: -60); 
# space for locals: 60 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -60($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 2, tmp$0
    li $t0, 2
    sw $t0, -8($fp)	# tmp$0

    # block (0)
    # move 2, x
    li $t0, 2
    sw $t0, _x

    # block (0)
    # no_op 

    # block (0)
    # move 3, tmp$1
    li $t0, 3
    sw $t0, -12($fp)	# tmp$1

    # block (0)
    # move 3, y
    li $t0, 3
    sw $t0, _y

    # block (0)
    # no_op 

    # block (0)
    # move 4, tmp$2
    li $t0, 4
    sw $t0, -16($fp)	# tmp$2

    # block (0)
    # move 4, z
    li $t0, 4
    sw $t0, _z

    # block (0)
    # no_op 

    # block (0)
    # move 97, tmp$4
    li $t0, 97
    sw $t0, -24($fp)	# tmp$4

    # block (0)
    # no_op 

    # block (0)
    # move 194, tmp$3
    li $t0, 194 
    sw $t0, -20($fp)	# tmp$3

    # block (0)
    # move tmp$3, a
    lw $t0, -20($fp)	# tmp$3
    sb $t0, -1($fp)	# a

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 5, tmp$7
    li $t0, 5
    sw $t0, -36($fp)	# tmp$7

    # block (0)
    # div a, tmp$7, tmp$6
    lb $t0, -1($fp)	# a
    lw $t1, -36($fp)	# tmp$7
    div $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$6

    # block (0)
    # no_op 

    # block (0)
    # mul tmp$6, 4, tmp$5
    lw $t0, -32($fp)	# tmp$6
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$5

    # block (0)
    # move tmp$5, b
    lw $t0, -28($fp)	# tmp$5
    sb $t0, -2($fp)	# b

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 5, tmp$12
    li $t0, 5
    sw $t0, -56($fp)	# tmp$12

    # block (0)
    # div a, tmp$12, tmp$11
    lb $t0, -1($fp)	# a
    lw $t1, -56($fp)	# tmp$12
    div $t2, $t0, $t1
    sw $t2, -52($fp)	# tmp$11

    # block (0)
    # no_op 

    # block (0)
    # mul tmp$11, 4, tmp$10
    lw $t0, -52($fp)	# tmp$11
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$10

    # block (0)
    # no_op 

    # block (0)
    # sub tmp$10, a, tmp$9
    lw $t0, -48($fp)	# tmp$10
    lb $t1, -1($fp)	# a
    sub $t2, $t0, $t1
    sw $t2, -44($fp)	# tmp$9

    # block (0)
    # no_op 

    # block (0)
    # add tmp$9, b, tmp$8
    lw $t0, -44($fp)	# tmp$9
    lb $t1, -2($fp)	# b
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$8

    # block (0)
    # move tmp$8, c
    lw $t0, -40($fp)	# tmp$8
    sb $t0, -3($fp)	# c

    # block (0)
    # move 0, tmp$13
    li $t0, 0
    sw $t0, -60($fp)	# tmp$13

    # block (0)
    # param 0
    li $t0, 0
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

