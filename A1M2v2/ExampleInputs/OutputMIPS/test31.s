.text
# function fact
# formals: n (loc: 8); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); 
# space for locals: 24 bytes
#
_fact:
    # enter fact
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -24($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$0
    li $t0, 0
    sw $t0, -4($fp)	# tmp$0

    # if_eq n, tmp$0, label 0
    lw $t0, 8($fp)	# n
    lw $t1, -4($fp)	# tmp$0
    beq $t0, $t1, Lbl0

    # goto label 1
    j Lbl1

    # label 0
Lbl0:

    # move 1, tmp$1
    li $t0, 1
    sw $t0, -8($fp)	# tmp$1

    # leave fact

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

    # call fact, 1
    jal _fact
    la $sp, 4($sp)

    # retrieve tmp$5
    sw $v0, -24($fp)	# tmp$5

    # mul n, tmp$5, tmp$2
    lw $t0, 8($fp)	# n
    lw $t1, -24($fp)	# tmp$5
    mul $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$2

    # leave fact

    # ret tmp$2
    lw $v0, -12($fp)	# tmp$2
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # label 2
Lbl2:

    # leave fact

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave fact

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function fact

.text
# function main
# formals: 
# locals: x (loc: -4); tmp$6 (loc: -8); tmp$7 (loc: -12); 
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

    # move 7, tmp$6
    li $t0, 7
    sw $t0, -8($fp)	# tmp$6

    # param tmp$6
    lw $t0, -8($fp)	# tmp$6
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call fact, 1
    jal _fact
    la $sp, 4($sp)

    # retrieve tmp$7
    sw $v0, -12($fp)	# tmp$7

    # move tmp$7, x
    lw $t0, -12($fp)	# tmp$7
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

