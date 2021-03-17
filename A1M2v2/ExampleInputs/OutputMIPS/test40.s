.text
# function f
# formals: i (loc: 8); 
# locals: y (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); 
# space for locals: 32 bytes
#
_f:
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -32($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$0
    li $t0, 1
    sw $t0, -8($fp)	# tmp$0

    # move tmp$0, y
    lw $t0, -8($fp)	# tmp$0
    sw $t0, -4($fp)	# y

    # label 0
Lbl0:

    # no_op 

    # move 0, tmp$1
    li $t0, 0
    sw $t0, -12($fp)	# tmp$1

    # if_gt i, tmp$1, label 1
    lw $t0, 8($fp)	# i
    lw $t1, -12($fp)	# tmp$1
    bgt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # no_op 

    # no_op 

    # mul x, i, tmp$2
    lw $t0, _x
    lw $t1, 8($fp)	# i
    mul $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$2

    # move tmp$2, x
    lw $t0, -16($fp)	# tmp$2
    sw $t0, _x

    # no_op 

    # move 2, tmp$4
    li $t0, 2
    sw $t0, -24($fp)	# tmp$4

    # no_op 

    # mul tmp$4, y, tmp$3
    lw $t0, -24($fp)	# tmp$4
    lw $t1, -4($fp)	# y
    mul $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$3

    # move tmp$3, y
    lw $t0, -20($fp)	# tmp$3
    sw $t0, -4($fp)	# y

    # no_op 

    # no_op 

    # move 1, tmp$6
    li $t0, 1
    sw $t0, -32($fp)	# tmp$6

    # sub i, tmp$6, tmp$5
    lw $t0, 8($fp)	# i
    lw $t1, -32($fp)	# tmp$6
    sub $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$5

    # move tmp$5, i
    lw $t0, -28($fp)	# tmp$5
    sw $t0, 8($fp)	# i

    # goto label 0
    j Lbl0

    # label 2
Lbl2:

    # no_op 

    # leave f

    # ret y
    lw $v0, -4($fp)	# y
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave f

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
# locals: a (loc: -4); tmp$7 (loc: -8); tmp$8 (loc: -12); tmp$9 (loc: -16); tmp$10 (loc: -20); 
# space for locals: 20 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -20($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$7
    li $t0, 1
    sw $t0, -8($fp)	# tmp$7

    # move tmp$7, x
    lw $t0, -8($fp)	# tmp$7
    sw $t0, _x

    # no_op 

    # move 6, tmp$8
    li $t0, 6
    sw $t0, -12($fp)	# tmp$8

    # param tmp$8
    lw $t0, -12($fp)	# tmp$8
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 1
    jal _f
    la $sp, 4($sp)

    # retrieve tmp$9
    sw $v0, -16($fp)	# tmp$9

    # move tmp$9, a
    lw $t0, -16($fp)	# tmp$9
    sw $t0, -4($fp)	# a

    # no_op 

    # no_op 

    # no_op 

    # add a, x, tmp$10
    lw $t0, -4($fp)	# a
    lw $t1, _x
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$10

    # move tmp$10, x
    lw $t0, -20($fp)	# tmp$10
    sw $t0, _x

    # no_op 

    # param x
    lw $t0, _x
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

