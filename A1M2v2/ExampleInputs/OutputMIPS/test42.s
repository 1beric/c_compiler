.text
# function copy
# formals: a (loc: 8); b (loc: 12); 
# locals: i (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -21); tmp$5 (loc: -28); tmp$6 (loc: -32); tmp$7 (loc: -36); tmp$8 (loc: -40); tmp$9 (loc: -44); tmp$10 (loc: -48); tmp$11 (loc: -52); tmp$12 (loc: -56); tmp$13 (loc: -60); tmp$14 (loc: -64); 
# space for locals: 64 bytes
#
_copy:
    # enter copy
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -64($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$0
    li $t0, 0
    sw $t0, -8($fp)	# tmp$0

    # move tmp$0, i
    lw $t0, -8($fp)	# tmp$0
    sw $t0, -4($fp)	# i

    # no_op 

    # move 0, tmp$1
    li $t0, 0
    sw $t0, -12($fp)	# tmp$1

    # move tmp$1, i
    lw $t0, -12($fp)	# tmp$1
    sw $t0, -4($fp)	# i

    # label 0
Lbl0:

    # no_op 

    # move a, tmp$2
    lw $t0, 8($fp)	# a
    sw $t0, -16($fp)	# tmp$2

    # mul i, 1, tmp$3
    lw $t0, -4($fp)	# i
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$3

    # add tmp$2, tmp$3, tmp$2
    lw $t0, -16($fp)	# tmp$2
    lw $t1, -20($fp)	# tmp$3
    add $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$2

    # move deref(tmp$2), tmp$4
    lw $t0, -16($fp)	# tmp$2
    lb $t0, 0($t0)	# deref(tmp$2)
    sb $t0, -21($fp)	# tmp$4

    # move 0, tmp$5
    li $t0, 0
    sw $t0, -28($fp)	# tmp$5

    # if_gt tmp$4, tmp$5, label 1
    lb $t0, -21($fp)	# tmp$4
    lw $t1, -28($fp)	# tmp$5
    bgt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move b, tmp$8
    lw $t0, 12($fp)	# b
    sw $t0, -40($fp)	# tmp$8

    # mul i, 1, tmp$9
    lw $t0, -4($fp)	# i
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -44($fp)	# tmp$9

    # add tmp$8, tmp$9, tmp$8
    lw $t0, -40($fp)	# tmp$8
    lw $t1, -44($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$8

    # no_op 

    # move a, tmp$10
    lw $t0, 8($fp)	# a
    sw $t0, -48($fp)	# tmp$10

    # mul i, 1, tmp$11
    lw $t0, -4($fp)	# i
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -52($fp)	# tmp$11

    # add tmp$10, tmp$11, tmp$10
    lw $t0, -48($fp)	# tmp$10
    lw $t1, -52($fp)	# tmp$11
    add $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$10

    # move deref(tmp$10), deref(tmp$8)
    lw $t0, -48($fp)	# tmp$10
    lb $t0, 0($t0)	# deref(tmp$10)
    lw $t1, -40($fp)	# tmp$8
    sb $t0, 0($t1)	# deref(tmp$8)

    # no_op 

    # no_op 

    # move 1, tmp$7
    li $t0, 1
    sw $t0, -36($fp)	# tmp$7

    # add i, tmp$7, tmp$6
    lw $t0, -4($fp)	# i
    lw $t1, -36($fp)	# tmp$7
    add $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$6

    # move tmp$6, i
    lw $t0, -32($fp)	# tmp$6
    sw $t0, -4($fp)	# i

    # goto label 0
    j Lbl0

    # label 2
Lbl2:

    # no_op 

    # move b, tmp$12
    lw $t0, 12($fp)	# b
    sw $t0, -56($fp)	# tmp$12

    # mul i, 1, tmp$13
    lw $t0, -4($fp)	# i
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -60($fp)	# tmp$13

    # add tmp$12, tmp$13, tmp$12
    lw $t0, -56($fp)	# tmp$12
    lw $t1, -60($fp)	# tmp$13
    add $t2, $t0, $t1
    sw $t2, -56($fp)	# tmp$12

    # move 0, tmp$14
    li $t0, 0
    sw $t0, -64($fp)	# tmp$14

    # move tmp$14, deref(tmp$12)
    lw $t0, -64($fp)	# tmp$14
    lw $t1, -56($fp)	# tmp$12
    sb $t0, 0($t1)	# deref(tmp$12)

    # no_op 

    # leave copy

    # ret i
    lw $v0, -4($fp)	# i
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave copy

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function copy

.text
# function sum
# formals: b (loc: 8); 
# locals: sum (loc: -4); i (loc: -8); tmp$20 (loc: -12); tmp$21 (loc: -16); tmp$22 (loc: -20); tmp$23 (loc: -24); tmp$24 (loc: -25); tmp$15 (loc: -32); tmp$25 (loc: -36); tmp$16 (loc: -40); tmp$26 (loc: -44); tmp$17 (loc: -48); tmp$18 (loc: -52); tmp$19 (loc: -53); 
# space for locals: 56 bytes
#
_sum:
    # enter sum
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -56($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$15
    li $t0, 0
    sw $t0, -32($fp)	# tmp$15

    # move tmp$15, i
    lw $t0, -32($fp)	# tmp$15
    sw $t0, -8($fp)	# i

    # no_op 

    # move 0, tmp$16
    li $t0, 0
    sw $t0, -40($fp)	# tmp$16

    # move tmp$16, sum
    lw $t0, -40($fp)	# tmp$16
    sw $t0, -4($fp)	# sum

    # label 3
Lbl3:

    # no_op 

    # move b, tmp$17
    lw $t0, 8($fp)	# b
    sw $t0, -48($fp)	# tmp$17

    # mul i, 1, tmp$18
    lw $t0, -8($fp)	# i
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -52($fp)	# tmp$18

    # add tmp$17, tmp$18, tmp$17
    lw $t0, -48($fp)	# tmp$17
    lw $t1, -52($fp)	# tmp$18
    add $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$17

    # move deref(tmp$17), tmp$19
    lw $t0, -48($fp)	# tmp$17
    lb $t0, 0($t0)	# deref(tmp$17)
    sb $t0, -53($fp)	# tmp$19

    # move 0, tmp$20
    li $t0, 0
    sw $t0, -12($fp)	# tmp$20

    # if_gt tmp$19, tmp$20, label 4
    lb $t0, -53($fp)	# tmp$19
    lw $t1, -12($fp)	# tmp$20
    bgt $t0, $t1, Lbl4

    # goto label 5
    j Lbl5

    # label 4
Lbl4:

    # no_op 

    # no_op 

    # no_op 

    # move b, tmp$22
    lw $t0, 8($fp)	# b
    sw $t0, -20($fp)	# tmp$22

    # mul i, 1, tmp$23
    lw $t0, -8($fp)	# i
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$23

    # add tmp$22, tmp$23, tmp$22
    lw $t0, -20($fp)	# tmp$22
    lw $t1, -24($fp)	# tmp$23
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$22

    # move deref(tmp$22), tmp$24
    lw $t0, -20($fp)	# tmp$22
    lb $t0, 0($t0)	# deref(tmp$22)
    sb $t0, -25($fp)	# tmp$24

    # add sum, tmp$24, tmp$21
    lw $t0, -4($fp)	# sum
    lb $t1, -25($fp)	# tmp$24
    add $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$21

    # move tmp$21, sum
    lw $t0, -16($fp)	# tmp$21
    sw $t0, -4($fp)	# sum

    # no_op 

    # no_op 

    # move 1, tmp$26
    li $t0, 1
    sw $t0, -44($fp)	# tmp$26

    # add i, tmp$26, tmp$25
    lw $t0, -8($fp)	# i
    lw $t1, -44($fp)	# tmp$26
    add $t2, $t0, $t1
    sw $t2, -36($fp)	# tmp$25

    # move tmp$25, i
    lw $t0, -36($fp)	# tmp$25
    sw $t0, -8($fp)	# i

    # goto label 3
    j Lbl3

    # label 5
Lbl5:

    # no_op 

    # leave sum

    # ret sum
    lw $v0, -4($fp)	# sum
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave sum

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function sum

.text
# function main
# formals: 
# locals: y (loc: -4); tmp$27 (loc: -8); tmp$28 (loc: -12); tmp$29 (loc: -16); 
# space for locals: 16 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -16($sp)   # allocate stack frame

    # no_op 

    # no_op 

    # no_op 

    # param addr(x)
    la $t0, _x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param addr(_Str0)
    la $t0, __Str0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call copy, 2
    jal _copy
    la $sp, 8($sp)

    # retrieve tmp$27
    sw $v0, -8($fp)	# tmp$27

    # move tmp$27, y
    lw $t0, -8($fp)	# tmp$27
    sw $t0, -4($fp)	# y

    # no_op 

    # no_op 

    # no_op 

    # param addr(x)
    la $t0, _x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call sum, 1
    jal _sum
    la $sp, 4($sp)

    # retrieve tmp$29
    sw $v0, -16($fp)	# tmp$29

    # add y, tmp$29, tmp$28
    lw $t0, -4($fp)	# y
    lw $t1, -16($fp)	# tmp$29
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$28

    # move tmp$28, y
    lw $t0, -12($fp)	# tmp$28
    sw $t0, -4($fp)	# y

    # no_op 

    # param y
    lw $t0, -4($fp)	# y
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
_x:  .space 15

__Str0: .asciiz "hello world"
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

