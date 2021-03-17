.text
# function main
# formals: 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -36); tmp$9 (loc: -40); tmp$10 (loc: -44); tmp$20 (loc: -48); tmp$11 (loc: -52); tmp$30 (loc: -56); tmp$21 (loc: -60); tmp$12 (loc: -64); tmp$40 (loc: -68); tmp$31 (loc: -72); tmp$22 (loc: -76); tmp$13 (loc: -80); tmp$50 (loc: -84); tmp$41 (loc: -88); tmp$32 (loc: -92); tmp$23 (loc: -96); tmp$14 (loc: -100); tmp$51 (loc: -104); tmp$42 (loc: -108); tmp$33 (loc: -112); tmp$24 (loc: -116); tmp$15 (loc: -120); tmp$52 (loc: -124); tmp$43 (loc: -128); tmp$34 (loc: -132); tmp$25 (loc: -136); tmp$16 (loc: -140); tmp$53 (loc: -144); tmp$44 (loc: -148); tmp$35 (loc: -152); tmp$26 (loc: -156); tmp$17 (loc: -160); tmp$54 (loc: -164); tmp$45 (loc: -168); tmp$36 (loc: -172); tmp$27 (loc: -176); tmp$18 (loc: -180); tmp$55 (loc: -184); tmp$46 (loc: -188); tmp$37 (loc: -192); tmp$28 (loc: -196); tmp$19 (loc: -200); tmp$56 (loc: -204); tmp$47 (loc: -208); tmp$38 (loc: -212); tmp$29 (loc: -216); tmp$57 (loc: -220); tmp$48 (loc: -224); tmp$39 (loc: -228); tmp$58 (loc: -232); tmp$49 (loc: -236); tmp$59 (loc: -240); 
# space for locals: 240 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -240($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$0
    li $t0, 0
    sw $t0, -4($fp)	# tmp$0

    # move tmp$0, i
    lw $t0, -4($fp)	# tmp$0
    sw $t0, _i

    # label 0
Lbl0:

    # no_op 

    # move 5, tmp$1
    li $t0, 5
    sw $t0, -8($fp)	# tmp$1

    # if_lt i, tmp$1, label 1
    lw $t0, _i
    lw $t1, -8($fp)	# tmp$1
    blt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move addr(x), tmp$2
    la $t0, _x
    sw $t0, -12($fp)	# tmp$2

    # mul i, 4, tmp$3
    lw $t0, _i
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$3

    # add tmp$2, tmp$3, tmp$2
    lw $t0, -12($fp)	# tmp$2
    lw $t1, -16($fp)	# tmp$3
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$2

    # no_op 

    # move i, deref(tmp$2)
    lw $t0, _i
    lw $t1, -12($fp)	# tmp$2
    sw $t0, 0($t1)	# deref(tmp$2)

    # no_op 

    # no_op 

    # move 1, tmp$5
    li $t0, 1
    sw $t0, -24($fp)	# tmp$5

    # add i, tmp$5, tmp$4
    lw $t0, _i
    lw $t1, -24($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$4

    # move tmp$4, i
    lw $t0, -20($fp)	# tmp$4
    sw $t0, _i

    # goto label 0
    j Lbl0

    # label 2
Lbl2:

    # no_op 

    # move 123, tmp$6
    li $t0, 123
    sw $t0, -28($fp)	# tmp$6

    # move tmp$6, res
    lw $t0, -28($fp)	# tmp$6
    sw $t0, _res

    # label 3
Lbl3:

    # no_op 

    # move 5, tmp$10
    li $t0, 5
    sw $t0, -44($fp)	# tmp$10

    # div i, tmp$10, tmp$9
    lw $t0, _i
    lw $t1, -44($fp)	# tmp$10
    div $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$9

    # move addr(x), tmp$7
    la $t0, _x
    sw $t0, -32($fp)	# tmp$7

    # mul tmp$9, 4, tmp$8
    lw $t0, -40($fp)	# tmp$9
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -36($fp)	# tmp$8

    # add tmp$7, tmp$8, tmp$7
    lw $t0, -32($fp)	# tmp$7
    lw $t1, -36($fp)	# tmp$8
    add $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$7

    # move deref(tmp$7), tmp$11
    lw $t0, -32($fp)	# tmp$7
    lw $t0, 0($t0)	# deref(tmp$7)
    sw $t0, -52($fp)	# tmp$11

    # no_op 

    # move 4, tmp$15
    li $t0, 4
    sw $t0, -120($fp)	# tmp$15

    # div i, tmp$15, tmp$14
    lw $t0, _i
    lw $t1, -120($fp)	# tmp$15
    div $t2, $t0, $t1
    sw $t2, -100($fp)	# tmp$14

    # move addr(x), tmp$12
    la $t0, _x
    sw $t0, -64($fp)	# tmp$12

    # mul tmp$14, 4, tmp$13
    lw $t0, -100($fp)	# tmp$14
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -80($fp)	# tmp$13

    # add tmp$12, tmp$13, tmp$12
    lw $t0, -64($fp)	# tmp$12
    lw $t1, -80($fp)	# tmp$13
    add $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$12

    # move deref(tmp$12), tmp$16
    lw $t0, -64($fp)	# tmp$12
    lw $t0, 0($t0)	# deref(tmp$12)
    sw $t0, -140($fp)	# tmp$16

    # if_le tmp$11, tmp$16, label 7
    lw $t0, -52($fp)	# tmp$11
    lw $t1, -140($fp)	# tmp$16
    ble $t0, $t1, Lbl7

    # goto label 4
    j Lbl4

    # label 7
Lbl7:

    # no_op 

    # move 4, tmp$20
    li $t0, 4
    sw $t0, -48($fp)	# tmp$20

    # div i, tmp$20, tmp$19
    lw $t0, _i
    lw $t1, -48($fp)	# tmp$20
    div $t2, $t0, $t1
    sw $t2, -200($fp)	# tmp$19

    # move addr(x), tmp$17
    la $t0, _x
    sw $t0, -160($fp)	# tmp$17

    # mul tmp$19, 4, tmp$18
    lw $t0, -200($fp)	# tmp$19
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -180($fp)	# tmp$18

    # add tmp$17, tmp$18, tmp$17
    lw $t0, -160($fp)	# tmp$17
    lw $t1, -180($fp)	# tmp$18
    add $t2, $t0, $t1
    sw $t2, -160($fp)	# tmp$17

    # move deref(tmp$17), tmp$21
    lw $t0, -160($fp)	# tmp$17
    lw $t0, 0($t0)	# deref(tmp$17)
    sw $t0, -60($fp)	# tmp$21

    # no_op 

    # move 3, tmp$25
    li $t0, 3
    sw $t0, -136($fp)	# tmp$25

    # div i, tmp$25, tmp$24
    lw $t0, _i
    lw $t1, -136($fp)	# tmp$25
    div $t2, $t0, $t1
    sw $t2, -116($fp)	# tmp$24

    # move addr(x), tmp$22
    la $t0, _x
    sw $t0, -76($fp)	# tmp$22

    # mul tmp$24, 4, tmp$23
    lw $t0, -116($fp)	# tmp$24
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -96($fp)	# tmp$23

    # add tmp$22, tmp$23, tmp$22
    lw $t0, -76($fp)	# tmp$22
    lw $t1, -96($fp)	# tmp$23
    add $t2, $t0, $t1
    sw $t2, -76($fp)	# tmp$22

    # move deref(tmp$22), tmp$26
    lw $t0, -76($fp)	# tmp$22
    lw $t0, 0($t0)	# deref(tmp$22)
    sw $t0, -156($fp)	# tmp$26

    # if_le tmp$21, tmp$26, label 6
    lw $t0, -60($fp)	# tmp$21
    lw $t1, -156($fp)	# tmp$26
    ble $t0, $t1, Lbl6

    # goto label 4
    j Lbl4

    # label 6
Lbl6:

    # no_op 

    # move 2, tmp$30
    li $t0, 2
    sw $t0, -56($fp)	# tmp$30

    # div i, tmp$30, tmp$29
    lw $t0, _i
    lw $t1, -56($fp)	# tmp$30
    div $t2, $t0, $t1
    sw $t2, -216($fp)	# tmp$29

    # move addr(x), tmp$27
    la $t0, _x
    sw $t0, -176($fp)	# tmp$27

    # mul tmp$29, 4, tmp$28
    lw $t0, -216($fp)	# tmp$29
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -196($fp)	# tmp$28

    # add tmp$27, tmp$28, tmp$27
    lw $t0, -176($fp)	# tmp$27
    lw $t1, -196($fp)	# tmp$28
    add $t2, $t0, $t1
    sw $t2, -176($fp)	# tmp$27

    # move deref(tmp$27), tmp$31
    lw $t0, -176($fp)	# tmp$27
    lw $t0, 0($t0)	# deref(tmp$27)
    sw $t0, -72($fp)	# tmp$31

    # no_op 

    # move 3, tmp$35
    li $t0, 3
    sw $t0, -152($fp)	# tmp$35

    # div i, tmp$35, tmp$34
    lw $t0, _i
    lw $t1, -152($fp)	# tmp$35
    div $t2, $t0, $t1
    sw $t2, -132($fp)	# tmp$34

    # move addr(x), tmp$32
    la $t0, _x
    sw $t0, -92($fp)	# tmp$32

    # mul tmp$34, 4, tmp$33
    lw $t0, -132($fp)	# tmp$34
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -112($fp)	# tmp$33

    # add tmp$32, tmp$33, tmp$32
    lw $t0, -92($fp)	# tmp$32
    lw $t1, -112($fp)	# tmp$33
    add $t2, $t0, $t1
    sw $t2, -92($fp)	# tmp$32

    # move deref(tmp$32), tmp$36
    lw $t0, -92($fp)	# tmp$32
    lw $t0, 0($t0)	# deref(tmp$32)
    sw $t0, -172($fp)	# tmp$36

    # if_gt tmp$31, tmp$36, label 4
    lw $t0, -72($fp)	# tmp$31
    lw $t1, -172($fp)	# tmp$36
    bgt $t0, $t1, Lbl4

    # goto label 9
    j Lbl9

    # label 9
Lbl9:

    # no_op 

    # move 3, tmp$40
    li $t0, 3
    sw $t0, -68($fp)	# tmp$40

    # div i, tmp$40, tmp$39
    lw $t0, _i
    lw $t1, -68($fp)	# tmp$40
    div $t2, $t0, $t1
    sw $t2, -228($fp)	# tmp$39

    # move addr(x), tmp$37
    la $t0, _x
    sw $t0, -192($fp)	# tmp$37

    # mul tmp$39, 4, tmp$38
    lw $t0, -228($fp)	# tmp$39
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -212($fp)	# tmp$38

    # add tmp$37, tmp$38, tmp$37
    lw $t0, -192($fp)	# tmp$37
    lw $t1, -212($fp)	# tmp$38
    add $t2, $t0, $t1
    sw $t2, -192($fp)	# tmp$37

    # move deref(tmp$37), tmp$41
    lw $t0, -192($fp)	# tmp$37
    lw $t0, 0($t0)	# deref(tmp$37)
    sw $t0, -88($fp)	# tmp$41

    # no_op 

    # move 4, tmp$45
    li $t0, 4
    sw $t0, -168($fp)	# tmp$45

    # div i, tmp$45, tmp$44
    lw $t0, _i
    lw $t1, -168($fp)	# tmp$45
    div $t2, $t0, $t1
    sw $t2, -148($fp)	# tmp$44

    # move addr(x), tmp$42
    la $t0, _x
    sw $t0, -108($fp)	# tmp$42

    # mul tmp$44, 4, tmp$43
    lw $t0, -148($fp)	# tmp$44
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -128($fp)	# tmp$43

    # add tmp$42, tmp$43, tmp$42
    lw $t0, -108($fp)	# tmp$42
    lw $t1, -128($fp)	# tmp$43
    add $t2, $t0, $t1
    sw $t2, -108($fp)	# tmp$42

    # move deref(tmp$42), tmp$46
    lw $t0, -108($fp)	# tmp$42
    lw $t0, 0($t0)	# deref(tmp$42)
    sw $t0, -188($fp)	# tmp$46

    # if_gt tmp$41, tmp$46, label 4
    lw $t0, -88($fp)	# tmp$41
    lw $t1, -188($fp)	# tmp$46
    bgt $t0, $t1, Lbl4

    # goto label 8
    j Lbl8

    # label 8
Lbl8:

    # no_op 

    # move 4, tmp$50
    li $t0, 4
    sw $t0, -84($fp)	# tmp$50

    # div i, tmp$50, tmp$49
    lw $t0, _i
    lw $t1, -84($fp)	# tmp$50
    div $t2, $t0, $t1
    sw $t2, -236($fp)	# tmp$49

    # move addr(x), tmp$47
    la $t0, _x
    sw $t0, -208($fp)	# tmp$47

    # mul tmp$49, 4, tmp$48
    lw $t0, -236($fp)	# tmp$49
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -224($fp)	# tmp$48

    # add tmp$47, tmp$48, tmp$47
    lw $t0, -208($fp)	# tmp$47
    lw $t1, -224($fp)	# tmp$48
    add $t2, $t0, $t1
    sw $t2, -208($fp)	# tmp$47

    # move deref(tmp$47), tmp$51
    lw $t0, -208($fp)	# tmp$47
    lw $t0, 0($t0)	# deref(tmp$47)
    sw $t0, -104($fp)	# tmp$51

    # no_op 

    # move 5, tmp$55
    li $t0, 5
    sw $t0, -184($fp)	# tmp$55

    # div i, tmp$55, tmp$54
    lw $t0, _i
    lw $t1, -184($fp)	# tmp$55
    div $t2, $t0, $t1
    sw $t2, -164($fp)	# tmp$54

    # move addr(x), tmp$52
    la $t0, _x
    sw $t0, -124($fp)	# tmp$52

    # mul tmp$54, 4, tmp$53
    lw $t0, -164($fp)	# tmp$54
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -144($fp)	# tmp$53

    # add tmp$52, tmp$53, tmp$52
    lw $t0, -124($fp)	# tmp$52
    lw $t1, -144($fp)	# tmp$53
    add $t2, $t0, $t1
    sw $t2, -124($fp)	# tmp$52

    # move deref(tmp$52), tmp$56
    lw $t0, -124($fp)	# tmp$52
    lw $t0, 0($t0)	# deref(tmp$52)
    sw $t0, -204($fp)	# tmp$56

    # if_gt tmp$51, tmp$56, label 4
    lw $t0, -104($fp)	# tmp$51
    lw $t1, -204($fp)	# tmp$56
    bgt $t0, $t1, Lbl4

    # goto label 5
    j Lbl5

    # label 4
Lbl4:

    # no_op 

    # no_op 

    # no_op 

    # mul res, i, tmp$57
    lw $t0, _res
    lw $t1, _i
    mul $t2, $t0, $t1
    sw $t2, -220($fp)	# tmp$57

    # move tmp$57, res
    lw $t0, -220($fp)	# tmp$57
    sw $t0, _res

    # no_op 

    # no_op 

    # move 1, tmp$59
    li $t0, 1
    sw $t0, -240($fp)	# tmp$59

    # sub i, tmp$59, tmp$58
    lw $t0, _i
    lw $t1, -240($fp)	# tmp$59
    sub $t2, $t0, $t1
    sw $t2, -232($fp)	# tmp$58

    # move tmp$58, i
    lw $t0, -232($fp)	# tmp$58
    sw $t0, _i

    # goto label 3
    j Lbl3

    # label 5
Lbl5:

    # no_op 

    # param res
    lw $t0, _res
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
_res:  .space 4
.align 2
_i:  .space 4
.align 2
_x:  .space 20

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

