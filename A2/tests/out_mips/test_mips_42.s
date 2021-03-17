.text
# function copy
# formals: a (loc: 8); b (loc: 12); 
# locals: i (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -21); tmp$5 (loc: -28); tmp$6 (loc: -32); tmp$7 (loc: -36); tmp$8 (loc: -40); tmp$9 (loc: -44); tmp$10 (loc: -48); tmp$11 (loc: -52); tmp$12 (loc: -56); tmp$13 (loc: -60); tmp$14 (loc: -64); 
# space for locals: 64 bytes
#
_copy:
    # -LEADER- block (0)
    # enter copy
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -64($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$0
    li $t0, 0
    sw $t0, -8($fp)	# tmp$0

    # block (0)
    # move 0, i
    li $t0, 0
    sw $t0, -4($fp)	# i

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$1
    li $t0, 0
    sw $t0, -12($fp)	# tmp$1

    # block (0)
    # move 0, i
    li $t0, 0
    sw $t0, -4($fp)	# i

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # no_op 

    # block (1)
    # move a, tmp$2
    lw $t0, 8($fp)	# a
    sw $t0, -16($fp)	# tmp$2

    # block (1)
    # move i, tmp$3
    lw $t0, -4($fp)	# i
    sw $t0, -20($fp)	# tmp$3

    # block (1)
    # add a, tmp$3, tmp$2
    lw $t0, 8($fp)	# a
    lw $t1, -20($fp)	# tmp$3
    add $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$2

    # block (1)
    # move deref(tmp$2), tmp$4
    lw $t0, -16($fp)	# tmp$2
    lb $t0, 0($t0)	# deref(tmp$2)
    sb $t0, -21($fp)	# tmp$4

    # block (1)
    # move 0, tmp$5
    li $t0, 0
    sw $t0, -28($fp)	# tmp$5

    # block (1)
    # if_le tmp$4, 0, label 2
    lb $t0, -21($fp)	# tmp$4
    li $t1, 0
    ble $t0, $t1, Lbl2

    # -LEADER- block (2)
    # label 1
Lbl1:

    # block (2)
    # no_op 

    # block (2)
    # move b, tmp$8
    lw $t0, 12($fp)	# b
    sw $t0, -40($fp)	# tmp$8

    # block (2)
    # move i, tmp$9
    lw $t0, -4($fp)	# i
    sw $t0, -44($fp)	# tmp$9

    # block (2)
    # add b, tmp$9, tmp$8
    lw $t0, 12($fp)	# b
    lw $t1, -44($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -40($fp)	# tmp$8

    # block (2)
    # no_op 

    # block (2)
    # move a, tmp$10
    lw $t0, 8($fp)	# a
    sw $t0, -48($fp)	# tmp$10

    # block (2)
    # move i, tmp$11
    lw $t0, -4($fp)	# i
    sw $t0, -52($fp)	# tmp$11

    # block (2)
    # add a, tmp$11, tmp$10
    lw $t0, 8($fp)	# a
    lw $t1, -52($fp)	# tmp$11
    add $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$10

    # block (2)
    # move deref(tmp$10), deref(tmp$8)
    lw $t0, -48($fp)	# tmp$10
    lb $t0, 0($t0)	# deref(tmp$10)
    lw $t1, -40($fp)	# tmp$8
    sb $t0, 0($t1)	# deref(tmp$8)

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # move 1, tmp$7
    li $t0, 1
    sw $t0, -36($fp)	# tmp$7

    # block (2)
    # add i, 1, tmp$6
    lw $t0, -4($fp)	# i
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -32($fp)	# tmp$6

    # block (2)
    # move tmp$6, i
    lw $t0, -32($fp)	# tmp$6
    sw $t0, -4($fp)	# i

    # block (2)
    # goto label 0
    j Lbl0

    # -LEADER- block (3)
    # label 2
Lbl2:

    # block (3)
    # no_op 

    # block (3)
    # move b, tmp$12
    lw $t0, 12($fp)	# b
    sw $t0, -56($fp)	# tmp$12

    # block (3)
    # move i, tmp$13
    lw $t0, -4($fp)	# i
    sw $t0, -60($fp)	# tmp$13

    # block (3)
    # add b, tmp$13, tmp$12
    lw $t0, 12($fp)	# b
    lw $t1, -60($fp)	# tmp$13
    add $t2, $t0, $t1
    sw $t2, -56($fp)	# tmp$12

    # block (3)
    # move 0, tmp$14
    li $t0, 0
    sw $t0, -64($fp)	# tmp$14

    # block (3)
    # move 0, deref(tmp$12)
    li $t0, 0
    lw $t1, -56($fp)	# tmp$12
    sb $t0, 0($t1)	# deref(tmp$12)

    # block (3)
    # no_op 

    # block (3)
    # leave copy

    # block (3)
    # ret i
    lw $v0, -4($fp)	# i
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (3)
    # leave copy

    # block (3)
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
    # -LEADER- block (4)
    # enter sum
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -56($sp)   # allocate stack frame

    # block (4)
    # no_op 

    # block (4)
    # move 0, tmp$15
    li $t0, 0
    sw $t0, -32($fp)	# tmp$15

    # block (4)
    # move 0, i
    li $t0, 0
    sw $t0, -8($fp)	# i

    # block (4)
    # no_op 

    # block (4)
    # move 0, tmp$16
    li $t0, 0
    sw $t0, -40($fp)	# tmp$16

    # block (4)
    # move 0, sum
    li $t0, 0
    sw $t0, -4($fp)	# sum

    # -LEADER- block (5)
    # label 3
Lbl3:

    # block (5)
    # no_op 

    # block (5)
    # move b, tmp$17
    lw $t0, 8($fp)	# b
    sw $t0, -48($fp)	# tmp$17

    # block (5)
    # move i, tmp$18
    lw $t0, -8($fp)	# i
    sw $t0, -52($fp)	# tmp$18

    # block (5)
    # add b, tmp$18, tmp$17
    lw $t0, 8($fp)	# b
    lw $t1, -52($fp)	# tmp$18
    add $t2, $t0, $t1
    sw $t2, -48($fp)	# tmp$17

    # block (5)
    # move deref(tmp$17), tmp$19
    lw $t0, -48($fp)	# tmp$17
    lb $t0, 0($t0)	# deref(tmp$17)
    sb $t0, -53($fp)	# tmp$19

    # block (5)
    # move 0, tmp$20
    li $t0, 0
    sw $t0, -12($fp)	# tmp$20

    # block (5)
    # if_le tmp$19, 0, label 5
    lb $t0, -53($fp)	# tmp$19
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
    # no_op 

    # block (6)
    # move b, tmp$22
    lw $t0, 8($fp)	# b
    sw $t0, -20($fp)	# tmp$22

    # block (6)
    # move i, tmp$23
    lw $t0, -8($fp)	# i
    sw $t0, -24($fp)	# tmp$23

    # block (6)
    # add b, tmp$23, tmp$22
    lw $t0, 8($fp)	# b
    lw $t1, -24($fp)	# tmp$23
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$22

    # block (6)
    # move deref(tmp$22), tmp$24
    lw $t0, -20($fp)	# tmp$22
    lb $t0, 0($t0)	# deref(tmp$22)
    sb $t0, -25($fp)	# tmp$24

    # block (6)
    # add sum, tmp$24, tmp$21
    lw $t0, -4($fp)	# sum
    lb $t1, -25($fp)	# tmp$24
    add $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$21

    # block (6)
    # move tmp$21, sum
    lw $t0, -16($fp)	# tmp$21
    sw $t0, -4($fp)	# sum

    # block (6)
    # no_op 

    # block (6)
    # no_op 

    # block (6)
    # move 1, tmp$26
    li $t0, 1
    sw $t0, -44($fp)	# tmp$26

    # block (6)
    # add i, 1, tmp$25
    lw $t0, -8($fp)	# i
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -36($fp)	# tmp$25

    # block (6)
    # move tmp$25, i
    lw $t0, -36($fp)	# tmp$25
    sw $t0, -8($fp)	# i

    # block (6)
    # goto label 3
    j Lbl3

    # -LEADER- block (7)
    # label 5
Lbl5:

    # block (7)
    # no_op 

    # block (7)
    # leave sum

    # block (7)
    # ret sum
    lw $v0, -4($fp)	# sum
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (7)
    # leave sum

    # block (7)
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
    # -LEADER- block (8)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -16($sp)   # allocate stack frame

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # param addr(x)
    la $t0, _x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # param addr(_Str0)
    la $t0, __Str0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # call copy, 2
    jal _copy
    la $sp, 8($sp)

    # block (8)
    # retrieve tmp$27
    sw $v0, -8($fp)	# tmp$27

    # block (8)
    # move tmp$27, y
    lw $t0, -8($fp)	# tmp$27
    sw $t0, -4($fp)	# y

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # no_op 

    # block (8)
    # param addr(x)
    la $t0, _x
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # call sum, 1
    jal _sum
    la $sp, 4($sp)

    # block (8)
    # retrieve tmp$29
    sw $v0, -16($fp)	# tmp$29

    # block (8)
    # add tmp$27, tmp$29, tmp$28
    lw $t0, -8($fp)	# tmp$27
    lw $t1, -16($fp)	# tmp$29
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$28

    # block (8)
    # move tmp$28, y
    lw $t0, -12($fp)	# tmp$28
    sw $t0, -4($fp)	# y

    # block (8)
    # no_op 

    # block (8)
    # param tmp$28
    lw $t0, -12($fp)	# tmp$28
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (8)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (8)
    # no_op 

    # block (8)
    # leave main

    # block (8)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (8)
    # leave main

    # block (8)
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

