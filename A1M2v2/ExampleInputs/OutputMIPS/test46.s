.text
# function f
# formals: u (loc: 8); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); 
# space for locals: 20 bytes
#
_f:
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -20($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$0
    li $t0, 0
    sw $t0, -4($fp)	# tmp$0

    # if_eq u, tmp$0, label 0
    lw $t0, 8($fp)	# u
    lw $t1, -4($fp)	# tmp$0
    beq $t0, $t1, Lbl0

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

    # param u
    lw $t0, 8($fp)	# u
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call incr, 1
    jal _incr
    la $sp, 4($sp)

    # no_op 

    # no_op 

    # move 1, tmp$3
    li $t0, 1
    sw $t0, -16($fp)	# tmp$3

    # sub u, tmp$3, tmp$2
    lw $t0, 8($fp)	# u
    lw $t1, -16($fp)	# tmp$3
    sub $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$2

    # param tmp$2
    lw $t0, -12($fp)	# tmp$2
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 1
    jal _f
    la $sp, 4($sp)

    # retrieve tmp$4
    sw $v0, -20($fp)	# tmp$4

    # leave f

    # ret tmp$4
    lw $v0, -20($fp)	# tmp$4
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
# function incr
# formals: x (loc: 8); 
# locals: tmp$5 (loc: -4); 
# space for locals: 4 bytes
#
_incr:
    # enter incr
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -4($sp)   # allocate stack frame

    # no_op 

    # no_op 

    # no_op 

    # add x, u, tmp$5
    lw $t0, 8($fp)	# x
    lw $t1, _u
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$5

    # move tmp$5, u
    lw $t0, -4($fp)	# tmp$5
    sw $t0, _u

    # leave incr

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # leave incr

    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

# end function incr

.text
# function main
# formals: 
# locals: x (loc: -4); tmp$6 (loc: -8); tmp$7 (loc: -12); tmp$8 (loc: -16); tmp$9 (loc: -20); 
# space for locals: 20 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -20($sp)   # allocate stack frame

    # no_op 

    # move 1, tmp$6
    li $t0, 1
    sw $t0, -8($fp)	# tmp$6

    # move tmp$6, u
    lw $t0, -8($fp)	# tmp$6
    sw $t0, _u

    # no_op 

    # move 6, tmp$7
    li $t0, 6
    sw $t0, -12($fp)	# tmp$7

    # param tmp$7
    lw $t0, -12($fp)	# tmp$7
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 1
    jal _f
    la $sp, 4($sp)

    # retrieve tmp$8
    sw $v0, -16($fp)	# tmp$8

    # move tmp$8, x
    lw $t0, -16($fp)	# tmp$8
    sw $t0, -4($fp)	# x

    # no_op 

    # no_op 

    # no_op 

    # add u, x, tmp$9
    lw $t0, _u
    lw $t1, -4($fp)	# x
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$9

    # move tmp$9, x
    lw $t0, -20($fp)	# tmp$9
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
_u:  .space 4

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

