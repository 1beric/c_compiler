.text
# function add
# formals: x (loc: 8); y (loc: 12); 
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

    # add x, y, tmp$0
    lw $t0, 8($fp)	# x
    lw $t1, 12($fp)	# y
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # leave add

    # ret tmp$0
    lw $v0, -4($fp)	# tmp$0
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
# locals: a (loc: -4); b (loc: -8); c (loc: -12); d (loc: -16); e (loc: -20); f (loc: -24); i (loc: -28); tmp$1 (loc: -32); tmp$2 (loc: -36); tmp$3 (loc: -40); tmp$4 (loc: -44); tmp$5 (loc: -48); tmp$6 (loc: -52); tmp$7 (loc: -56); tmp$8 (loc: -60); tmp$9 (loc: -64); tmp$10 (loc: -68); tmp$11 (loc: -72); tmp$12 (loc: -76); tmp$13 (loc: -80); tmp$14 (loc: -84); tmp$15 (loc: -88); tmp$16 (loc: -92); tmp$17 (loc: -96); tmp$18 (loc: -100); tmp$19 (loc: -104); 
# space for locals: 104 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -104($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$1
    li $t0, 1
    sw $t0, -32($fp)	# tmp$1

    # move tmp$1, f
    lw $t0, -32($fp)	# tmp$1
    sw $t0, -24($fp)	# f

    # no_op 

    # move 7, tmp$2
    li $t0, 7
    sw $t0, -36($fp)	# tmp$2

    # move tmp$2, i
    lw $t0, -36($fp)	# tmp$2
    sw $t0, -28($fp)	# i

    # label 0
Lbl0:

    # no_op 

    # move 0, tmp$3
    li $t0, 0
    sw $t0, -40($fp)	# tmp$3

    # if_gt i, tmp$3, label 1
    lw $t0, -28($fp)	# i
    lw $t1, -40($fp)	# tmp$3
    bgt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # no_op 

    # move 0, tmp$6
    li $t0, 0
    sw $t0, -52($fp)	# tmp$6

    # param tmp$6
    lw $t0, -52($fp)	# tmp$6
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param i
    lw $t0, -28($fp)	# i
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 2
    jal _add
    la $sp, 8($sp)

    # retrieve tmp$7
    sw $v0, -56($fp)	# tmp$7

    # move tmp$7, a
    lw $t0, -56($fp)	# tmp$7
    sw $t0, -4($fp)	# a

    # no_op 

    # no_op 

    # move 1, tmp$8
    li $t0, 1
    sw $t0, -60($fp)	# tmp$8

    # param tmp$8
    lw $t0, -60($fp)	# tmp$8
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param a
    lw $t0, -4($fp)	# a
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 2
    jal _add
    la $sp, 8($sp)

    # retrieve tmp$9
    sw $v0, -64($fp)	# tmp$9

    # move tmp$9, b
    lw $t0, -64($fp)	# tmp$9
    sw $t0, -8($fp)	# b

    # no_op 

    # move 2, tmp$10
    li $t0, 2
    sw $t0, -68($fp)	# tmp$10

    # no_op 

    # param b
    lw $t0, -8($fp)	# b
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param tmp$10
    lw $t0, -68($fp)	# tmp$10
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 2
    jal _add
    la $sp, 8($sp)

    # retrieve tmp$11
    sw $v0, -72($fp)	# tmp$11

    # move tmp$11, c
    lw $t0, -72($fp)	# tmp$11
    sw $t0, -12($fp)	# c

    # no_op 

    # no_op 

    # move 5, tmp$13
    li $t0, 5
    sw $t0, -80($fp)	# tmp$13

    # uminus tmp$13, tmp$12
    lw $t0, -80($fp)	# tmp$13
    neg $t2, $t0
    sw $t2, -76($fp)	# tmp$12

    # param tmp$12
    lw $t0, -76($fp)	# tmp$12
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param c
    lw $t0, -12($fp)	# c
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 2
    jal _add
    la $sp, 8($sp)

    # retrieve tmp$14
    sw $v0, -84($fp)	# tmp$14

    # move tmp$14, d
    lw $t0, -84($fp)	# tmp$14
    sw $t0, -16($fp)	# d

    # no_op 

    # no_op 

    # move 1, tmp$15
    li $t0, 1
    sw $t0, -88($fp)	# tmp$15

    # param tmp$15
    lw $t0, -88($fp)	# tmp$15
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param d
    lw $t0, -16($fp)	# d
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 2
    jal _add
    la $sp, 8($sp)

    # retrieve tmp$16
    sw $v0, -92($fp)	# tmp$16

    # move tmp$16, e
    lw $t0, -92($fp)	# tmp$16
    sw $t0, -20($fp)	# e

    # no_op 

    # no_op 

    # no_op 

    # move 1, tmp$18
    li $t0, 1
    sw $t0, -100($fp)	# tmp$18

    # param tmp$18
    lw $t0, -100($fp)	# tmp$18
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param e
    lw $t0, -20($fp)	# e
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call add, 2
    jal _add
    la $sp, 8($sp)

    # retrieve tmp$19
    sw $v0, -104($fp)	# tmp$19

    # mul f, tmp$19, tmp$17
    lw $t0, -24($fp)	# f
    lw $t1, -104($fp)	# tmp$19
    mul $t2, $t0, $t1
    sw $t2, -96($fp)	# tmp$17

    # move tmp$17, f
    lw $t0, -96($fp)	# tmp$17
    sw $t0, -24($fp)	# f

    # no_op 

    # no_op 

    # move 1, tmp$5
    li $t0, 1
    sw $t0, -48($fp)	# tmp$5

    # sub i, tmp$5, tmp$4
    lw $t0, -28($fp)	# i
    lw $t1, -48($fp)	# tmp$5
    sub $t2, $t0, $t1
    sw $t2, -44($fp)	# tmp$4

    # move tmp$4, i
    lw $t0, -44($fp)	# tmp$4
    sw $t0, -28($fp)	# i

    # goto label 0
    j Lbl0

    # label 2
Lbl2:

    # no_op 

    # param f
    lw $t0, -24($fp)	# f
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

