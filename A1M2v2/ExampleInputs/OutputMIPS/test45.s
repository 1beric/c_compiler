.text
# function add
# formals: x (loc: 8); 
# locals: tmp$0 (loc: -4); 
# space for locals: 4 bytes
#
_add:
    # enter add
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -4($sp)   # allocate stack frame

    # no_op 

    # no_op 

    # no_op 

    # add x, y, tmp$0
    lw $t0, 8($fp)	# x
    lw $t1, _y
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # move tmp$0, y
    lw $t0, -4($fp)	# tmp$0
    sw $t0, _y

    # leave add

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave add

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function add

.text
# function main
# formals: 
# locals: f (loc: -4); i (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); tmp$7 (loc: -36); tmp$8 (loc: -40); tmp$9 (loc: -44); tmp$10 (loc: -48); tmp$11 (loc: -52); tmp$12 (loc: -56); 
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

    # move 1, tmp$1
    li $t0, 1
    sw $t0, -12($fp)	# tmp$1

    # move tmp$1, f
    lw $t0, -12($fp)	# tmp$1
    sw $t0, -4($fp)	# f

    # no_op 

    # move 7, tmp$2
    li $t0, 7
    sw $t0, -16($fp)	# tmp$2

    # move tmp$2, i
    lw $t0, -16($fp)	# tmp$2
    sw $t0, -8($fp)	# i

    # label 0
Lbl0:

    # no_op 

    # move 0, tmp$3
    li $t0, 0
    sw $t0, -20($fp)	# tmp$3

    # if_gt i, tmp$3, label 1
    lw $t0, -8($fp)	# i
    lw $t1, -20($fp)	# tmp$3
    bgt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # no_op 

    # move i, y
    lw $t0, -8($fp)	# i
    sw $t0, _y

    # move 0, tmp$6
    li $t0, 0
    sw $t0, -32($fp)	# tmp$6

    # param tmp$6
    lw $t0, -32($fp)	# tmp$6
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 1
    jal _add
    la $sp, 4($sp)

    # no_op 

    # move 1, tmp$7
    li $t0, 1
    sw $t0, -36($fp)	# tmp$7

    # param tmp$7
    lw $t0, -36($fp)	# tmp$7
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 1
    jal _add
    la $sp, 4($sp)

    # no_op 

    # move 2, tmp$8
    li $t0, 2
    sw $t0, -40($fp)	# tmp$8

    # param tmp$8
    lw $t0, -40($fp)	# tmp$8
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 1
    jal _add
    la $sp, 4($sp)

    # no_op 

    # move 5, tmp$10
    li $t0, 5
    sw $t0, -48($fp)	# tmp$10

    # uminus tmp$10, tmp$9
    lw $t0, -48($fp)	# tmp$10
    neg $t2, $t0
    sw $t2, -44($fp)	# tmp$9

    # param tmp$9
    lw $t0, -44($fp)	# tmp$9
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 1
    jal _add
    la $sp, 4($sp)

    # no_op 

    # move 2, tmp$11
    li $t0, 2
    sw $t0, -52($fp)	# tmp$11

    # param tmp$11
    lw $t0, -52($fp)	# tmp$11
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 1
    jal _add
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # no_op 

    # no_op 

    # mul f, y, tmp$12
    lw $t0, -4($fp)	# f
    lw $t1, _y
    mul $t2, $t0, $t1
    sw $t2, -56($fp)	# tmp$12

    # move tmp$12, f
    lw $t0, -56($fp)	# tmp$12
    sw $t0, -4($fp)	# f

    # no_op 

    # no_op 

    # move 1, tmp$5
    li $t0, 1
    sw $t0, -28($fp)	# tmp$5

    # sub i, tmp$5, tmp$4
    lw $t0, -8($fp)	# i
    lw $t1, -28($fp)	# tmp$5
    sub $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$4

    # move tmp$4, i
    lw $t0, -24($fp)	# tmp$4
    sw $t0, -8($fp)	# i

    # goto label 0
    j Lbl0

    # label 2
Lbl2:

    # no_op 

    # param f
    lw $t0, -4($fp)	# f
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
_y:  .space 4

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

