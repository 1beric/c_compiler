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
# locals: res (loc: -4); i (loc: -8); tmp$0 (loc: -12); tmp$1 (loc: -16); tmp$2 (loc: -20); tmp$3 (loc: -24); tmp$4 (loc: -28); tmp$5 (loc: -32); tmp$6 (loc: -36); tmp$7 (loc: -40); tmp$8 (loc: -44); tmp$9 (loc: -48); tmp$10 (loc: -52); tmp$20 (loc: -56); tmp$11 (loc: -60); tmp$30 (loc: -64); tmp$21 (loc: -68); tmp$12 (loc: -72); tmp$40 (loc: -76); tmp$31 (loc: -80); tmp$22 (loc: -84); tmp$13 (loc: -88); tmp$50 (loc: -92); tmp$41 (loc: -96); tmp$32 (loc: -100); tmp$23 (loc: -104); tmp$14 (loc: -108); tmp$60 (loc: -112); tmp$51 (loc: -116); tmp$42 (loc: -120); tmp$33 (loc: -124); tmp$24 (loc: -128); tmp$15 (loc: -132); tmp$70 (loc: -136); tmp$61 (loc: -140); tmp$52 (loc: -144); tmp$43 (loc: -148); tmp$34 (loc: -152); tmp$25 (loc: -156); tmp$16 (loc: -160); tmp$80 (loc: -164); tmp$71 (loc: -168); tmp$62 (loc: -172); tmp$53 (loc: -176); tmp$44 (loc: -180); tmp$35 (loc: -184); tmp$26 (loc: -188); tmp$17 (loc: -192); tmp$72 (loc: -196); tmp$63 (loc: -200); tmp$54 (loc: -204); tmp$45 (loc: -208); tmp$36 (loc: -212); tmp$27 (loc: -216); tmp$18 (loc: -220); tmp$73 (loc: -224); tmp$64 (loc: -228); tmp$55 (loc: -232); tmp$46 (loc: -236); tmp$37 (loc: -240); tmp$28 (loc: -244); tmp$19 (loc: -248); tmp$74 (loc: -252); tmp$65 (loc: -256); tmp$56 (loc: -260); tmp$47 (loc: -264); tmp$38 (loc: -268); tmp$29 (loc: -272); tmp$75 (loc: -276); tmp$66 (loc: -280); tmp$57 (loc: -284); tmp$48 (loc: -288); tmp$39 (loc: -292); tmp$76 (loc: -296); tmp$67 (loc: -300); tmp$58 (loc: -304); tmp$49 (loc: -308); tmp$77 (loc: -312); tmp$68 (loc: -316); tmp$59 (loc: -320); tmp$78 (loc: -324); tmp$69 (loc: -328); tmp$79 (loc: -332); 
# space for locals: 332 bytes
#
_main:
    # -LEADER- block (1)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -332($sp)   # allocate stack frame

    # block (1)
    # no_op 

    # block (1)
    # move 0, tmp$0
    li $t0, 0
    sw $t0, -12($fp)	# tmp$0

    # block (1)
    # move 0, i
    li $t0, 0
    sw $t0, -8($fp)	# i

    # -LEADER- block (2)
    # label 0
Lbl0:

    # block (2)
    # no_op 

    # block (2)
    # move 10, tmp$1
    li $t0, 10
    sw $t0, -16($fp)	# tmp$1

    # block (2)
    # if_ge i, 10, label 2
    lw $t0, -8($fp)	# i
    li $t1, 10
    bge $t0, $t1, Lbl2

    # -LEADER- block (3)
    # label 1
Lbl1:

    # block (3)
    # no_op 

    # block (3)
    # move addr(x), tmp$4
    la $t0, _x
    sw $t0, -28($fp)	# tmp$4

    # block (3)
    # mul i, 4, tmp$5
    lw $t0, -8($fp)	# i
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$5

    # block (3)
    # add addr(x), tmp$5, tmp$4
    la $t0, _x
    lw $t1, -32($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$4

    # block (3)
    # no_op 

    # block (3)
    # move i, deref(tmp$4)
    lw $t0, -8($fp)	# i
    lw $t1, -28($fp)	# tmp$4
    sw $t0, 0($t1)	# deref(tmp$4)

    # block (3)
    # no_op 

    # block (3)
    # no_op 

    # block (3)
    # move 1, tmp$3
    li $t0, 1
    sw $t0, -24($fp)	# tmp$3

    # block (3)
    # add i, 1, tmp$2
    lw $t0, -8($fp)	# i
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$2

    # block (3)
    # move tmp$2, i
    lw $t0, -20($fp)	# tmp$2
    sw $t0, -8($fp)	# i

    # block (3)
    # goto label 0
    j Lbl0

    # -LEADER- block (4)
    # label 2
Lbl2:

    # block (4)
    # no_op 

    # block (4)
    # move 5, tmp$14
    li $t0, 5
    sw $t0, -108($fp)	# tmp$14

    # block (4)
    # param 5
    li $t0, 5
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$15
    sw $v0, -132($fp)	# tmp$15

    # block (4)
    # move addr(x), tmp$12
    la $t0, _x
    sw $t0, -72($fp)	# tmp$12

    # block (4)
    # mul tmp$15, 4, tmp$13
    lw $t0, -132($fp)	# tmp$15
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -88($fp)	# tmp$13

    # block (4)
    # add addr(x), tmp$13, tmp$12
    la $t0, _x
    lw $t1, -88($fp)	# tmp$13
    add $t2, $t0, $t1
    sw $t2, -72($fp)	# tmp$12

    # block (4)
    # param deref(tmp$12)
    lw $t0, -72($fp)	# tmp$12
    lw $t0, 0($t0)	# deref(tmp$12)
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$16
    sw $v0, -160($fp)	# tmp$16

    # block (4)
    # move addr(x), tmp$10
    la $t0, _x
    sw $t0, -52($fp)	# tmp$10

    # block (4)
    # mul tmp$16, 4, tmp$11
    lw $t0, -160($fp)	# tmp$16
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -60($fp)	# tmp$11

    # block (4)
    # add addr(x), tmp$11, tmp$10
    la $t0, _x
    lw $t1, -60($fp)	# tmp$11
    add $t2, $t0, $t1
    sw $t2, -52($fp)	# tmp$10

    # block (4)
    # param deref(tmp$10)
    lw $t0, -52($fp)	# tmp$10
    lw $t0, 0($t0)	# deref(tmp$10)
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$17
    sw $v0, -192($fp)	# tmp$17

    # block (4)
    # move addr(x), tmp$8
    la $t0, _x
    sw $t0, -44($fp)	# tmp$8

    # block (4)
    # mul tmp$17, 4, tmp$9
    lw $t0, -192($fp)	# tmp$17
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$9

    # block (4)
    # add addr(x), tmp$9, tmp$8
    la $t0, _x
    lw $t1, -48($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -44($fp)	# tmp$8

    # block (4)
    # param deref(tmp$8)
    lw $t0, -44($fp)	# tmp$8
    lw $t0, 0($t0)	# deref(tmp$8)
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$18
    sw $v0, -220($fp)	# tmp$18

    # block (4)
    # move addr(x), tmp$6
    la $t0, _x
    sw $t0, -36($fp)	# tmp$6

    # block (4)
    # mul tmp$18, 4, tmp$7
    lw $t0, -220($fp)	# tmp$18
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$7

    # block (4)
    # add addr(x), tmp$7, tmp$6
    la $t0, _x
    lw $t1, -40($fp)	# tmp$7
    add $t2, $t0, $t1
    sw $t2, -36($fp)	# tmp$6

    # block (4)
    # move deref(tmp$6), res
    lw $t0, -36($fp)	# tmp$6
    lw $t0, 0($t0)	# deref(tmp$6)
    sw $t0, -4($fp)	# res

    # block (4)
    # move 0, tmp$34
    li $t0, 0
    sw $t0, -152($fp)	# tmp$34

    # block (4)
    # param 0
    li $t0, 0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$35
    sw $v0, -184($fp)	# tmp$35

    # block (4)
    # move 1, tmp$36
    li $t0, 1
    sw $t0, -212($fp)	# tmp$36

    # block (4)
    # add tmp$35, 1, tmp$33
    lw $t0, -184($fp)	# tmp$35
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -124($fp)	# tmp$33

    # block (4)
    # move addr(x), tmp$31
    la $t0, _x
    sw $t0, -80($fp)	# tmp$31

    # block (4)
    # mul tmp$33, 4, tmp$32
    lw $t0, -124($fp)	# tmp$33
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -100($fp)	# tmp$32

    # block (4)
    # add addr(x), tmp$32, tmp$31
    la $t0, _x
    lw $t1, -100($fp)	# tmp$32
    add $t2, $t0, $t1
    sw $t2, -80($fp)	# tmp$31

    # block (4)
    # move deref(tmp$31), tmp$37
    lw $t0, -80($fp)	# tmp$31
    lw $t0, 0($t0)	# deref(tmp$31)
    sw $t0, -240($fp)	# tmp$37

    # block (4)
    # move 1, tmp$38
    li $t0, 1
    sw $t0, -268($fp)	# tmp$38

    # block (4)
    # add deref(tmp$31), 1, tmp$30
    lw $t0, -80($fp)	# tmp$31
    lw $t0, 0($t0)	# deref(tmp$31)
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$30

    # block (4)
    # param tmp$30
    lw $t0, -64($fp)	# tmp$30
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$39
    sw $v0, -292($fp)	# tmp$39

    # block (4)
    # move 1, tmp$40
    li $t0, 1
    sw $t0, -76($fp)	# tmp$40

    # block (4)
    # add tmp$39, 1, tmp$29
    lw $t0, -292($fp)	# tmp$39
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -272($fp)	# tmp$29

    # block (4)
    # move addr(x), tmp$27
    la $t0, _x
    sw $t0, -216($fp)	# tmp$27

    # block (4)
    # mul tmp$29, 4, tmp$28
    lw $t0, -272($fp)	# tmp$29
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -244($fp)	# tmp$28

    # block (4)
    # add addr(x), tmp$28, tmp$27
    la $t0, _x
    lw $t1, -244($fp)	# tmp$28
    add $t2, $t0, $t1
    sw $t2, -216($fp)	# tmp$27

    # block (4)
    # move deref(tmp$27), tmp$41
    lw $t0, -216($fp)	# tmp$27
    lw $t0, 0($t0)	# deref(tmp$27)
    sw $t0, -96($fp)	# tmp$41

    # block (4)
    # move 1, tmp$42
    li $t0, 1
    sw $t0, -120($fp)	# tmp$42

    # block (4)
    # add deref(tmp$27), 1, tmp$26
    lw $t0, -216($fp)	# tmp$27
    lw $t0, 0($t0)	# deref(tmp$27)
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -188($fp)	# tmp$26

    # block (4)
    # param tmp$26
    lw $t0, -188($fp)	# tmp$26
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$43
    sw $v0, -148($fp)	# tmp$43

    # block (4)
    # move 1, tmp$44
    li $t0, 1
    sw $t0, -180($fp)	# tmp$44

    # block (4)
    # add tmp$43, 1, tmp$25
    lw $t0, -148($fp)	# tmp$43
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -156($fp)	# tmp$25

    # block (4)
    # move addr(x), tmp$23
    la $t0, _x
    sw $t0, -104($fp)	# tmp$23

    # block (4)
    # mul tmp$25, 4, tmp$24
    lw $t0, -156($fp)	# tmp$25
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -128($fp)	# tmp$24

    # block (4)
    # add addr(x), tmp$24, tmp$23
    la $t0, _x
    lw $t1, -128($fp)	# tmp$24
    add $t2, $t0, $t1
    sw $t2, -104($fp)	# tmp$23

    # block (4)
    # move deref(tmp$23), tmp$45
    lw $t0, -104($fp)	# tmp$23
    lw $t0, 0($t0)	# deref(tmp$23)
    sw $t0, -208($fp)	# tmp$45

    # block (4)
    # move 1, tmp$46
    li $t0, 1
    sw $t0, -236($fp)	# tmp$46

    # block (4)
    # add deref(tmp$23), 1, tmp$22
    lw $t0, -104($fp)	# tmp$23
    lw $t0, 0($t0)	# deref(tmp$23)
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -84($fp)	# tmp$22

    # block (4)
    # param tmp$22
    lw $t0, -84($fp)	# tmp$22
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$47
    sw $v0, -264($fp)	# tmp$47

    # block (4)
    # move 1, tmp$48
    li $t0, 1
    sw $t0, -288($fp)	# tmp$48

    # block (4)
    # add tmp$47, 1, tmp$21
    lw $t0, -264($fp)	# tmp$47
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -68($fp)	# tmp$21

    # block (4)
    # move addr(x), tmp$19
    la $t0, _x
    sw $t0, -248($fp)	# tmp$19

    # block (4)
    # mul tmp$21, 4, tmp$20
    lw $t0, -68($fp)	# tmp$21
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -56($fp)	# tmp$20

    # block (4)
    # add addr(x), tmp$20, tmp$19
    la $t0, _x
    lw $t1, -56($fp)	# tmp$20
    add $t2, $t0, $t1
    sw $t2, -248($fp)	# tmp$19

    # block (4)
    # no_op 

    # block (4)
    # move 1, tmp$50
    li $t0, 1
    sw $t0, -92($fp)	# tmp$50

    # block (4)
    # add deref(tmp$6), 1, tmp$49
    lw $t0, -36($fp)	# tmp$6
    lw $t0, 0($t0)	# deref(tmp$6)
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -308($fp)	# tmp$49

    # block (4)
    # move tmp$49, deref(tmp$19)
    lw $t0, -308($fp)	# tmp$49
    lw $t1, -248($fp)	# tmp$19
    sw $t0, 0($t1)	# deref(tmp$19)

    # block (4)
    # no_op 

    # block (4)
    # move 0, tmp$66
    li $t0, 0
    sw $t0, -280($fp)	# tmp$66

    # block (4)
    # param 0
    li $t0, 0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$67
    sw $v0, -300($fp)	# tmp$67

    # block (4)
    # move 1, tmp$68
    li $t0, 1
    sw $t0, -316($fp)	# tmp$68

    # block (4)
    # add tmp$67, 1, tmp$65
    lw $t0, -300($fp)	# tmp$67
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -256($fp)	# tmp$65

    # block (4)
    # move addr(x), tmp$63
    la $t0, _x
    sw $t0, -200($fp)	# tmp$63

    # block (4)
    # mul tmp$65, 4, tmp$64
    lw $t0, -256($fp)	# tmp$65
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -228($fp)	# tmp$64

    # block (4)
    # add addr(x), tmp$64, tmp$63
    la $t0, _x
    lw $t1, -228($fp)	# tmp$64
    add $t2, $t0, $t1
    sw $t2, -200($fp)	# tmp$63

    # block (4)
    # move deref(tmp$63), tmp$69
    lw $t0, -200($fp)	# tmp$63
    lw $t0, 0($t0)	# deref(tmp$63)
    sw $t0, -328($fp)	# tmp$69

    # block (4)
    # move 1, tmp$70
    li $t0, 1
    sw $t0, -136($fp)	# tmp$70

    # block (4)
    # add deref(tmp$63), 1, tmp$62
    lw $t0, -200($fp)	# tmp$63
    lw $t0, 0($t0)	# deref(tmp$63)
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -172($fp)	# tmp$62

    # block (4)
    # param tmp$62
    lw $t0, -172($fp)	# tmp$62
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$71
    sw $v0, -168($fp)	# tmp$71

    # block (4)
    # move 1, tmp$72
    li $t0, 1
    sw $t0, -196($fp)	# tmp$72

    # block (4)
    # add tmp$71, 1, tmp$61
    lw $t0, -168($fp)	# tmp$71
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -140($fp)	# tmp$61

    # block (4)
    # move addr(x), tmp$59
    la $t0, _x
    sw $t0, -320($fp)	# tmp$59

    # block (4)
    # mul tmp$61, 4, tmp$60
    lw $t0, -140($fp)	# tmp$61
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -112($fp)	# tmp$60

    # block (4)
    # add addr(x), tmp$60, tmp$59
    la $t0, _x
    lw $t1, -112($fp)	# tmp$60
    add $t2, $t0, $t1
    sw $t2, -320($fp)	# tmp$59

    # block (4)
    # move deref(tmp$59), tmp$73
    lw $t0, -320($fp)	# tmp$59
    lw $t0, 0($t0)	# deref(tmp$59)
    sw $t0, -224($fp)	# tmp$73

    # block (4)
    # move 1, tmp$74
    li $t0, 1
    sw $t0, -252($fp)	# tmp$74

    # block (4)
    # add deref(tmp$59), 1, tmp$58
    lw $t0, -320($fp)	# tmp$59
    lw $t0, 0($t0)	# deref(tmp$59)
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -304($fp)	# tmp$58

    # block (4)
    # param tmp$58
    lw $t0, -304($fp)	# tmp$58
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$75
    sw $v0, -276($fp)	# tmp$75

    # block (4)
    # move 1, tmp$76
    li $t0, 1
    sw $t0, -296($fp)	# tmp$76

    # block (4)
    # add tmp$75, 1, tmp$57
    lw $t0, -276($fp)	# tmp$75
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -284($fp)	# tmp$57

    # block (4)
    # move addr(x), tmp$55
    la $t0, _x
    sw $t0, -232($fp)	# tmp$55

    # block (4)
    # mul tmp$57, 4, tmp$56
    lw $t0, -284($fp)	# tmp$57
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -260($fp)	# tmp$56

    # block (4)
    # add addr(x), tmp$56, tmp$55
    la $t0, _x
    lw $t1, -260($fp)	# tmp$56
    add $t2, $t0, $t1
    sw $t2, -232($fp)	# tmp$55

    # block (4)
    # move deref(tmp$55), tmp$77
    lw $t0, -232($fp)	# tmp$55
    lw $t0, 0($t0)	# deref(tmp$55)
    sw $t0, -312($fp)	# tmp$77

    # block (4)
    # move 1, tmp$78
    li $t0, 1
    sw $t0, -324($fp)	# tmp$78

    # block (4)
    # add deref(tmp$55), 1, tmp$54
    lw $t0, -232($fp)	# tmp$55
    lw $t0, 0($t0)	# deref(tmp$55)
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -204($fp)	# tmp$54

    # block (4)
    # param tmp$54
    lw $t0, -204($fp)	# tmp$54
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call id, 1
    jal _id
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$79
    sw $v0, -332($fp)	# tmp$79

    # block (4)
    # move 1, tmp$80
    li $t0, 1
    sw $t0, -164($fp)	# tmp$80

    # block (4)
    # add tmp$79, 1, tmp$53
    lw $t0, -332($fp)	# tmp$79
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -176($fp)	# tmp$53

    # block (4)
    # move addr(x), tmp$51
    la $t0, _x
    sw $t0, -116($fp)	# tmp$51

    # block (4)
    # mul tmp$53, 4, tmp$52
    lw $t0, -176($fp)	# tmp$53
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -144($fp)	# tmp$52

    # block (4)
    # add addr(x), tmp$52, tmp$51
    la $t0, _x
    lw $t1, -144($fp)	# tmp$52
    add $t2, $t0, $t1
    sw $t2, -116($fp)	# tmp$51

    # block (4)
    # move deref(tmp$51), res
    lw $t0, -116($fp)	# tmp$51
    lw $t0, 0($t0)	# deref(tmp$51)
    sw $t0, -4($fp)	# res

    # block (4)
    # no_op 

    # block (4)
    # param deref(tmp$51)
    lw $t0, -116($fp)	# tmp$51
    lw $t0, 0($t0)	# deref(tmp$51)
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
_x:  .space 40

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

