.text
# function main
# formals: 
# locals: u (loc: -4); x (loc: -44); y (loc: -84); tmp$0 (loc: -88); tmp$1 (loc: -92); tmp$2 (loc: -96); tmp$3 (loc: -100); tmp$4 (loc: -104); tmp$5 (loc: -108); tmp$6 (loc: -112); tmp$7 (loc: -116); tmp$8 (loc: -120); tmp$9 (loc: -124); tmp$10 (loc: -128); tmp$20 (loc: -132); tmp$11 (loc: -136); tmp$30 (loc: -140); tmp$21 (loc: -144); tmp$12 (loc: -148); tmp$40 (loc: -152); tmp$31 (loc: -156); tmp$22 (loc: -160); tmp$13 (loc: -164); tmp$41 (loc: -168); tmp$32 (loc: -172); tmp$23 (loc: -176); tmp$14 (loc: -180); tmp$33 (loc: -184); tmp$24 (loc: -188); tmp$15 (loc: -192); tmp$34 (loc: -196); tmp$25 (loc: -200); tmp$16 (loc: -204); tmp$35 (loc: -208); tmp$26 (loc: -212); tmp$17 (loc: -216); tmp$36 (loc: -220); tmp$27 (loc: -224); tmp$18 (loc: -228); tmp$37 (loc: -232); tmp$28 (loc: -236); tmp$19 (loc: -240); tmp$38 (loc: -244); tmp$29 (loc: -248); tmp$39 (loc: -252); 
# space for locals: 252 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -252($sp)   # allocate stack frame

    # move 4, tmp$2
    li $t0, 4
    sw $t0, -96($fp)	# tmp$2

    # move addr(x), tmp$0
    la $t0, -44($fp)	# addr(x)
    sw $t0, -88($fp)	# tmp$0

    # mul tmp$2, 4, tmp$1
    lw $t0, -96($fp)	# tmp$2
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -92($fp)	# tmp$1

    # add tmp$0, tmp$1, tmp$0
    lw $t0, -88($fp)	# tmp$0
    lw $t1, -92($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -88($fp)	# tmp$0

    # move 1111, tmp$3
    li $t0, 1111
    sw $t0, -100($fp)	# tmp$3

    # move tmp$3, deref(tmp$0)
    lw $t0, -100($fp)	# tmp$3
    lw $t1, -88($fp)	# tmp$0
    sw $t0, 0($t1)	# deref(tmp$0)

    # move 5, tmp$6
    li $t0, 5
    sw $t0, -112($fp)	# tmp$6

    # move addr(x), tmp$4
    la $t0, -44($fp)	# addr(x)
    sw $t0, -104($fp)	# tmp$4

    # mul tmp$6, 4, tmp$5
    lw $t0, -112($fp)	# tmp$6
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -108($fp)	# tmp$5

    # add tmp$4, tmp$5, tmp$4
    lw $t0, -104($fp)	# tmp$4
    lw $t1, -108($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -104($fp)	# tmp$4

    # move 2222, tmp$7
    li $t0, 2222
    sw $t0, -116($fp)	# tmp$7

    # move tmp$7, deref(tmp$4)
    lw $t0, -116($fp)	# tmp$7
    lw $t1, -104($fp)	# tmp$4
    sw $t0, 0($t1)	# deref(tmp$4)

    # move 6, tmp$10
    li $t0, 6
    sw $t0, -128($fp)	# tmp$10

    # move addr(x), tmp$8
    la $t0, -44($fp)	# addr(x)
    sw $t0, -120($fp)	# tmp$8

    # mul tmp$10, 4, tmp$9
    lw $t0, -128($fp)	# tmp$10
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -124($fp)	# tmp$9

    # add tmp$8, tmp$9, tmp$8
    lw $t0, -120($fp)	# tmp$8
    lw $t1, -124($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -120($fp)	# tmp$8

    # move 3333, tmp$11
    li $t0, 3333
    sw $t0, -136($fp)	# tmp$11

    # move tmp$11, deref(tmp$8)
    lw $t0, -136($fp)	# tmp$11
    lw $t1, -120($fp)	# tmp$8
    sw $t0, 0($t1)	# deref(tmp$8)

    # move 7, tmp$14
    li $t0, 7
    sw $t0, -180($fp)	# tmp$14

    # move addr(y), tmp$12
    la $t0, -84($fp)	# addr(y)
    sw $t0, -148($fp)	# tmp$12

    # mul tmp$14, 4, tmp$13
    lw $t0, -180($fp)	# tmp$14
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -164($fp)	# tmp$13

    # add tmp$12, tmp$13, tmp$12
    lw $t0, -148($fp)	# tmp$12
    lw $t1, -164($fp)	# tmp$13
    add $t2, $t0, $t1
    sw $t2, -148($fp)	# tmp$12

    # move 4444, tmp$15
    li $t0, 4444
    sw $t0, -192($fp)	# tmp$15

    # move tmp$15, deref(tmp$12)
    lw $t0, -192($fp)	# tmp$15
    lw $t1, -148($fp)	# tmp$12
    sw $t0, 0($t1)	# deref(tmp$12)

    # move 8, tmp$18
    li $t0, 8
    sw $t0, -228($fp)	# tmp$18

    # move addr(y), tmp$16
    la $t0, -84($fp)	# addr(y)
    sw $t0, -204($fp)	# tmp$16

    # mul tmp$18, 4, tmp$17
    lw $t0, -228($fp)	# tmp$18
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -216($fp)	# tmp$17

    # add tmp$16, tmp$17, tmp$16
    lw $t0, -204($fp)	# tmp$16
    lw $t1, -216($fp)	# tmp$17
    add $t2, $t0, $t1
    sw $t2, -204($fp)	# tmp$16

    # move 5555, tmp$19
    li $t0, 5555
    sw $t0, -240($fp)	# tmp$19

    # move tmp$19, deref(tmp$16)
    lw $t0, -240($fp)	# tmp$19
    lw $t1, -204($fp)	# tmp$16
    sw $t0, 0($t1)	# deref(tmp$16)

    # move 9, tmp$22
    li $t0, 9
    sw $t0, -160($fp)	# tmp$22

    # move addr(y), tmp$20
    la $t0, -84($fp)	# addr(y)
    sw $t0, -132($fp)	# tmp$20

    # mul tmp$22, 4, tmp$21
    lw $t0, -160($fp)	# tmp$22
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -144($fp)	# tmp$21

    # add tmp$20, tmp$21, tmp$20
    lw $t0, -132($fp)	# tmp$20
    lw $t1, -144($fp)	# tmp$21
    add $t2, $t0, $t1
    sw $t2, -132($fp)	# tmp$20

    # move 6666, tmp$23
    li $t0, 6666
    sw $t0, -176($fp)	# tmp$23

    # move tmp$23, deref(tmp$20)
    lw $t0, -176($fp)	# tmp$23
    lw $t1, -132($fp)	# tmp$20
    sw $t0, 0($t1)	# deref(tmp$20)

    # no_op 

    # move 4, tmp$26
    li $t0, 4
    sw $t0, -212($fp)	# tmp$26

    # move addr(x), tmp$24
    la $t0, -44($fp)	# addr(x)
    sw $t0, -188($fp)	# tmp$24

    # mul tmp$26, 4, tmp$25
    lw $t0, -212($fp)	# tmp$26
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -200($fp)	# tmp$25

    # add tmp$24, tmp$25, tmp$24
    lw $t0, -188($fp)	# tmp$24
    lw $t1, -200($fp)	# tmp$25
    add $t2, $t0, $t1
    sw $t2, -188($fp)	# tmp$24

    # move deref(tmp$24), u
    lw $t0, -188($fp)	# tmp$24
    lw $t0, 0($t0)	# deref(tmp$24)
    sw $t0, -4($fp)	# u

    # no_op 

    # param u
    lw $t0, -4($fp)	# u
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # move 5, tmp$29
    li $t0, 5
    sw $t0, -248($fp)	# tmp$29

    # move addr(x), tmp$27
    la $t0, -44($fp)	# addr(x)
    sw $t0, -224($fp)	# tmp$27

    # mul tmp$29, 4, tmp$28
    lw $t0, -248($fp)	# tmp$29
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -236($fp)	# tmp$28

    # add tmp$27, tmp$28, tmp$27
    lw $t0, -224($fp)	# tmp$27
    lw $t1, -236($fp)	# tmp$28
    add $t2, $t0, $t1
    sw $t2, -224($fp)	# tmp$27

    # move deref(tmp$27), u
    lw $t0, -224($fp)	# tmp$27
    lw $t0, 0($t0)	# deref(tmp$27)
    sw $t0, -4($fp)	# u

    # no_op 

    # param u
    lw $t0, -4($fp)	# u
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # move 6, tmp$32
    li $t0, 6
    sw $t0, -172($fp)	# tmp$32

    # move addr(x), tmp$30
    la $t0, -44($fp)	# addr(x)
    sw $t0, -140($fp)	# tmp$30

    # mul tmp$32, 4, tmp$31
    lw $t0, -172($fp)	# tmp$32
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -156($fp)	# tmp$31

    # add tmp$30, tmp$31, tmp$30
    lw $t0, -140($fp)	# tmp$30
    lw $t1, -156($fp)	# tmp$31
    add $t2, $t0, $t1
    sw $t2, -140($fp)	# tmp$30

    # move deref(tmp$30), u
    lw $t0, -140($fp)	# tmp$30
    lw $t0, 0($t0)	# deref(tmp$30)
    sw $t0, -4($fp)	# u

    # no_op 

    # param u
    lw $t0, -4($fp)	# u
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # move 7, tmp$35
    li $t0, 7
    sw $t0, -208($fp)	# tmp$35

    # move addr(y), tmp$33
    la $t0, -84($fp)	# addr(y)
    sw $t0, -184($fp)	# tmp$33

    # mul tmp$35, 4, tmp$34
    lw $t0, -208($fp)	# tmp$35
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -196($fp)	# tmp$34

    # add tmp$33, tmp$34, tmp$33
    lw $t0, -184($fp)	# tmp$33
    lw $t1, -196($fp)	# tmp$34
    add $t2, $t0, $t1
    sw $t2, -184($fp)	# tmp$33

    # move deref(tmp$33), u
    lw $t0, -184($fp)	# tmp$33
    lw $t0, 0($t0)	# deref(tmp$33)
    sw $t0, -4($fp)	# u

    # no_op 

    # param u
    lw $t0, -4($fp)	# u
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # move 8, tmp$38
    li $t0, 8
    sw $t0, -244($fp)	# tmp$38

    # move addr(y), tmp$36
    la $t0, -84($fp)	# addr(y)
    sw $t0, -220($fp)	# tmp$36

    # mul tmp$38, 4, tmp$37
    lw $t0, -244($fp)	# tmp$38
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -232($fp)	# tmp$37

    # add tmp$36, tmp$37, tmp$36
    lw $t0, -220($fp)	# tmp$36
    lw $t1, -232($fp)	# tmp$37
    add $t2, $t0, $t1
    sw $t2, -220($fp)	# tmp$36

    # move deref(tmp$36), u
    lw $t0, -220($fp)	# tmp$36
    lw $t0, 0($t0)	# deref(tmp$36)
    sw $t0, -4($fp)	# u

    # no_op 

    # param u
    lw $t0, -4($fp)	# u
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call println, 1
    jal _println
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # move 9, tmp$41
    li $t0, 9
    sw $t0, -168($fp)	# tmp$41

    # move addr(y), tmp$39
    la $t0, -84($fp)	# addr(y)
    sw $t0, -252($fp)	# tmp$39

    # mul tmp$41, 4, tmp$40
    lw $t0, -168($fp)	# tmp$41
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -152($fp)	# tmp$40

    # add tmp$39, tmp$40, tmp$39
    lw $t0, -252($fp)	# tmp$39
    lw $t1, -152($fp)	# tmp$40
    add $t2, $t0, $t1
    sw $t2, -252($fp)	# tmp$39

    # move deref(tmp$39), u
    lw $t0, -252($fp)	# tmp$39
    lw $t0, 0($t0)	# deref(tmp$39)
    sw $t0, -4($fp)	# u

    # no_op 

    # param u
    lw $t0, -4($fp)	# u
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

