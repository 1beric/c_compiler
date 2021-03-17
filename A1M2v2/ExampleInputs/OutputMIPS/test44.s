.text
# function acc
# formals: x (loc: 8); 
# locals: tmp$0 (loc: -4); 
# space for locals: 4 bytes
#
_acc:
    # enter acc
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -4($sp)   # allocate stack frame

    # no_op 

    # no_op 

    # no_op 

    # mul y, x, tmp$0
    lw $t0, _y
    lw $t1, 8($fp)	# x
    mul $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # move tmp$0, y
    lw $t0, -4($fp)	# tmp$0
    sw $t0, _y

    # leave acc

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave acc

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function acc

.text
# function main
# formals: 
# locals: f (loc: -4); n (loc: -8); tmp$1 (loc: -12); tmp$2 (loc: -16); tmp$3 (loc: -20); tmp$4 (loc: -24); tmp$5 (loc: -28); 
# space for locals: 28 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -28($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$1
    li $t0, 1
    sw $t0, -12($fp)	# tmp$1

    # move tmp$1, y
    lw $t0, -12($fp)	# tmp$1
    sw $t0, _y

    # no_op 

    # move 7, tmp$2
    li $t0, 7
    sw $t0, -16($fp)	# tmp$2

    # move tmp$2, n
    lw $t0, -16($fp)	# tmp$2
    sw $t0, -8($fp)	# n

    # label 0
Lbl0:

    # no_op 

    # move 0, tmp$3
    li $t0, 0
    sw $t0, -20($fp)	# tmp$3

    # if_gt n, tmp$3, label 1
    lw $t0, -8($fp)	# n
    lw $t1, -20($fp)	# tmp$3
    bgt $t0, $t1, Lbl1

    # goto label 2
    j Lbl2

    # label 1
Lbl1:

    # no_op 

    # param n
    lw $t0, -8($fp)	# n
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call acc, 1
    jal _acc
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # no_op 

    # move 1, tmp$5
    li $t0, 1
    sw $t0, -28($fp)	# tmp$5

    # sub n, tmp$5, tmp$4
    lw $t0, -8($fp)	# n
    lw $t1, -28($fp)	# tmp$5
    sub $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$4

    # move tmp$4, n
    lw $t0, -24($fp)	# tmp$4
    sw $t0, -8($fp)	# n

    # goto label 0
    j Lbl0

    # label 2
Lbl2:

    # no_op 

    # param y
    lw $t0, _y
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
_y:  .space 4

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

