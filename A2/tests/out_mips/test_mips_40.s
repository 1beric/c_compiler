.text
# function f
# formals: i (loc: 8); 
# locals: y (loc: -4); tmp$0 (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); tmp$6 (loc: -32); 
# space for locals: 32 bytes
#
_f:
    # -LEADER- block (0)
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -32($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 1, tmp$0
    li $t0, 1
    sw $t0, -8($fp)	# tmp$0

    # block (0)
    # move 1, y
    li $t0, 1
    sw $t0, -4($fp)	# y

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # no_op 

    # block (1)
    # move 0, tmp$1
    li $t0, 0
    sw $t0, -12($fp)	# tmp$1

    # block (1)
    # if_le i, 0, label 2
    lw $t0, 8($fp)	# i
    li $t1, 0
    ble $t0, $t1, Lbl2

    # -LEADER- block (2)
    # label 1
Lbl1:

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # mul x, i, tmp$2
    lw $t0, _x
    lw $t1, 8($fp)	# i
    mul $t2, $t0, $t1
    sw $t2, -16($fp)	# tmp$2

    # block (2)
    # move tmp$2, x
    lw $t0, -16($fp)	# tmp$2
    sw $t0, _x

    # block (2)
    # no_op 

    # block (2)
    # move 2, tmp$4
    li $t0, 2
    sw $t0, -24($fp)	# tmp$4

    # block (2)
    # no_op 

    # block (2)
    # mul 2, y, tmp$3
    li $t0, 2
    lw $t1, -4($fp)	# y
    mul $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$3

    # block (2)
    # move tmp$3, y
    lw $t0, -20($fp)	# tmp$3
    sw $t0, -4($fp)	# y

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # move 1, tmp$6
    li $t0, 1
    sw $t0, -32($fp)	# tmp$6

    # block (2)
    # sub i, 1, tmp$5
    lw $t0, 8($fp)	# i
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$5

    # block (2)
    # move tmp$5, i
    lw $t0, -28($fp)	# tmp$5
    sw $t0, 8($fp)	# i

    # block (2)
    # goto label 0
    j Lbl0

    # -LEADER- block (3)
    # label 2
Lbl2:

    # block (3)
    # no_op 

    # block (3)
    # leave f

    # block (3)
    # ret y
    lw $v0, -4($fp)	# y
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (3)
    # leave f

    # block (3)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function f

.text
# function main
# formals: 
# locals: a (loc: -4); tmp$7 (loc: -8); tmp$8 (loc: -12); tmp$9 (loc: -16); tmp$10 (loc: -20); 
# space for locals: 20 bytes
#
_main:
    # -LEADER- block (4)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -20($sp)   # allocate stack frame

    # block (4)
    # no_op 

    # block (4)
    # move 1, tmp$7
    li $t0, 1
    sw $t0, -8($fp)	# tmp$7

    # block (4)
    # move 1, x
    li $t0, 1
    sw $t0, _x

    # block (4)
    # no_op 

    # block (4)
    # move 6, tmp$8
    li $t0, 6
    sw $t0, -12($fp)	# tmp$8

    # block (4)
    # param 6
    li $t0, 6
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call f, 1
    jal _f
    la $sp, 4($sp)

    # block (4)
    # retrieve tmp$9
    sw $v0, -16($fp)	# tmp$9

    # block (4)
    # move tmp$9, a
    lw $t0, -16($fp)	# tmp$9
    sw $t0, -4($fp)	# a

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # add tmp$9, x, tmp$10
    lw $t0, -16($fp)	# tmp$9
    lw $t1, _x
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$10

    # block (4)
    # move tmp$10, x
    lw $t0, -20($fp)	# tmp$10
    sw $t0, _x

    # block (4)
    # no_op 

    # block (4)
    # param tmp$10
    lw $t0, -20($fp)	# tmp$10
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
_x:  .space 4

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

