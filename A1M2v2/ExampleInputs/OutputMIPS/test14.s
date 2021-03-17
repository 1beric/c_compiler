.text
# function main
# formals: 
# locals: u (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); tmp$7 (loc: -36); tmp$8 (loc: -40); tmp$9 (loc: -44); tmp$10 (loc: -48); tmp$20 (loc: -52); tmp$11 (loc: -56); tmp$30 (loc: -60); tmp$21 (loc: -64); tmp$12 (loc: -68); tmp$40 (loc: -72); tmp$31 (loc: -76); tmp$22 (loc: -80); tmp$13 (loc: -84); tmp$50 (loc: -88); tmp$41 (loc: -92); tmp$32 (loc: -96); tmp$23 (loc: -100); tmp$14 (loc: -104); tmp$60 (loc: -108); tmp$51 (loc: -112); tmp$42 (loc: -116); tmp$33 (loc: -120); tmp$24 (loc: -124); tmp$15 (loc: -128); tmp$61 (loc: -132); tmp$52 (loc: -136); tmp$43 (loc: -140); tmp$34 (loc: -144); tmp$25 (loc: -148); tmp$16 (loc: -152); tmp$62 (loc: -156); tmp$53 (loc: -160); tmp$44 (loc: -164); tmp$35 (loc: -168); tmp$26 (loc: -172); tmp$17 (loc: -176); tmp$63 (loc: -180); tmp$54 (loc: -184); tmp$45 (loc: -188); tmp$36 (loc: -192); tmp$27 (loc: -196); tmp$18 (loc: -200); tmp$64 (loc: -204); tmp$55 (loc: -208); tmp$46 (loc: -212); tmp$37 (loc: -216); tmp$28 (loc: -220); tmp$19 (loc: -224); tmp$65 (loc: -228); tmp$56 (loc: -232); tmp$47 (loc: -236); tmp$38 (loc: -240); tmp$29 (loc: -244); tmp$66 (loc: -248); tmp$57 (loc: -252); tmp$48 (loc: -256); tmp$39 (loc: -260); tmp$67 (loc: -264); tmp$58 (loc: -268); tmp$49 (loc: -272); tmp$68 (loc: -276); tmp$59 (loc: -280); tmp$69 (loc: -284); 
# space for locals: 284 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -284($sp)   # allocate stack frame

    # move 0, tmp$2
    li $t0, 0
    sw $t0, -16($fp)	# tmp$2

    # move addr(x), tmp$0
    la $t0, _x
    sw $t0, -8($fp)	# tmp$0

    # mul tmp$2, 4, tmp$1
    lw $t0, -16($fp)	# tmp$2
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$1

    # add tmp$0, tmp$1, tmp$0
    lw $t0, -8($fp)	# tmp$0
    lw $t1, -12($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -8($fp)	# tmp$0

    # move 1, tmp$3
    li $t0, 1
    sw $t0, -20($fp)	# tmp$3

    # move tmp$3, deref(tmp$0)
    lw $t0, -20($fp)	# tmp$3
    lw $t1, -8($fp)	# tmp$0
    sw $t0, 0($t1)	# deref(tmp$0)

    # move 1, tmp$6
    li $t0, 1
    sw $t0, -32($fp)	# tmp$6

    # move addr(x), tmp$4
    la $t0, _x
    sw $t0, -24($fp)	# tmp$4

    # mul tmp$6, 4, tmp$5
    lw $t0, -32($fp)	# tmp$6
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$5

    # add tmp$4, tmp$5, tmp$4
    lw $t0, -24($fp)	# tmp$4
    lw $t1, -28($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$4

    # move 2, tmp$7
    li $t0, 2
    sw $t0, -36($fp)	# tmp$7

    # move tmp$7, deref(tmp$4)
    lw $t0, -36($fp)	# tmp$7
    lw $t1, -24($fp)	# tmp$4
    sw $t0, 0($t1)	# deref(tmp$4)

    # move 2, tmp$10
    li $t0, 2
    sw $t0, -48($fp)	# tmp$10

    # move addr(x), tmp$8
    la $t0, _x
    sw $t0, -40($fp)	# tmp$8

    # mul tmp$10, 4, tmp$9
    lw $t0, -48($fp)	# tmp$10
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -44($fp)	# tmp$9

    # add tmp$8, tmp$9, tmp$8
    lw $t0, -40($fp)	# tmp$8
    lw $t1, -44($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$8

    # move 3, tmp$11
    li $t0, 3
    sw $t0, -56($fp)	# tmp$11

    # move tmp$11, deref(tmp$8)
    lw $t0, -56($fp)	# tmp$11
    lw $t1, -40($fp)	# tmp$8
    sw $t0, 0($t1)	# deref(tmp$8)

    # move 3, tmp$14
    li $t0, 3
    sw $t0, -104($fp)	# tmp$14

    # move addr(x), tmp$12
    la $t0, _x
    sw $t0, -68($fp)	# tmp$12

    # mul tmp$14, 4, tmp$13
    lw $t0, -104($fp)	# tmp$14
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -84($fp)	# tmp$13

    # add tmp$12, tmp$13, tmp$12
    lw $t0, -68($fp)	# tmp$12
    lw $t1, -84($fp)	# tmp$13
    add $t2, $t0, $t1
    sw $t2, -68($fp)	# tmp$12

    # move 4, tmp$15
    li $t0, 4
    sw $t0, -128($fp)	# tmp$15

    # move tmp$15, deref(tmp$12)
    lw $t0, -128($fp)	# tmp$15
    lw $t1, -68($fp)	# tmp$12
    sw $t0, 0($t1)	# deref(tmp$12)

    # move 4, tmp$18
    li $t0, 4
    sw $t0, -200($fp)	# tmp$18

    # move addr(x), tmp$16
    la $t0, _x
    sw $t0, -152($fp)	# tmp$16

    # mul tmp$18, 4, tmp$17
    lw $t0, -200($fp)	# tmp$18
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -176($fp)	# tmp$17

    # add tmp$16, tmp$17, tmp$16
    lw $t0, -152($fp)	# tmp$16
    lw $t1, -176($fp)	# tmp$17
    add $t2, $t0, $t1
    sw $t2, -152($fp)	# tmp$16

    # move 5, tmp$19
    li $t0, 5
    sw $t0, -224($fp)	# tmp$19

    # move tmp$19, deref(tmp$16)
    lw $t0, -224($fp)	# tmp$19
    lw $t1, -152($fp)	# tmp$16
    sw $t0, 0($t1)	# deref(tmp$16)

    # move 5, tmp$22
    li $t0, 5
    sw $t0, -80($fp)	# tmp$22

    # move addr(x), tmp$20
    la $t0, _x
    sw $t0, -52($fp)	# tmp$20

    # mul tmp$22, 4, tmp$21
    lw $t0, -80($fp)	# tmp$22
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -64($fp)	# tmp$21

    # add tmp$20, tmp$21, tmp$20
    lw $t0, -52($fp)	# tmp$20
    lw $t1, -64($fp)	# tmp$21
    add $t2, $t0, $t1
    sw $t2, -52($fp)	# tmp$20

    # move 6, tmp$23
    li $t0, 6
    sw $t0, -100($fp)	# tmp$23

    # move tmp$23, deref(tmp$20)
    lw $t0, -100($fp)	# tmp$23
    lw $t1, -52($fp)	# tmp$20
    sw $t0, 0($t1)	# deref(tmp$20)

    # move 6, tmp$26
    li $t0, 6
    sw $t0, -172($fp)	# tmp$26

    # move addr(x), tmp$24
    la $t0, _x
    sw $t0, -124($fp)	# tmp$24

    # mul tmp$26, 4, tmp$25
    lw $t0, -172($fp)	# tmp$26
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -148($fp)	# tmp$25

    # add tmp$24, tmp$25, tmp$24
    lw $t0, -124($fp)	# tmp$24
    lw $t1, -148($fp)	# tmp$25
    add $t2, $t0, $t1
    sw $t2, -124($fp)	# tmp$24

    # move 7, tmp$27
    li $t0, 7
    sw $t0, -196($fp)	# tmp$27

    # move tmp$27, deref(tmp$24)
    lw $t0, -196($fp)	# tmp$27
    lw $t1, -124($fp)	# tmp$24
    sw $t0, 0($t1)	# deref(tmp$24)

    # move 7, tmp$30
    li $t0, 7
    sw $t0, -60($fp)	# tmp$30

    # move addr(x), tmp$28
    la $t0, _x
    sw $t0, -220($fp)	# tmp$28

    # mul tmp$30, 4, tmp$29
    lw $t0, -60($fp)	# tmp$30
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -244($fp)	# tmp$29

    # add tmp$28, tmp$29, tmp$28
    lw $t0, -220($fp)	# tmp$28
    lw $t1, -244($fp)	# tmp$29
    add $t2, $t0, $t1
    sw $t2, -220($fp)	# tmp$28

    # move 8, tmp$31
    li $t0, 8
    sw $t0, -76($fp)	# tmp$31

    # move tmp$31, deref(tmp$28)
    lw $t0, -76($fp)	# tmp$31
    lw $t1, -220($fp)	# tmp$28
    sw $t0, 0($t1)	# deref(tmp$28)

    # move 8, tmp$34
    li $t0, 8
    sw $t0, -144($fp)	# tmp$34

    # move addr(x), tmp$32
    la $t0, _x
    sw $t0, -96($fp)	# tmp$32

    # mul tmp$34, 4, tmp$33
    lw $t0, -144($fp)	# tmp$34
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -120($fp)	# tmp$33

    # add tmp$32, tmp$33, tmp$32
    lw $t0, -96($fp)	# tmp$32
    lw $t1, -120($fp)	# tmp$33
    add $t2, $t0, $t1
    sw $t2, -96($fp)	# tmp$32

    # move 9, tmp$35
    li $t0, 9
    sw $t0, -168($fp)	# tmp$35

    # move tmp$35, deref(tmp$32)
    lw $t0, -168($fp)	# tmp$35
    lw $t1, -96($fp)	# tmp$32
    sw $t0, 0($t1)	# deref(tmp$32)

    # move 9, tmp$38
    li $t0, 9
    sw $t0, -240($fp)	# tmp$38

    # move addr(x), tmp$36
    la $t0, _x
    sw $t0, -192($fp)	# tmp$36

    # mul tmp$38, 4, tmp$37
    lw $t0, -240($fp)	# tmp$38
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -216($fp)	# tmp$37

    # add tmp$36, tmp$37, tmp$36
    lw $t0, -192($fp)	# tmp$36
    lw $t1, -216($fp)	# tmp$37
    add $t2, $t0, $t1
    sw $t2, -192($fp)	# tmp$36

    # move 10, tmp$39
    li $t0, 10
    sw $t0, -260($fp)	# tmp$39

    # move tmp$39, deref(tmp$36)
    lw $t0, -260($fp)	# tmp$39
    lw $t1, -192($fp)	# tmp$36
    sw $t0, 0($t1)	# deref(tmp$36)

    # no_op 

    # move 0, tmp$60
    li $t0, 0
    sw $t0, -108($fp)	# tmp$60

    # move addr(x), tmp$58
    la $t0, _x
    sw $t0, -268($fp)	# tmp$58

    # mul tmp$60, 4, tmp$59
    lw $t0, -108($fp)	# tmp$60
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -280($fp)	# tmp$59

    # add tmp$58, tmp$59, tmp$58
    lw $t0, -268($fp)	# tmp$58
    lw $t1, -280($fp)	# tmp$59
    add $t2, $t0, $t1
    sw $t2, -268($fp)	# tmp$58

    # move deref(tmp$58), tmp$61
    lw $t0, -268($fp)	# tmp$58
    lw $t0, 0($t0)	# deref(tmp$58)
    sw $t0, -132($fp)	# tmp$61

    # move addr(x), tmp$56
    la $t0, _x
    sw $t0, -232($fp)	# tmp$56

    # mul tmp$61, 4, tmp$57
    lw $t0, -132($fp)	# tmp$61
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -252($fp)	# tmp$57

    # add tmp$56, tmp$57, tmp$56
    lw $t0, -232($fp)	# tmp$56
    lw $t1, -252($fp)	# tmp$57
    add $t2, $t0, $t1
    sw $t2, -232($fp)	# tmp$56

    # move deref(tmp$56), tmp$62
    lw $t0, -232($fp)	# tmp$56
    lw $t0, 0($t0)	# deref(tmp$56)
    sw $t0, -156($fp)	# tmp$62

    # move addr(x), tmp$54
    la $t0, _x
    sw $t0, -184($fp)	# tmp$54

    # mul tmp$62, 4, tmp$55
    lw $t0, -156($fp)	# tmp$62
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -208($fp)	# tmp$55

    # add tmp$54, tmp$55, tmp$54
    lw $t0, -184($fp)	# tmp$54
    lw $t1, -208($fp)	# tmp$55
    add $t2, $t0, $t1
    sw $t2, -184($fp)	# tmp$54

    # move deref(tmp$54), tmp$63
    lw $t0, -184($fp)	# tmp$54
    lw $t0, 0($t0)	# deref(tmp$54)
    sw $t0, -180($fp)	# tmp$63

    # move addr(x), tmp$52
    la $t0, _x
    sw $t0, -136($fp)	# tmp$52

    # mul tmp$63, 4, tmp$53
    lw $t0, -180($fp)	# tmp$63
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -160($fp)	# tmp$53

    # add tmp$52, tmp$53, tmp$52
    lw $t0, -136($fp)	# tmp$52
    lw $t1, -160($fp)	# tmp$53
    add $t2, $t0, $t1
    sw $t2, -136($fp)	# tmp$52

    # move deref(tmp$52), tmp$64
    lw $t0, -136($fp)	# tmp$52
    lw $t0, 0($t0)	# deref(tmp$52)
    sw $t0, -204($fp)	# tmp$64

    # move addr(x), tmp$50
    la $t0, _x
    sw $t0, -88($fp)	# tmp$50

    # mul tmp$64, 4, tmp$51
    lw $t0, -204($fp)	# tmp$64
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -112($fp)	# tmp$51

    # add tmp$50, tmp$51, tmp$50
    lw $t0, -88($fp)	# tmp$50
    lw $t1, -112($fp)	# tmp$51
    add $t2, $t0, $t1
    sw $t2, -88($fp)	# tmp$50

    # move deref(tmp$50), tmp$65
    lw $t0, -88($fp)	# tmp$50
    lw $t0, 0($t0)	# deref(tmp$50)
    sw $t0, -228($fp)	# tmp$65

    # move addr(x), tmp$48
    la $t0, _x
    sw $t0, -256($fp)	# tmp$48

    # mul tmp$65, 4, tmp$49
    lw $t0, -228($fp)	# tmp$65
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -272($fp)	# tmp$49

    # add tmp$48, tmp$49, tmp$48
    lw $t0, -256($fp)	# tmp$48
    lw $t1, -272($fp)	# tmp$49
    add $t2, $t0, $t1
    sw $t2, -256($fp)	# tmp$48

    # move deref(tmp$48), tmp$66
    lw $t0, -256($fp)	# tmp$48
    lw $t0, 0($t0)	# deref(tmp$48)
    sw $t0, -248($fp)	# tmp$66

    # move addr(x), tmp$46
    la $t0, _x
    sw $t0, -212($fp)	# tmp$46

    # mul tmp$66, 4, tmp$47
    lw $t0, -248($fp)	# tmp$66
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -236($fp)	# tmp$47

    # add tmp$46, tmp$47, tmp$46
    lw $t0, -212($fp)	# tmp$46
    lw $t1, -236($fp)	# tmp$47
    add $t2, $t0, $t1
    sw $t2, -212($fp)	# tmp$46

    # move deref(tmp$46), tmp$67
    lw $t0, -212($fp)	# tmp$46
    lw $t0, 0($t0)	# deref(tmp$46)
    sw $t0, -264($fp)	# tmp$67

    # move addr(x), tmp$44
    la $t0, _x
    sw $t0, -164($fp)	# tmp$44

    # mul tmp$67, 4, tmp$45
    lw $t0, -264($fp)	# tmp$67
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -188($fp)	# tmp$45

    # add tmp$44, tmp$45, tmp$44
    lw $t0, -164($fp)	# tmp$44
    lw $t1, -188($fp)	# tmp$45
    add $t2, $t0, $t1
    sw $t2, -164($fp)	# tmp$44

    # move deref(tmp$44), tmp$68
    lw $t0, -164($fp)	# tmp$44
    lw $t0, 0($t0)	# deref(tmp$44)
    sw $t0, -276($fp)	# tmp$68

    # move addr(x), tmp$42
    la $t0, _x
    sw $t0, -116($fp)	# tmp$42

    # mul tmp$68, 4, tmp$43
    lw $t0, -276($fp)	# tmp$68
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -140($fp)	# tmp$43

    # add tmp$42, tmp$43, tmp$42
    lw $t0, -116($fp)	# tmp$42
    lw $t1, -140($fp)	# tmp$43
    add $t2, $t0, $t1
    sw $t2, -116($fp)	# tmp$42

    # move deref(tmp$42), tmp$69
    lw $t0, -116($fp)	# tmp$42
    lw $t0, 0($t0)	# deref(tmp$42)
    sw $t0, -284($fp)	# tmp$69

    # move addr(x), tmp$40
    la $t0, _x
    sw $t0, -72($fp)	# tmp$40

    # mul tmp$69, 4, tmp$41
    lw $t0, -284($fp)	# tmp$69
    li $t1, 4
    mul $t2, $t0, $t1
    sw $t2, -92($fp)	# tmp$41

    # add tmp$40, tmp$41, tmp$40
    lw $t0, -72($fp)	# tmp$40
    lw $t1, -92($fp)	# tmp$41
    add $t2, $t0, $t1
    sw $t2, -72($fp)	# tmp$40

    # move deref(tmp$40), u
    lw $t0, -72($fp)	# tmp$40
    lw $t0, 0($t0)	# deref(tmp$40)
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

