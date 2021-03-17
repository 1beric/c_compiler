.text
# function main
# formals: 
# locals: u (loc: -4); x (loc: -24); tmp$0 (loc: -28); tmp$1 (loc: -32); tmp$2 (loc: -36); tmp$3 (loc: -40); tmp$4 (loc: -44); tmp$5 (loc: -48); tmp$6 (loc: -52); tmp$7 (loc: -56); tmp$8 (loc: -60); tmp$9 (loc: -64); tmp$10 (loc: -68); tmp$20 (loc: -72); tmp$11 (loc: -76); tmp$30 (loc: -80); tmp$21 (loc: -84); tmp$12 (loc: -88); tmp$40 (loc: -92); tmp$31 (loc: -96); tmp$22 (loc: -100); tmp$13 (loc: -104); tmp$50 (loc: -108); tmp$41 (loc: -112); tmp$32 (loc: -116); tmp$23 (loc: -120); tmp$14 (loc: -124); tmp$60 (loc: -128); tmp$51 (loc: -132); tmp$42 (loc: -136); tmp$33 (loc: -140); tmp$24 (loc: -144); tmp$15 (loc: -148); tmp$70 (loc: -149); tmp$61 (loc: -156); tmp$52 (loc: -160); tmp$43 (loc: -164); tmp$34 (loc: -168); tmp$25 (loc: -172); tmp$16 (loc: -176); tmp$71 (loc: -180); tmp$62 (loc: -184); tmp$53 (loc: -188); tmp$44 (loc: -192); tmp$35 (loc: -196); tmp$26 (loc: -200); tmp$17 (loc: -204); tmp$72 (loc: -208); tmp$63 (loc: -212); tmp$54 (loc: -216); tmp$45 (loc: -220); tmp$36 (loc: -224); tmp$27 (loc: -228); tmp$18 (loc: -232); tmp$73 (loc: -236); tmp$64 (loc: -240); tmp$55 (loc: -244); tmp$46 (loc: -248); tmp$37 (loc: -252); tmp$28 (loc: -256); tmp$19 (loc: -260); tmp$74 (loc: -264); tmp$65 (loc: -268); tmp$56 (loc: -272); tmp$47 (loc: -276); tmp$38 (loc: -280); tmp$29 (loc: -284); tmp$66 (loc: -288); tmp$57 (loc: -289); tmp$48 (loc: -290); tmp$39 (loc: -296); tmp$67 (loc: -300); tmp$58 (loc: -304); tmp$49 (loc: -308); tmp$68 (loc: -312); tmp$59 (loc: -316); tmp$69 (loc: -320); 
# space for locals: 320 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -320($sp)   # allocate stack frame

    # move 0, tmp$2
    li $t0, 0
    sw $t0, -36($fp)	# tmp$2

    # move addr(x), tmp$0
    la $t0, -24($fp)	# addr(x)
    sw $t0, -28($fp)	# tmp$0

    # mul tmp$2, 4, tmp$1
    lw $t0, -36($fp)	# tmp$2
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$1

    # add tmp$0, tmp$1, tmp$0
    lw $t0, -28($fp)	# tmp$0
    lw $t1, -32($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$0

    # move 0, tmp$3
    li $t0, 0
    sw $t0, -40($fp)	# tmp$3

    # move tmp$3, deref(tmp$0)
    lw $t0, -40($fp)	# tmp$3
    lw $t1, -28($fp)	# tmp$0
    sw $t0, 0($t1)	# deref(tmp$0)

    # move 0, tmp$6
    li $t0, 0
    sw $t0, -52($fp)	# tmp$6

    # move addr(y), tmp$4
    la $t0, _y
    sw $t0, -44($fp)	# tmp$4

    # mul tmp$6, 1, tmp$5
    lw $t0, -52($fp)	# tmp$6
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$5

    # add tmp$4, tmp$5, tmp$4
    lw $t0, -44($fp)	# tmp$4
    lw $t1, -48($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -44($fp)	# tmp$4

    # move 1, tmp$7
    li $t0, 1
    sw $t0, -56($fp)	# tmp$7

    # move tmp$7, deref(tmp$4)
    lw $t0, -56($fp)	# tmp$7
    lw $t1, -44($fp)	# tmp$4
    sb $t0, 0($t1)	# deref(tmp$4)

    # move 1, tmp$10
    li $t0, 1
    sw $t0, -68($fp)	# tmp$10

    # move addr(x), tmp$8
    la $t0, -24($fp)	# addr(x)
    sw $t0, -60($fp)	# tmp$8

    # mul tmp$10, 4, tmp$9
    lw $t0, -68($fp)	# tmp$10
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$9

    # add tmp$8, tmp$9, tmp$8
    lw $t0, -60($fp)	# tmp$8
    lw $t1, -64($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -60($fp)	# tmp$8

    # move 1, tmp$11
    li $t0, 1
    sw $t0, -76($fp)	# tmp$11

    # move tmp$11, deref(tmp$8)
    lw $t0, -76($fp)	# tmp$11
    lw $t1, -60($fp)	# tmp$8
    sw $t0, 0($t1)	# deref(tmp$8)

    # move 1, tmp$14
    li $t0, 1
    sw $t0, -124($fp)	# tmp$14

    # move addr(y), tmp$12
    la $t0, _y
    sw $t0, -88($fp)	# tmp$12

    # mul tmp$14, 1, tmp$13
    lw $t0, -124($fp)	# tmp$14
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -104($fp)	# tmp$13

    # add tmp$12, tmp$13, tmp$12
    lw $t0, -88($fp)	# tmp$12
    lw $t1, -104($fp)	# tmp$13
    add $t2, $t0, $t1
    sw $t2, -88($fp)	# tmp$12

    # move 2, tmp$15
    li $t0, 2
    sw $t0, -148($fp)	# tmp$15

    # move tmp$15, deref(tmp$12)
    lw $t0, -148($fp)	# tmp$15
    lw $t1, -88($fp)	# tmp$12
    sb $t0, 0($t1)	# deref(tmp$12)

    # move 2, tmp$18
    li $t0, 2
    sw $t0, -232($fp)	# tmp$18

    # move addr(x), tmp$16
    la $t0, -24($fp)	# addr(x)
    sw $t0, -176($fp)	# tmp$16

    # mul tmp$18, 4, tmp$17
    lw $t0, -232($fp)	# tmp$18
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -204($fp)	# tmp$17

    # add tmp$16, tmp$17, tmp$16
    lw $t0, -176($fp)	# tmp$16
    lw $t1, -204($fp)	# tmp$17
    add $t2, $t0, $t1
    sw $t2, -176($fp)	# tmp$16

    # move 2, tmp$19
    li $t0, 2
    sw $t0, -260($fp)	# tmp$19

    # move tmp$19, deref(tmp$16)
    lw $t0, -260($fp)	# tmp$19
    lw $t1, -176($fp)	# tmp$16
    sw $t0, 0($t1)	# deref(tmp$16)

    # move 2, tmp$22
    li $t0, 2
    sw $t0, -100($fp)	# tmp$22

    # move addr(y), tmp$20
    la $t0, _y
    sw $t0, -72($fp)	# tmp$20

    # mul tmp$22, 1, tmp$21
    lw $t0, -100($fp)	# tmp$22
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -84($fp)	# tmp$21

    # add tmp$20, tmp$21, tmp$20
    lw $t0, -72($fp)	# tmp$20
    lw $t1, -84($fp)	# tmp$21
    add $t2, $t0, $t1
    sw $t2, -72($fp)	# tmp$20

    # move 3, tmp$23
    li $t0, 3
    sw $t0, -120($fp)	# tmp$23

    # move tmp$23, deref(tmp$20)
    lw $t0, -120($fp)	# tmp$23
    lw $t1, -72($fp)	# tmp$20
    sb $t0, 0($t1)	# deref(tmp$20)

    # move 3, tmp$26
    li $t0, 3
    sw $t0, -200($fp)	# tmp$26

    # move addr(x), tmp$24
    la $t0, -24($fp)	# addr(x)
    sw $t0, -144($fp)	# tmp$24

    # mul tmp$26, 4, tmp$25
    lw $t0, -200($fp)	# tmp$26
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -172($fp)	# tmp$25

    # add tmp$24, tmp$25, tmp$24
    lw $t0, -144($fp)	# tmp$24
    lw $t1, -172($fp)	# tmp$25
    add $t2, $t0, $t1
    sw $t2, -144($fp)	# tmp$24

    # move 3, tmp$27
    li $t0, 3
    sw $t0, -228($fp)	# tmp$27

    # move tmp$27, deref(tmp$24)
    lw $t0, -228($fp)	# tmp$27
    lw $t1, -144($fp)	# tmp$24
    sw $t0, 0($t1)	# deref(tmp$24)

    # move 3, tmp$30
    li $t0, 3
    sw $t0, -80($fp)	# tmp$30

    # move addr(y), tmp$28
    la $t0, _y
    sw $t0, -256($fp)	# tmp$28

    # mul tmp$30, 1, tmp$29
    lw $t0, -80($fp)	# tmp$30
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -284($fp)	# tmp$29

    # add tmp$28, tmp$29, tmp$28
    lw $t0, -256($fp)	# tmp$28
    lw $t1, -284($fp)	# tmp$29
    add $t2, $t0, $t1
    sw $t2, -256($fp)	# tmp$28

    # move 4, tmp$31
    li $t0, 4
    sw $t0, -96($fp)	# tmp$31

    # move tmp$31, deref(tmp$28)
    lw $t0, -96($fp)	# tmp$31
    lw $t1, -256($fp)	# tmp$28
    sb $t0, 0($t1)	# deref(tmp$28)

    # move 4, tmp$34
    li $t0, 4
    sw $t0, -168($fp)	# tmp$34

    # move addr(x), tmp$32
    la $t0, -24($fp)	# addr(x)
    sw $t0, -116($fp)	# tmp$32

    # mul tmp$34, 4, tmp$33
    lw $t0, -168($fp)	# tmp$34
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -140($fp)	# tmp$33

    # add tmp$32, tmp$33, tmp$32
    lw $t0, -116($fp)	# tmp$32
    lw $t1, -140($fp)	# tmp$33
    add $t2, $t0, $t1
    sw $t2, -116($fp)	# tmp$32

    # move 4, tmp$35
    li $t0, 4
    sw $t0, -196($fp)	# tmp$35

    # move tmp$35, deref(tmp$32)
    lw $t0, -196($fp)	# tmp$35
    lw $t1, -116($fp)	# tmp$32
    sw $t0, 0($t1)	# deref(tmp$32)

    # move 4, tmp$38
    li $t0, 4
    sw $t0, -280($fp)	# tmp$38

    # move addr(y), tmp$36
    la $t0, _y
    sw $t0, -224($fp)	# tmp$36

    # mul tmp$38, 1, tmp$37
    lw $t0, -280($fp)	# tmp$38
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -252($fp)	# tmp$37

    # add tmp$36, tmp$37, tmp$36
    lw $t0, -224($fp)	# tmp$36
    lw $t1, -252($fp)	# tmp$37
    add $t2, $t0, $t1
    sw $t2, -224($fp)	# tmp$36

    # move 55, tmp$39
    li $t0, 55
    sw $t0, -296($fp)	# tmp$39

    # move tmp$39, deref(tmp$36)
    lw $t0, -296($fp)	# tmp$39
    lw $t1, -224($fp)	# tmp$36
    sb $t0, 0($t1)	# deref(tmp$36)

    # no_op 

    # move 0, tmp$43
    li $t0, 0
    sw $t0, -164($fp)	# tmp$43

    # move addr(x), tmp$41
    la $t0, -24($fp)	# addr(x)
    sw $t0, -112($fp)	# tmp$41

    # mul tmp$43, 4, tmp$42
    lw $t0, -164($fp)	# tmp$43
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -136($fp)	# tmp$42

    # add tmp$41, tmp$42, tmp$41
    lw $t0, -112($fp)	# tmp$41
    lw $t1, -136($fp)	# tmp$42
    add $t2, $t0, $t1
    sw $t2, -112($fp)	# tmp$41

    # move deref(tmp$41), tmp$44
    lw $t0, -112($fp)	# tmp$41
    lw $t0, 0($t0)	# deref(tmp$41)
    sw $t0, -192($fp)	# tmp$44

    # move 0, tmp$47
    li $t0, 0
    sw $t0, -276($fp)	# tmp$47

    # move addr(y), tmp$45
    la $t0, _y
    sw $t0, -220($fp)	# tmp$45

    # mul tmp$47, 1, tmp$46
    lw $t0, -276($fp)	# tmp$47
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -248($fp)	# tmp$46

    # add tmp$45, tmp$46, tmp$45
    lw $t0, -220($fp)	# tmp$45
    lw $t1, -248($fp)	# tmp$46
    add $t2, $t0, $t1
    sw $t2, -220($fp)	# tmp$45

    # move deref(tmp$45), tmp$48
    lw $t0, -220($fp)	# tmp$45
    lb $t0, 0($t0)	# deref(tmp$45)
    sb $t0, -290($fp)	# tmp$48

    # add tmp$44, tmp$48, tmp$40
    lw $t0, -192($fp)	# tmp$44
    lb $t1, -290($fp)	# tmp$48
    add $t2, $t0, $t1
    sw $t2, -92($fp)	# tmp$40

    # move tmp$40, u
    lw $t0, -92($fp)	# tmp$40
    sw $t0, -4($fp)	# u

    # no_op 

    # move 1, tmp$52
    li $t0, 1
    sw $t0, -160($fp)	# tmp$52

    # move addr(x), tmp$50
    la $t0, -24($fp)	# addr(x)
    sw $t0, -108($fp)	# tmp$50

    # mul tmp$52, 4, tmp$51
    lw $t0, -160($fp)	# tmp$52
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -132($fp)	# tmp$51

    # add tmp$50, tmp$51, tmp$50
    lw $t0, -108($fp)	# tmp$50
    lw $t1, -132($fp)	# tmp$51
    add $t2, $t0, $t1
    sw $t2, -108($fp)	# tmp$50

    # move deref(tmp$50), tmp$53
    lw $t0, -108($fp)	# tmp$50
    lw $t0, 0($t0)	# deref(tmp$50)
    sw $t0, -188($fp)	# tmp$53

    # no_op 

    # add tmp$53, u, tmp$49
    lw $t0, -188($fp)	# tmp$53
    lw $t1, -4($fp)	# u
    add $t2, $t0, $t1
    sw $t2, -308($fp)	# tmp$49

    # move tmp$49, u
    lw $t0, -308($fp)	# tmp$49
    sw $t0, -4($fp)	# u

    # no_op 

    # no_op 

    # move addr(y), tmp$55
    la $t0, _y
    sw $t0, -244($fp)	# tmp$55

    # mul u, 1, tmp$56
    lw $t0, -4($fp)	# u
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -272($fp)	# tmp$56

    # add tmp$55, tmp$56, tmp$55
    lw $t0, -244($fp)	# tmp$55
    lw $t1, -272($fp)	# tmp$56
    add $t2, $t0, $t1
    sw $t2, -244($fp)	# tmp$55

    # move deref(tmp$55), tmp$57
    lw $t0, -244($fp)	# tmp$55
    lb $t0, 0($t0)	# deref(tmp$55)
    sb $t0, -289($fp)	# tmp$57

    # move 3, tmp$60
    li $t0, 3
    sw $t0, -128($fp)	# tmp$60

    # move addr(x), tmp$58
    la $t0, -24($fp)	# addr(x)
    sw $t0, -304($fp)	# tmp$58

    # mul tmp$60, 4, tmp$59
    lw $t0, -128($fp)	# tmp$60
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -316($fp)	# tmp$59

    # add tmp$58, tmp$59, tmp$58
    lw $t0, -304($fp)	# tmp$58
    lw $t1, -316($fp)	# tmp$59
    add $t2, $t0, $t1
    sw $t2, -304($fp)	# tmp$58

    # move deref(tmp$58), tmp$61
    lw $t0, -304($fp)	# tmp$58
    lw $t0, 0($t0)	# deref(tmp$58)
    sw $t0, -156($fp)	# tmp$61

    # mul tmp$57, tmp$61, tmp$54
    lb $t0, -289($fp)	# tmp$57
    lw $t1, -156($fp)	# tmp$61
    mul $t2, $t0, $t1
    sw $t2, -216($fp)	# tmp$54

    # move tmp$54, u
    lw $t0, -216($fp)	# tmp$54
    sw $t0, -4($fp)	# u

    # no_op 

    # no_op 

    # move 2, tmp$65
    li $t0, 2
    sw $t0, -268($fp)	# tmp$65

    # move addr(x), tmp$63
    la $t0, -24($fp)	# addr(x)
    sw $t0, -212($fp)	# tmp$63

    # mul tmp$65, 4, tmp$64
    lw $t0, -268($fp)	# tmp$65
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -240($fp)	# tmp$64

    # add tmp$63, tmp$64, tmp$63
    lw $t0, -212($fp)	# tmp$63
    lw $t1, -240($fp)	# tmp$64
    add $t2, $t0, $t1
    sw $t2, -212($fp)	# tmp$63

    # move deref(tmp$63), tmp$66
    lw $t0, -212($fp)	# tmp$63
    lw $t0, 0($t0)	# deref(tmp$63)
    sw $t0, -288($fp)	# tmp$66

    # div u, tmp$66, tmp$62
    lw $t0, -4($fp)	# u
    lw $t1, -288($fp)	# tmp$66
    div $t2, $t0, $t1
    sw $t2, -184($fp)	# tmp$62

    # move tmp$62, u
    lw $t0, -184($fp)	# tmp$62
    sw $t0, -4($fp)	# u

    # no_op 

    # no_op 

    # move addr(y), tmp$68
    la $t0, _y
    sw $t0, -312($fp)	# tmp$68

    # mul u, 1, tmp$69
    lw $t0, -4($fp)	# u
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -320($fp)	# tmp$69

    # add tmp$68, tmp$69, tmp$68
    lw $t0, -312($fp)	# tmp$68
    lw $t1, -320($fp)	# tmp$69
    add $t2, $t0, $t1
    sw $t2, -312($fp)	# tmp$68

    # move deref(tmp$68), tmp$70
    lw $t0, -312($fp)	# tmp$68
    lb $t0, 0($t0)	# deref(tmp$68)
    sb $t0, -149($fp)	# tmp$70

    # move 0, tmp$73
    li $t0, 0
    sw $t0, -236($fp)	# tmp$73

    # move addr(x), tmp$71
    la $t0, -24($fp)	# addr(x)
    sw $t0, -180($fp)	# tmp$71

    # mul tmp$73, 4, tmp$72
    lw $t0, -236($fp)	# tmp$73
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -208($fp)	# tmp$72

    # add tmp$71, tmp$72, tmp$71
    lw $t0, -180($fp)	# tmp$71
    lw $t1, -208($fp)	# tmp$72
    add $t2, $t0, $t1
    sw $t2, -180($fp)	# tmp$71

    # move deref(tmp$71), tmp$74
    lw $t0, -180($fp)	# tmp$71
    lw $t0, 0($t0)	# deref(tmp$71)
    sw $t0, -264($fp)	# tmp$74

    # sub tmp$70, tmp$74, tmp$67
    lb $t0, -149($fp)	# tmp$70
    lw $t1, -264($fp)	# tmp$74
    sub $t2, $t0, $t1
    sw $t2, -300($fp)	# tmp$67

    # move tmp$67, u
    lw $t0, -300($fp)	# tmp$67
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
_y:  .space 5

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

