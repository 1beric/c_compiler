.text
# function add
# formals: x (loc: 8); y (loc: 12); 
# locals: tmp$0 (loc: -4); 
# space for locals: 4 bytes
#
_add:
    # -LEADER- block (0)
    # enter add
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -4($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # add x, y, tmp$0
    lw $t0, 8($fp)	# x
    lw $t1, 12($fp)	# y
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # block (0)
    # leave add

    # block (0)
    # ret tmp$0
    lw $v0, -4($fp)	# tmp$0
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (0)
    # leave add

    # block (0)
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
    # -LEADER- block (1)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -104($sp)   # allocate stack frame

    # block (1)
    # no_op 

    # block (1)
    # move 1, tmp$1
    li $t0, 1
    sw $t0, -32($fp)	# tmp$1

    # block (1)
    # move 1, f
    li $t0, 1
    sw $t0, -24($fp)	# f

    # block (1)
    # no_op 

    # block (1)
    # move 7, tmp$2
    li $t0, 7
    sw $t0, -36($fp)	# tmp$2

    # block (1)
    # move 7, i
    li $t0, 7
    sw $t0, -28($fp)	# i

    # -LEADER- block (2)
    # label 0
Lbl0:

    # block (2)
    # no_op 

    # block (2)
    # move 0, tmp$3
    li $t0, 0
    sw $t0, -40($fp)	# tmp$3

    # block (2)
    # if_le i, 0, label 2
    lw $t0, -28($fp)	# i
    li $t1, 0
    ble $t0, $t1, Lbl2

    # -LEADER- block (3)
    # label 1
Lbl1:

    # block (3)
    # no_op 

    # block (3)
    # no_op 

    # block (3)
    # move 1, tmp$7
    li $t0, 1
    sw $t0, -56($fp)	# tmp$7

    # block (3)
    # move 2, tmp$8
    li $t0, 2
    sw $t0, -60($fp)	# tmp$8

    # block (3)
    # no_op 

    # block (3)
    # move 0, tmp$9
    li $t0, 0
    sw $t0, -64($fp)	# tmp$9

    # block (3)
    # param 0
    li $t0, 0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # param i
    lw $t0, -28($fp)	# i
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # call add, 2
    jal _add
    la $sp, 8($sp)

    # block (3)
    # retrieve tmp$10
    sw $v0, -68($fp)	# tmp$10

    # block (3)
    # move 1, tmp$11
    li $t0, 1
    sw $t0, -72($fp)	# tmp$11

    # block (3)
    # param 1
    li $t0, 1
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # param tmp$10
    lw $t0, -68($fp)	# tmp$10
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # call add, 2
    jal _add
    la $sp, 8($sp)

    # block (3)
    # retrieve tmp$12
    sw $v0, -76($fp)	# tmp$12

    # block (3)
    # param tmp$12
    lw $t0, -76($fp)	# tmp$12
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # param 2
    li $t0, 2
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # call add, 2
    jal _add
    la $sp, 8($sp)

    # block (3)
    # retrieve tmp$13
    sw $v0, -80($fp)	# tmp$13

    # block (3)
    # move 5, tmp$15
    li $t0, 5
    sw $t0, -88($fp)	# tmp$15

    # block (3)
    # uminus 5, tmp$14
    li $t0, 5
    neg $t2, $t0
    sw $t2, -84($fp)	# tmp$14

    # block (3)
    # param tmp$14
    lw $t0, -84($fp)	# tmp$14
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # param tmp$13
    lw $t0, -80($fp)	# tmp$13
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # call add, 2
    jal _add
    la $sp, 8($sp)

    # block (3)
    # retrieve tmp$16
    sw $v0, -92($fp)	# tmp$16

    # block (3)
    # param tmp$16
    lw $t0, -92($fp)	# tmp$16
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # param 1
    li $t0, 1
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # call add, 2
    jal _add
    la $sp, 8($sp)

    # block (3)
    # retrieve tmp$17
    sw $v0, -96($fp)	# tmp$17

    # block (3)
    # move 1, tmp$18
    li $t0, 1
    sw $t0, -100($fp)	# tmp$18

    # block (3)
    # param 1
    li $t0, 1
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # param tmp$17
    lw $t0, -96($fp)	# tmp$17
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # call add, 2
    jal _add
    la $sp, 8($sp)

    # block (3)
    # retrieve tmp$19
    sw $v0, -104($fp)	# tmp$19

    # block (3)
    # mul f, tmp$19, tmp$6
    lw $t0, -24($fp)	# f
    lw $t1, -104($fp)	# tmp$19
    mul $t2, $t0, $t1
    sw $t2, -52($fp)	# tmp$6

    # block (3)
    # move tmp$6, f
    lw $t0, -52($fp)	# tmp$6
    sw $t0, -24($fp)	# f

    # block (3)
    # no_op 

    # block (3)
    # no_op 

    # block (3)
    # move 1, tmp$5
    li $t0, 1
    sw $t0, -48($fp)	# tmp$5

    # block (3)
    # sub i, 1, tmp$4
    lw $t0, -28($fp)	# i
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -44($fp)	# tmp$4

    # block (3)
    # move tmp$4, i
    lw $t0, -44($fp)	# tmp$4
    sw $t0, -28($fp)	# i

    # block (3)
    # goto label 0
    j Lbl0

    # -LEADER- block (4)
    # label 2
Lbl2:

    # block (4)
    # no_op 

    # block (4)
    # param f
    lw $t0, -24($fp)	# f
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (4)
    # no_op 

    # block (4)
    # leave main

    # block (4)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (4)
    # leave main

    # block (4)
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

