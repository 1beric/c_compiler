.text
# function id
# formals: x (loc: 8); 
# locals: 
# space for locals: 0 bytes
#
_id:
    # -LEADER- block (0)
    # enter id
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -0($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # leave id

    # block (0)
    # ret x
    lw $v0, 8($fp)	# x
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (0)
    # leave id

    # block (0)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function id

.text
# function main
# formals: 
# locals: i (loc: -4); x (loc: -8); tmp$0 (loc: -12); tmp$1 (loc: -16); tmp$2 (loc: -20); tmp$3 (loc: -24); tmp$4 (loc: -28); tmp$5 (loc: -32); tmp$6 (loc: -36); tmp$7 (loc: -40); tmp$8 (loc: -44); tmp$9 (loc: -48); tmp$10 (loc: -52); tmp$20 (loc: -56); tmp$11 (loc: -60); tmp$21 (loc: -64); tmp$12 (loc: -68); tmp$22 (loc: -72); tmp$13 (loc: -76); tmp$23 (loc: -80); tmp$14 (loc: -84); tmp$24 (loc: -88); tmp$15 (loc: -92); tmp$25 (loc: -96); tmp$16 (loc: -100); tmp$26 (loc: -104); tmp$17 (loc: -108); tmp$27 (loc: -112); tmp$18 (loc: -116); tmp$19 (loc: -120); 
# space for locals: 120 bytes
#
_main:
    # -LEADER- block (1)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -120($sp)   # allocate stack frame

    # block (1)
    # no_op 

    # block (1)
    # move 123, tmp$0
    li $t0, 123
    sw $t0, -12($fp)	# tmp$0

    # block (1)
    # move 123, x
    li $t0, 123
    sw $t0, -8($fp)	# x

    # block (1)
    # move 3, tmp$1
    li $t0, 3
    sw $t0, -16($fp)	# tmp$1

    # block (1)
    # param 3
    li $t0, 3
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (1)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (1)
    # retrieve tmp$2
    sw $v0, -20($fp)	# tmp$2

    # block (1)
    # param tmp$2
    lw $t0, -20($fp)	# tmp$2
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (1)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (1)
    # retrieve tmp$3
    sw $v0, -24($fp)	# tmp$3

    # block (1)
    # move 4, tmp$4
    li $t0, 4
    sw $t0, -28($fp)	# tmp$4

    # block (1)
    # param 4
    li $t0, 4
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (1)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (1)
    # retrieve tmp$5
    sw $v0, -32($fp)	# tmp$5

    # block (1)
    # param tmp$5
    lw $t0, -32($fp)	# tmp$5
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (1)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (1)
    # retrieve tmp$6
    sw $v0, -36($fp)	# tmp$6

    # block (1)
    # param tmp$6
    lw $t0, -36($fp)	# tmp$6
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (1)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (1)
    # retrieve tmp$7
    sw $v0, -40($fp)	# tmp$7

    # block (1)
    # if_le tmp$3, tmp$7, label 1
    lw $t0, -24($fp)	# tmp$3
    lw $t1, -40($fp)	# tmp$7
    ble $t0, $t1, Lbl1

    # -LEADER- block (2)
    # label 0
Lbl0:

    # block (2)
    # no_op 

    # block (2)
    # move 321, tmp$8
    li $t0, 321
    sw $t0, -44($fp)	# tmp$8

    # block (2)
    # move 321, x
    li $t0, 321
    sw $t0, -8($fp)	# x

    # block (2)
    # goto label 2
    j Lbl2

    # -LEADER- block (3)
    # label 1
Lbl1:

    # -LEADER- block (4)
    # label 2
Lbl2:

    # block (4)
    # no_op 

    # block (4)
    # move 12, tmp$9
    li $t0, 12
    sw $t0, -48($fp)	# tmp$9

    # block (4)
    # move 12, i
    li $t0, 12
    sw $t0, -4($fp)	# i

    # -LEADER- block (5)
    # label 3
Lbl3:

    # block (5)
    # no_op 

    # block (5)
    # param i
    lw $t0, -4($fp)	# i
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (5)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (5)
    # retrieve tmp$10
    sw $v0, -52($fp)	# tmp$10

    # block (5)
    # param tmp$10
    lw $t0, -52($fp)	# tmp$10
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (5)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (5)
    # retrieve tmp$11
    sw $v0, -60($fp)	# tmp$11

    # block (5)
    # param tmp$11
    lw $t0, -60($fp)	# tmp$11
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (5)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (5)
    # retrieve tmp$12
    sw $v0, -68($fp)	# tmp$12

    # block (5)
    # move 0, tmp$13
    li $t0, 0
    sw $t0, -76($fp)	# tmp$13

    # block (5)
    # if_le tmp$12, 0, label 5
    lw $t0, -68($fp)	# tmp$12
    li $t1, 0
    ble $t0, $t1, Lbl5

    # -LEADER- block (6)
    # label 4
Lbl4:

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # move 1, tmp$15
    li $t0, 1
    sw $t0, -92($fp)	# tmp$15

    # block (6)
    # sub x, 1, tmp$14
    lw $t0, -8($fp)	# x
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -84($fp)	# tmp$14

    # block (6)
    # move tmp$14, x
    lw $t0, -84($fp)	# tmp$14
    sw $t0, -8($fp)	# x

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # move 1, tmp$17
    li $t0, 1
    sw $t0, -108($fp)	# tmp$17

    # block (6)
    # sub i, 1, tmp$16
    lw $t0, -4($fp)	# i
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -100($fp)	# tmp$16

    # block (6)
    # move tmp$16, i
    lw $t0, -100($fp)	# tmp$16
    sw $t0, -4($fp)	# i

    # block (6)
    # goto label 3
    j Lbl3

    # -LEADER- block (7)
    # label 5
Lbl5:

    # block (7)
    # no_op 

    # block (7)
    # move 0, tmp$18
    li $t0, 0
    sw $t0, -116($fp)	# tmp$18

    # block (7)
    # param 0
    li $t0, 0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (7)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (7)
    # retrieve tmp$19
    sw $v0, -120($fp)	# tmp$19

    # block (7)
    # move tmp$19, i
    lw $t0, -120($fp)	# tmp$19
    sw $t0, -4($fp)	# i

    # -LEADER- block (8)
    # label 6
Lbl6:

    # block (8)
    # no_op 

    # block (8)
    # param i
    lw $t0, -4($fp)	# i
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (8)
    # retrieve tmp$20
    sw $v0, -56($fp)	# tmp$20

    # block (8)
    # param tmp$20
    lw $t0, -56($fp)	# tmp$20
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (8)
    # retrieve tmp$21
    sw $v0, -64($fp)	# tmp$21

    # block (8)
    # move 6, tmp$22
    li $t0, 6
    sw $t0, -72($fp)	# tmp$22

    # block (8)
    # if_ge tmp$21, 6, label 8
    lw $t0, -64($fp)	# tmp$21
    li $t1, 6
    bge $t0, $t1, Lbl8

    # -LEADER- block (9)
    # label 7
Lbl7:

    # block (9)
    # no_op 

    # block (9)
    # no_op 

    # block (9)
    # move 2, tmp$27
    li $t0, 2
    sw $t0, -112($fp)	# tmp$27

    # block (9)
    # add x, 2, tmp$26
    lw $t0, -8($fp)	# x
    li $t1, 2
    add $t2, $t0, $t1
    sw $t2, -104($fp)	# tmp$26

    # block (9)
    # move tmp$26, x
    lw $t0, -104($fp)	# tmp$26
    sw $t0, -8($fp)	# x

    # block (9)
    # no_op 

    # block (9)
    # no_op 

    # block (9)
    # param i
    lw $t0, -4($fp)	# i
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (9)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (9)
    # retrieve tmp$24
    sw $v0, -88($fp)	# tmp$24

    # block (9)
    # move 1, tmp$25
    li $t0, 1
    sw $t0, -96($fp)	# tmp$25

    # block (9)
    # add tmp$24, 1, tmp$23
    lw $t0, -88($fp)	# tmp$24
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -80($fp)	# tmp$23

    # block (9)
    # move tmp$23, i
    lw $t0, -80($fp)	# tmp$23
    sw $t0, -4($fp)	# i

    # block (9)
    # goto label 6
    j Lbl6

    # -LEADER- block (10)
    # label 8
Lbl8:

    # block (10)
    # no_op 

    # block (10)
    # param x
    lw $t0, -8($fp)	# x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (10)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (10)
    # no_op 

    # block (10)
    # leave main

    # block (10)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (10)
    # leave main

    # block (10)
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

