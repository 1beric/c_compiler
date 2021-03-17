.text
# function main
# formals: 
# locals: u (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); tmp$7 (loc: -36); tmp$8 (loc: -40); tmp$9 (loc: -44); tmp$10 (loc: -48); tmp$20 (loc: -52); tmp$11 (loc: -56); tmp$30 (loc: -60); tmp$21 (loc: -64); tmp$12 (loc: -68); tmp$40 (loc: -72); tmp$31 (loc: -76); tmp$22 (loc: -80); tmp$13 (loc: -84); tmp$41 (loc: -88); tmp$32 (loc: -92); tmp$23 (loc: -96); tmp$14 (loc: -100); tmp$33 (loc: -104); tmp$24 (loc: -108); tmp$15 (loc: -112); tmp$34 (loc: -116); tmp$25 (loc: -120); tmp$16 (loc: -124); tmp$35 (loc: -128); tmp$26 (loc: -132); tmp$17 (loc: -136); tmp$36 (loc: -140); tmp$27 (loc: -144); tmp$18 (loc: -148); tmp$37 (loc: -152); tmp$28 (loc: -156); tmp$19 (loc: -160); tmp$38 (loc: -164); tmp$29 (loc: -168); tmp$39 (loc: -172); 
# space for locals: 172 bytes
#
_main:
    # -LEADER- block (0)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -172($sp)   # allocate stack frame

    # block (0)
    # move 4, tmp$2
    li $t0, 4
    sw $t0, -16($fp)	# tmp$2

    # block (0)
    # move addr(x), tmp$0
    la $t0, _x
    sw $t0, -8($fp)	# tmp$0

    # block (0)
    # move 16, tmp$1
    li $t0, 16
    sw $t0, -12($fp)	# tmp$1

    # block (0)
    # add addr(x), tmp$1, tmp$0
    la $t0, _x
    lw $t1, -12($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -8($fp)	# tmp$0

    # block (0)
    # move 111111, tmp$3
    li $t0, 111111
    sw $t0, -20($fp)	# tmp$3

    # block (0)
    # move 111111, deref(tmp$0)
    li $t0, 111111
    lw $t1, -8($fp)	# tmp$0
    sw $t0, 0($t1)	# deref(tmp$0)

    # block (0)
    # move 5, tmp$6
    li $t0, 5
    sw $t0, -32($fp)	# tmp$6

    # block (0)
    # move addr(x), tmp$4
    la $t0, _x
    sw $t0, -24($fp)	# tmp$4

    # block (0)
    # move 20, tmp$5
    li $t0, 20
    sw $t0, -28($fp)	# tmp$5

    # block (0)
    # add addr(x), tmp$5, tmp$4
    la $t0, _x
    lw $t1, -28($fp)	# tmp$5
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$4

    # block (0)
    # move 222222, tmp$7
    li $t0, 222222
    sw $t0, -36($fp)	# tmp$7

    # block (0)
    # move 222222, deref(tmp$4)
    li $t0, 222222
    lw $t1, -24($fp)	# tmp$4
    sw $t0, 0($t1)	# deref(tmp$4)

    # block (0)
    # move 6, tmp$10
    li $t0, 6
    sw $t0, -48($fp)	# tmp$10

    # block (0)
    # move addr(x), tmp$8
    la $t0, _x
    sw $t0, -40($fp)	# tmp$8

    # block (0)
    # move 24, tmp$9
    li $t0, 24
    sw $t0, -44($fp)	# tmp$9

    # block (0)
    # add addr(x), tmp$9, tmp$8
    la $t0, _x
    lw $t1, -44($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$8

    # block (0)
    # move 333333, tmp$11
    li $t0, 333333
    sw $t0, -56($fp)	# tmp$11

    # block (0)
    # move 333333, deref(tmp$8)
    li $t0, 333333
    lw $t1, -40($fp)	# tmp$8
    sw $t0, 0($t1)	# deref(tmp$8)

    # block (0)
    # move 7, tmp$14
    li $t0, 7
    sw $t0, -100($fp)	# tmp$14

    # block (0)
    # move addr(y), tmp$12
    la $t0, _y
    sw $t0, -68($fp)	# tmp$12

    # block (0)
    # move 28, tmp$13
    li $t0, 28
    sw $t0, -84($fp)	# tmp$13

    # block (0)
    # add addr(y), tmp$13, tmp$12
    la $t0, _y
    lw $t1, -84($fp)	# tmp$13
    add $t2, $t0, $t1
    sw $t2, -68($fp)	# tmp$12

    # block (0)
    # move 444444, tmp$15
    li $t0, 444444
    sw $t0, -112($fp)	# tmp$15

    # block (0)
    # move 444444, deref(tmp$12)
    li $t0, 444444
    lw $t1, -68($fp)	# tmp$12
    sw $t0, 0($t1)	# deref(tmp$12)

    # block (0)
    # move 8, tmp$18
    li $t0, 8
    sw $t0, -148($fp)	# tmp$18

    # block (0)
    # move addr(y), tmp$16
    la $t0, _y
    sw $t0, -124($fp)	# tmp$16

    # block (0)
    # move 32, tmp$17
    li $t0, 32
    sw $t0, -136($fp)	# tmp$17

    # block (0)
    # add addr(y), tmp$17, tmp$16
    la $t0, _y
    lw $t1, -136($fp)	# tmp$17
    add $t2, $t0, $t1
    sw $t2, -124($fp)	# tmp$16

    # block (0)
    # move 555555, tmp$19
    li $t0, 555555
    sw $t0, -160($fp)	# tmp$19

    # block (0)
    # move 555555, deref(tmp$16)
    li $t0, 555555
    lw $t1, -124($fp)	# tmp$16
    sw $t0, 0($t1)	# deref(tmp$16)

    # block (0)
    # move 9, tmp$22
    li $t0, 9
    sw $t0, -80($fp)	# tmp$22

    # block (0)
    # move addr(y), tmp$20
    la $t0, _y
    sw $t0, -52($fp)	# tmp$20

    # block (0)
    # move 36, tmp$21
    li $t0, 36
    sw $t0, -64($fp)	# tmp$21

    # block (0)
    # add addr(y), tmp$21, tmp$20
    la $t0, _y
    lw $t1, -64($fp)	# tmp$21
    add $t2, $t0, $t1
    sw $t2, -52($fp)	# tmp$20

    # block (0)
    # move 666666, tmp$23
    li $t0, 666666
    sw $t0, -96($fp)	# tmp$23

    # block (0)
    # move 666666, deref(tmp$20)
    li $t0, 666666
    lw $t1, -52($fp)	# tmp$20
    sw $t0, 0($t1)	# deref(tmp$20)

    # block (0)
    # no_op 

    # block (0)
    # move 4, tmp$26
    li $t0, 4
    sw $t0, -132($fp)	# tmp$26

    # block (0)
    # move addr(x), tmp$24
    la $t0, _x
    sw $t0, -108($fp)	# tmp$24

    # block (0)
    # move 16, tmp$25
    li $t0, 16
    sw $t0, -120($fp)	# tmp$25

    # block (0)
    # add addr(x), tmp$25, tmp$24
    la $t0, _x
    lw $t1, -120($fp)	# tmp$25
    add $t2, $t0, $t1
    sw $t2, -108($fp)	# tmp$24

    # block (0)
    # move deref(tmp$24), u
    lw $t0, -108($fp)	# tmp$24
    lw $t0, 0($t0)	# deref(tmp$24)
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param deref(tmp$24)
    lw $t0, -108($fp)	# tmp$24
    lw $t0, 0($t0)	# deref(tmp$24)
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
    # move 5, tmp$29
    li $t0, 5
    sw $t0, -168($fp)	# tmp$29

    # block (0)
    # move addr(x), tmp$27
    la $t0, _x
    sw $t0, -144($fp)	# tmp$27

    # block (0)
    # move 20, tmp$28
    li $t0, 20
    sw $t0, -156($fp)	# tmp$28

    # block (0)
    # add addr(x), tmp$28, tmp$27
    la $t0, _x
    lw $t1, -156($fp)	# tmp$28
    add $t2, $t0, $t1
    sw $t2, -144($fp)	# tmp$27

    # block (0)
    # move deref(tmp$27), u
    lw $t0, -144($fp)	# tmp$27
    lw $t0, 0($t0)	# deref(tmp$27)
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param deref(tmp$27)
    lw $t0, -144($fp)	# tmp$27
    lw $t0, 0($t0)	# deref(tmp$27)
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
    # move 6, tmp$32
    li $t0, 6
    sw $t0, -92($fp)	# tmp$32

    # block (0)
    # move addr(x), tmp$30
    la $t0, _x
    sw $t0, -60($fp)	# tmp$30

    # block (0)
    # move 24, tmp$31
    li $t0, 24
    sw $t0, -76($fp)	# tmp$31

    # block (0)
    # add addr(x), tmp$31, tmp$30
    la $t0, _x
    lw $t1, -76($fp)	# tmp$31
    add $t2, $t0, $t1
    sw $t2, -60($fp)	# tmp$30

    # block (0)
    # move deref(tmp$30), u
    lw $t0, -60($fp)	# tmp$30
    lw $t0, 0($t0)	# deref(tmp$30)
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param deref(tmp$30)
    lw $t0, -60($fp)	# tmp$30
    lw $t0, 0($t0)	# deref(tmp$30)
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
    # move 7, tmp$35
    li $t0, 7
    sw $t0, -128($fp)	# tmp$35

    # block (0)
    # move addr(y), tmp$33
    la $t0, _y
    sw $t0, -104($fp)	# tmp$33

    # block (0)
    # move 28, tmp$34
    li $t0, 28
    sw $t0, -116($fp)	# tmp$34

    # block (0)
    # add addr(y), tmp$34, tmp$33
    la $t0, _y
    lw $t1, -116($fp)	# tmp$34
    add $t2, $t0, $t1
    sw $t2, -104($fp)	# tmp$33

    # block (0)
    # move deref(tmp$33), u
    lw $t0, -104($fp)	# tmp$33
    lw $t0, 0($t0)	# deref(tmp$33)
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param deref(tmp$33)
    lw $t0, -104($fp)	# tmp$33
    lw $t0, 0($t0)	# deref(tmp$33)
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
    # move 8, tmp$38
    li $t0, 8
    sw $t0, -164($fp)	# tmp$38

    # block (0)
    # move addr(y), tmp$36
    la $t0, _y
    sw $t0, -140($fp)	# tmp$36

    # block (0)
    # move 32, tmp$37
    li $t0, 32
    sw $t0, -152($fp)	# tmp$37

    # block (0)
    # add addr(y), tmp$37, tmp$36
    la $t0, _y
    lw $t1, -152($fp)	# tmp$37
    add $t2, $t0, $t1
    sw $t2, -140($fp)	# tmp$36

    # block (0)
    # move deref(tmp$36), u
    lw $t0, -140($fp)	# tmp$36
    lw $t0, 0($t0)	# deref(tmp$36)
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param deref(tmp$36)
    lw $t0, -140($fp)	# tmp$36
    lw $t0, 0($t0)	# deref(tmp$36)
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
    # move 9, tmp$41
    li $t0, 9
    sw $t0, -88($fp)	# tmp$41

    # block (0)
    # move addr(y), tmp$39
    la $t0, _y
    sw $t0, -172($fp)	# tmp$39

    # block (0)
    # move 36, tmp$40
    li $t0, 36
    sw $t0, -72($fp)	# tmp$40

    # block (0)
    # add addr(y), tmp$40, tmp$39
    la $t0, _y
    lw $t1, -72($fp)	# tmp$40
    add $t2, $t0, $t1
    sw $t2, -172($fp)	# tmp$39

    # block (0)
    # move deref(tmp$39), u
    lw $t0, -172($fp)	# tmp$39
    lw $t0, 0($t0)	# deref(tmp$39)
    sw $t0, -4($fp)	# u

    # block (0)
    # no_op 

    # block (0)
    # param deref(tmp$39)
    lw $t0, -172($fp)	# tmp$39
    lw $t0, 0($t0)	# deref(tmp$39)
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
.align 2
_x:  .space 40
.align 2
_y:  .space 40
.align 2
_z:  .space 40

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

