.text
# function f
# formals: n (loc: 8); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -32); tmp$8 (loc: -36); 
# space for locals: 36 bytes
#
_f:
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -36($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$0
    li $t0, 1
    sw $t0, -4($fp)	# tmp$0

    # if_le n, tmp$0, label 0
    lw $t0, 8($fp)	# n
    lw $t1, -4($fp)	# tmp$0
    ble $t0, $t1, Lbl0

    # goto label 1
    j Lbl1

    # label 0
Lbl0:

    # move 1, tmp$1
    li $t0, 1
    sw $t0, -8($fp)	# tmp$1

    # leave f

    # ret tmp$1
    lw $v0, -8($fp)	# tmp$1
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # move 1, tmp$4
    li $t0, 1
    sw $t0, -20($fp)	# tmp$4

    # sub n, tmp$4, tmp$3
    lw $t0, 8($fp)	# n
    lw $t1, -20($fp)	# tmp$4
    sub $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$3

    # param tmp$3
    lw $t0, -16($fp)	# tmp$3
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call g, 1
    jal _g
    la $sp, 4($sp)

    # retrieve tmp$5
    sw $v0, -24($fp)	# tmp$5

    # no_op 

    # move 2, tmp$7
    li $t0, 2
    sw $t0, -32($fp)	# tmp$7

    # sub n, tmp$7, tmp$6
    lw $t0, 8($fp)	# n
    lw $t1, -32($fp)	# tmp$7
    sub $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$6

    # param tmp$6
    lw $t0, -28($fp)	# tmp$6
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 1
    jal _f
    la $sp, 4($sp)

    # retrieve tmp$8
    sw $v0, -36($fp)	# tmp$8

    # add tmp$5, tmp$8, tmp$2
    lw $t0, -24($fp)	# tmp$5
    lw $t1, -36($fp)	# tmp$8
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$2

    # leave f

    # ret tmp$2
    lw $v0, -12($fp)	# tmp$2
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # label 2
Lbl2:

    # leave f

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave f

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function f

.text
# function g
# formals: n (loc: 8); 
# locals: tmp$9 (loc: -4); tmp$10 (loc: -8); tmp$11 (loc: -12); tmp$12 (loc: -16); tmp$13 (loc: -20); tmp$14 (loc: -24); tmp$15 (loc: -28); tmp$16 (loc: -32); tmp$17 (loc: -36); 
# space for locals: 36 bytes
#
_g:
    # enter g
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -36($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$9
    li $t0, 1
    sw $t0, -4($fp)	# tmp$9

    # if_le n, tmp$9, label 3
    lw $t0, 8($fp)	# n
    lw $t1, -4($fp)	# tmp$9
    ble $t0, $t1, Lbl3

    # goto label 4
    j Lbl4

    # label 3
Lbl3:

    # move 1, tmp$10
    li $t0, 1
    sw $t0, -8($fp)	# tmp$10

    # leave g

    # ret tmp$10
    lw $v0, -8($fp)	# tmp$10
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # goto label 5
    j Lbl5

    # label 4
Lbl4:

    # no_op 

    # move 1, tmp$13
    li $t0, 1
    sw $t0, -20($fp)	# tmp$13

    # sub n, tmp$13, tmp$12
    lw $t0, 8($fp)	# n
    lw $t1, -20($fp)	# tmp$13
    sub $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$12

    # param tmp$12
    lw $t0, -16($fp)	# tmp$12
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 1
    jal _f
    la $sp, 4($sp)

    # retrieve tmp$14
    sw $v0, -24($fp)	# tmp$14

    # no_op 

    # move 2, tmp$16
    li $t0, 2
    sw $t0, -32($fp)	# tmp$16

    # sub n, tmp$16, tmp$15
    lw $t0, 8($fp)	# n
    lw $t1, -32($fp)	# tmp$16
    sub $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$15

    # param tmp$15
    lw $t0, -28($fp)	# tmp$15
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call g, 1
    jal _g
    la $sp, 4($sp)

    # retrieve tmp$17
    sw $v0, -36($fp)	# tmp$17

    # add tmp$14, tmp$17, tmp$11
    lw $t0, -24($fp)	# tmp$14
    lw $t1, -36($fp)	# tmp$17
    add $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$11

    # leave g

    # ret tmp$11
    lw $v0, -12($fp)	# tmp$11
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # label 5
Lbl5:

    # leave g

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave g

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function g

.text
# function main
# formals: 
# locals: x (loc: -4); tmp$18 (loc: -8); tmp$19 (loc: -12); 
# space for locals: 12 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -12($sp)   # allocate stack frame

    # no_op 

    # move 5, tmp$18
    li $t0, 5
    sw $t0, -8($fp)	# tmp$18

    # param tmp$18
    lw $t0, -8($fp)	# tmp$18
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 1
    jal _f
    la $sp, 4($sp)

    # retrieve tmp$19
    sw $v0, -12($fp)	# tmp$19

    # move tmp$19, x
    lw $t0, -12($fp)	# tmp$19
    sw $t0, -4($fp)	# x

    # no_op 

    # param x
    lw $t0, -4($fp)	# x
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

