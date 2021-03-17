.text
# function main
# formals: 
# locals: u (loc: -4); x (loc: -24); tmp$0 (loc: -28); tmp$1 (loc: -32); tmp$2 (loc: -36); tmp$3 (loc: -40); tmp$4 (loc: -44); tmp$5 (loc: -48); tmp$6 (loc: -52); tmp$7 (loc: -56); tmp$8 (loc: -60); tmp$9 (loc: -64); tmp$10 (loc: -68); tmp$20 (loc: -72); tmp$11 (loc: -76); tmp$30 (loc: -80); tmp$21 (loc: -84); tmp$12 (loc: -88); tmp$40 (loc: -92); tmp$31 (loc: -96); tmp$22 (loc: -100); tmp$13 (loc: -104); tmp$50 (loc: -105); tmp$41 (loc: -112); tmp$32 (loc: -116); tmp$23 (loc: -120); tmp$14 (loc: -124); tmp$60 (loc: -128); tmp$51 (loc: -132); tmp$42 (loc: -136); tmp$33 (loc: -140); tmp$24 (loc: -144); tmp$15 (loc: -148); tmp$70 (loc: -152); tmp$61 (loc: -156); tmp$52 (loc: -160); tmp$43 (loc: -164); tmp$34 (loc: -168); tmp$25 (loc: -172); tmp$16 (loc: -176); tmp$71 (loc: -180); tmp$62 (loc: -184); tmp$53 (loc: -188); tmp$44 (loc: -192); tmp$35 (loc: -196); tmp$26 (loc: -200); tmp$17 (loc: -204); tmp$72 (loc: -205); tmp$63 (loc: -212); tmp$54 (loc: -216); tmp$45 (loc: -220); tmp$36 (loc: -224); tmp$27 (loc: -228); tmp$18 (loc: -232); tmp$73 (loc: -236); tmp$64 (loc: -240); tmp$55 (loc: -244); tmp$46 (loc: -248); tmp$37 (loc: -252); tmp$28 (loc: -256); tmp$19 (loc: -260); tmp$74 (loc: -264); tmp$65 (loc: -268); tmp$56 (loc: -272); tmp$47 (loc: -276); tmp$38 (loc: -280); tmp$29 (loc: -284); tmp$75 (loc: -288); tmp$66 (loc: -292); tmp$57 (loc: -296); tmp$48 (loc: -300); tmp$39 (loc: -304); tmp$76 (loc: -308); tmp$67 (loc: -312); tmp$58 (loc: -316); tmp$49 (loc: -320); tmp$68 (loc: -324); tmp$59 (loc: -325); tmp$69 (loc: -332); 
# space for locals: 332 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -332($sp)   # allocate stack frame

    # block (0)
    # move 0, tmp$2
    li $t0, 0
    sw $t0, -36($fp)	# tmp$2

    # block (0)
    # move addr(x), tmp$0
    la $t0, -24($fp)	# addr(x)
    sw $t0, -28($fp)	# tmp$0

    # block (0)
    # move 0, tmp$1
    li $t0, 0
    sw $t0, -32($fp)	# tmp$1

    # block (0)
    # add addr(x), tmp$1, tmp$0
    la $t0, -24($fp)	# addr(x)
    lw $t1, -32($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$0

    # block (0)
    # move 0, tmp$3
    li $t0, 0
    sw $t0, -40($fp)	# tmp$3

    # block (0)
    # move 0, deref(tmp$0)
    li $t0, 0
    lw $t1, -28($fp)	# tmp$0
    sw $t0, 0($t1)	# deref(tmp$0)

    # block (0)
    # move 0, tmp$6
    li $t0, 0
    sw $t0, -52($fp)	# tmp$6

    # block (0)
    # move addr(y), tmp$4
    la $t0, _y
    sw $t0, -44($fp)	# tmp$4

    # block (0)
    # move 0, tmp$5
    li $t0, 0
    sw $t0, -48($fp)	# tmp$5

    # block (0)
    # add addr(y), tmp$5, tmp$4
    la $t0, _y
    lw $t1, -48($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -44($fp)	# tmp$4

    # block (0)
    # move 1, tmp$7
    li $t0, 1
    sw $t0, -56($fp)	# tmp$7

    # block (0)
    # move 1, deref(tmp$4)
    li $t0, 1
    lw $t1, -44($fp)	# tmp$4
    sb $t0, 0($t1)	# deref(tmp$4)

    # block (0)
    # move 1, tmp$10
    li $t0, 1
    sw $t0, -68($fp)	# tmp$10

    # block (0)
    # move addr(x), tmp$8
    la $t0, -24($fp)	# addr(x)
    sw $t0, -60($fp)	# tmp$8

    # block (0)
    # move 4, tmp$9
    li $t0, 4
    sw $t0, -64($fp)	# tmp$9

    # block (0)
    # add addr(x), tmp$9, tmp$8
    la $t0, -24($fp)	# addr(x)
    lw $t1, -64($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -60($fp)	# tmp$8

    # block (0)
    # move 1, tmp$11
    li $t0, 1
    sw $t0, -76($fp)	# tmp$11

    # block (0)
    # move 1, deref(tmp$8)
    li $t0, 1
    lw $t1, -60($fp)	# tmp$8
    sw $t0, 0($t1)	# deref(tmp$8)

    # block (0)
    # move 1, tmp$14
    li $t0, 1
    sw $t0, -124($fp)	# tmp$14

    # block (0)
    # move addr(y), tmp$12
    la $t0, _y
    sw $t0, -88($fp)	# tmp$12

    # block (0)
    # move 1, tmp$13
    li $t0, 1
    sw $t0, -104($fp)	# tmp$13

    # block (0)
    # add addr(y), tmp$13, tmp$12
    la $t0, _y
    lw $t1, -104($fp)	# tmp$13
    add $t2, $t0, $t1
    sw $t2, -88($fp)	# tmp$12

    # block (0)
    # move 2, tmp$15
    li $t0, 2
    sw $t0, -148($fp)	# tmp$15

    # block (0)
    # move 2, deref(tmp$12)
    li $t0, 2
    lw $t1, -88($fp)	# tmp$12
    sb $t0, 0($t1)	# deref(tmp$12)

    # block (0)
    # move 2, tmp$18
    li $t0, 2
    sw $t0, -232($fp)	# tmp$18

    # block (0)
    # move addr(x), tmp$16
    la $t0, -24($fp)	# addr(x)
    sw $t0, -176($fp)	# tmp$16

    # block (0)
    # move 8, tmp$17
    li $t0, 8
    sw $t0, -204($fp)	# tmp$17

    # block (0)
    # add addr(x), tmp$17, tmp$16
    la $t0, -24($fp)	# addr(x)
    lw $t1, -204($fp)	# tmp$17
    add $t2, $t0, $t1
    sw $t2, -176($fp)	# tmp$16

    # block (0)
    # move 2, tmp$19
    li $t0, 2
    sw $t0, -260($fp)	# tmp$19

    # block (0)
    # move 2, deref(tmp$16)
    li $t0, 2
    lw $t1, -176($fp)	# tmp$16
    sw $t0, 0($t1)	# deref(tmp$16)

    # block (0)
    # move 2, tmp$22
    li $t0, 2
    sw $t0, -100($fp)	# tmp$22

    # block (0)
    # move addr(y), tmp$20
    la $t0, _y
    sw $t0, -72($fp)	# tmp$20

    # block (0)
    # move 2, tmp$21
    li $t0, 2
    sw $t0, -84($fp)	# tmp$21

    # block (0)
    # add addr(y), tmp$21, tmp$20
    la $t0, _y
    lw $t1, -84($fp)	# tmp$21
    add $t2, $t0, $t1
    sw $t2, -72($fp)	# tmp$20

    # block (0)
    # move 3, tmp$23
    li $t0, 3
    sw $t0, -120($fp)	# tmp$23

    # block (0)
    # move 3, deref(tmp$20)
    li $t0, 3
    lw $t1, -72($fp)	# tmp$20
    sb $t0, 0($t1)	# deref(tmp$20)

    # block (0)
    # move 3, tmp$26
    li $t0, 3
    sw $t0, -200($fp)	# tmp$26

    # block (0)
    # move addr(x), tmp$24
    la $t0, -24($fp)	# addr(x)
    sw $t0, -144($fp)	# tmp$24

    # block (0)
    # move 12, tmp$25
    li $t0, 12
    sw $t0, -172($fp)	# tmp$25

    # block (0)
    # add addr(x), tmp$25, tmp$24
    la $t0, -24($fp)	# addr(x)
    lw $t1, -172($fp)	# tmp$25
    add $t2, $t0, $t1
    sw $t2, -144($fp)	# tmp$24

    # block (0)
    # move 3, tmp$27
    li $t0, 3
    sw $t0, -228($fp)	# tmp$27

    # block (0)
    # move 3, deref(tmp$24)
    li $t0, 3
    lw $t1, -144($fp)	# tmp$24
    sw $t0, 0($t1)	# deref(tmp$24)

    # block (0)
    # move 3, tmp$30
    li $t0, 3
    sw $t0, -80($fp)	# tmp$30

    # block (0)
    # move addr(y), tmp$28
    la $t0, _y
    sw $t0, -256($fp)	# tmp$28

    # block (0)
    # move 3, tmp$29
    li $t0, 3
    sw $t0, -284($fp)	# tmp$29

    # block (0)
    # add addr(y), tmp$29, tmp$28
    la $t0, _y
    lw $t1, -284($fp)	# tmp$29
    add $t2, $t0, $t1
    sw $t2, -256($fp)	# tmp$28

    # block (0)
    # move 4, tmp$31
    li $t0, 4
    sw $t0, -96($fp)	# tmp$31

    # block (0)
    # move 4, deref(tmp$28)
    li $t0, 4
    lw $t1, -256($fp)	# tmp$28
    sb $t0, 0($t1)	# deref(tmp$28)

    # block (0)
    # move 4, tmp$34
    li $t0, 4
    sw $t0, -168($fp)	# tmp$34

    # block (0)
    # move addr(x), tmp$32
    la $t0, -24($fp)	# addr(x)
    sw $t0, -116($fp)	# tmp$32

    # block (0)
    # move 16, tmp$33
    li $t0, 16
    sw $t0, -140($fp)	# tmp$33

    # block (0)
    # add addr(x), tmp$33, tmp$32
    la $t0, -24($fp)	# addr(x)
    lw $t1, -140($fp)	# tmp$33
    add $t2, $t0, $t1
    sw $t2, -116($fp)	# tmp$32

    # block (0)
    # move 4, tmp$35
    li $t0, 4
    sw $t0, -196($fp)	# tmp$35

    # block (0)
    # move 4, deref(tmp$32)
    li $t0, 4
    lw $t1, -116($fp)	# tmp$32
    sw $t0, 0($t1)	# deref(tmp$32)

    # block (0)
    # move 4, tmp$38
    li $t0, 4
    sw $t0, -280($fp)	# tmp$38

    # block (0)
    # move addr(y), tmp$36
    la $t0, _y
    sw $t0, -224($fp)	# tmp$36

    # block (0)
    # move 4, tmp$37
    li $t0, 4
    sw $t0, -252($fp)	# tmp$37

    # block (0)
    # add addr(y), tmp$37, tmp$36
    la $t0, _y
    lw $t1, -252($fp)	# tmp$37
    add $t2, $t0, $t1
    sw $t2, -224($fp)	# tmp$36

    # block (0)
    # move 55, tmp$39
    li $t0, 55
    sw $t0, -304($fp)	# tmp$39

    # block (0)
    # move 55, deref(tmp$36)
    li $t0, 55
    lw $t1, -224($fp)	# tmp$36
    sb $t0, 0($t1)	# deref(tmp$36)

    # block (0)
    # move 1, tmp$41
    li $t0, 1
    sw $t0, -112($fp)	# tmp$41

    # block (0)
    # uminus 1, tmp$40
    li $t0, 1
    neg $t2, $t0
    sw $t2, -92($fp)	# tmp$40

    # block (0)
    # param tmp$40
    lw $t0, -92($fp)	# tmp$40
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$45
    li $t0, 0
    sw $t0, -220($fp)	# tmp$45

    # block (0)
    # move addr(x), tmp$43
    la $t0, -24($fp)	# addr(x)
    sw $t0, -164($fp)	# tmp$43

    # block (0)
    # move 0, tmp$44
    li $t0, 0
    sw $t0, -192($fp)	# tmp$44

    # block (0)
    # add addr(x), tmp$44, tmp$43
    la $t0, -24($fp)	# addr(x)
    lw $t1, -192($fp)	# tmp$44
    add $t2, $t0, $t1
    sw $t2, -164($fp)	# tmp$43

    # block (0)
    # move deref(tmp$43), tmp$46
    lw $t0, -164($fp)	# tmp$43
    lw $t0, 0($t0)	# deref(tmp$43)
    sw $t0, -248($fp)	# tmp$46

    # block (0)
    # move 0, tmp$49
    li $t0, 0
    sw $t0, -320($fp)	# tmp$49

    # block (0)
    # move addr(y), tmp$47
    la $t0, _y
    sw $t0, -276($fp)	# tmp$47

    # block (0)
    # move 0, tmp$48
    li $t0, 0
    sw $t0, -300($fp)	# tmp$48

    # block (0)
    # add addr(y), tmp$48, tmp$47
    la $t0, _y
    lw $t1, -300($fp)	# tmp$48
    add $t2, $t0, $t1
    sw $t2, -276($fp)	# tmp$47

    # block (0)
    # move deref(tmp$47), tmp$50
    lw $t0, -276($fp)	# tmp$47
    lb $t0, 0($t0)	# deref(tmp$47)
    sb $t0, -105($fp)	# tmp$50

    # block (0)
    # add deref(tmp$43), tmp$50, tmp$42
    lw $t0, -164($fp)	# tmp$43
    lw $t0, 0($t0)	# deref(tmp$43)
    lb $t1, -105($fp)	# tmp$50
    add $t2, $t0, $t1
    sw $t2, -136($fp)	# tmp$42

    # block (0)
    # move tmp$42, u
    lw $t0, -136($fp)	# tmp$42
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param tmp$42
    lw $t0, -136($fp)	# tmp$42
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 1, tmp$54
    li $t0, 1
    sw $t0, -216($fp)	# tmp$54

    # block (0)
    # move addr(x), tmp$52
    la $t0, -24($fp)	# addr(x)
    sw $t0, -160($fp)	# tmp$52

    # block (0)
    # move 4, tmp$53
    li $t0, 4
    sw $t0, -188($fp)	# tmp$53

    # block (0)
    # add addr(x), tmp$53, tmp$52
    la $t0, -24($fp)	# addr(x)
    lw $t1, -188($fp)	# tmp$53
    add $t2, $t0, $t1
    sw $t2, -160($fp)	# tmp$52

    # block (0)
    # move deref(tmp$52), tmp$55
    lw $t0, -160($fp)	# tmp$52
    lw $t0, 0($t0)	# deref(tmp$52)
    sw $t0, -244($fp)	# tmp$55

    # block (0)
    # no_op 

    # block (0)
    # add deref(tmp$52), tmp$42, tmp$51
    lw $t0, -160($fp)	# tmp$52
    lw $t0, 0($t0)	# deref(tmp$52)
    lw $t1, -136($fp)	# tmp$42
    add $t2, $t0, $t1
    sw $t2, -132($fp)	# tmp$51

    # block (0)
    # move tmp$51, u
    lw $t0, -132($fp)	# tmp$51
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param tmp$51
    lw $t0, -132($fp)	# tmp$51
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move addr(y), tmp$57
    la $t0, _y
    sw $t0, -296($fp)	# tmp$57

    # block (0)
    # move tmp$51, tmp$58
    lw $t0, -132($fp)	# tmp$51
    sw $t0, -316($fp)	# tmp$58

    # block (0)
    # add addr(y), tmp$58, tmp$57
    la $t0, _y
    lw $t1, -316($fp)	# tmp$58
    add $t2, $t0, $t1
    sw $t2, -296($fp)	# tmp$57

    # block (0)
    # move deref(tmp$57), tmp$59
    lw $t0, -296($fp)	# tmp$57
    lb $t0, 0($t0)	# deref(tmp$57)
    sb $t0, -325($fp)	# tmp$59

    # block (0)
    # move 3, tmp$62
    li $t0, 3
    sw $t0, -184($fp)	# tmp$62

    # block (0)
    # move addr(x), tmp$60
    la $t0, -24($fp)	# addr(x)
    sw $t0, -128($fp)	# tmp$60

    # block (0)
    # move 12, tmp$61
    li $t0, 12
    sw $t0, -156($fp)	# tmp$61

    # block (0)
    # add addr(x), tmp$61, tmp$60
    la $t0, -24($fp)	# addr(x)
    lw $t1, -156($fp)	# tmp$61
    add $t2, $t0, $t1
    sw $t2, -128($fp)	# tmp$60

    # block (0)
    # move deref(tmp$60), tmp$63
    lw $t0, -128($fp)	# tmp$60
    lw $t0, 0($t0)	# deref(tmp$60)
    sw $t0, -212($fp)	# tmp$63

    # block (0)
    # mul tmp$59, deref(tmp$60), tmp$56
    lb $t0, -325($fp)	# tmp$59
    lw $t1, -128($fp)	# tmp$60
    lw $t1, 0($t1)	# deref(tmp$60)
    mul $t2, $t0, $t1
    sw $t2, -272($fp)	# tmp$56

    # block (0)
    # move tmp$56, u
    lw $t0, -272($fp)	# tmp$56
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param tmp$56
    lw $t0, -272($fp)	# tmp$56
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move 2, tmp$67
    li $t0, 2
    sw $t0, -312($fp)	# tmp$67

    # block (0)
    # move addr(x), tmp$65
    la $t0, -24($fp)	# addr(x)
    sw $t0, -268($fp)	# tmp$65

    # block (0)
    # move 8, tmp$66
    li $t0, 8
    sw $t0, -292($fp)	# tmp$66

    # block (0)
    # add addr(x), tmp$66, tmp$65
    la $t0, -24($fp)	# addr(x)
    lw $t1, -292($fp)	# tmp$66
    add $t2, $t0, $t1
    sw $t2, -268($fp)	# tmp$65

    # block (0)
    # move deref(tmp$65), tmp$68
    lw $t0, -268($fp)	# tmp$65
    lw $t0, 0($t0)	# deref(tmp$65)
    sw $t0, -324($fp)	# tmp$68

    # block (0)
    # div tmp$56, deref(tmp$65), tmp$64
    lw $t0, -272($fp)	# tmp$56
    lw $t1, -268($fp)	# tmp$65
    lw $t1, 0($t1)	# deref(tmp$65)
    div $t2, $t0, $t1
    sw $t2, -240($fp)	# tmp$64

    # block (0)
    # move tmp$64, u
    lw $t0, -240($fp)	# tmp$64
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param tmp$64
    lw $t0, -240($fp)	# tmp$64
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (0)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # move addr(y), tmp$70
    la $t0, _y
    sw $t0, -152($fp)	# tmp$70

    # block (0)
    # move tmp$64, tmp$71
    lw $t0, -240($fp)	# tmp$64
    sw $t0, -180($fp)	# tmp$71

    # block (0)
    # add addr(y), tmp$71, tmp$70
    la $t0, _y
    lw $t1, -180($fp)	# tmp$71
    add $t2, $t0, $t1
    sw $t2, -152($fp)	# tmp$70

    # block (0)
    # move deref(tmp$70), tmp$72
    lw $t0, -152($fp)	# tmp$70
    lb $t0, 0($t0)	# deref(tmp$70)
    sb $t0, -205($fp)	# tmp$72

    # block (0)
    # move 0, tmp$75
    li $t0, 0
    sw $t0, -288($fp)	# tmp$75

    # block (0)
    # move addr(x), tmp$73
    la $t0, -24($fp)	# addr(x)
    sw $t0, -236($fp)	# tmp$73

    # block (0)
    # move 0, tmp$74
    li $t0, 0
    sw $t0, -264($fp)	# tmp$74

    # block (0)
    # add addr(x), tmp$74, tmp$73
    la $t0, -24($fp)	# addr(x)
    lw $t1, -264($fp)	# tmp$74
    add $t2, $t0, $t1
    sw $t2, -236($fp)	# tmp$73

    # block (0)
    # move deref(tmp$73), tmp$76
    lw $t0, -236($fp)	# tmp$73
    lw $t0, 0($t0)	# deref(tmp$73)
    sw $t0, -308($fp)	# tmp$76

    # block (0)
    # sub tmp$72, deref(tmp$73), tmp$69
    lb $t0, -205($fp)	# tmp$72
    lw $t1, -236($fp)	# tmp$73
    lw $t1, 0($t1)	# deref(tmp$73)
    sub $t2, $t0, $t1
    sw $t2, -332($fp)	# tmp$69

    # block (0)
    # move tmp$69, u
    lw $t0, -332($fp)	# tmp$69
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param tmp$69
    lw $t0, -332($fp)	# tmp$69
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

