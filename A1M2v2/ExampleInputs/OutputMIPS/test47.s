.text
# function f
# formals: s (loc: 8); n (loc: 12); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -9); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -29); tmp$8 (loc: -36); tmp$9 (loc: -40); 
# space for locals: 40 bytes
#
_f:
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -40($sp)   # allocate stack frame

    # no_op 

    # move s, tmp$0
    lw $t0, 8($fp)	# s
    sw $t0, -4($fp)	# tmp$0

    # mul n, 1, tmp$1
    lw $t0, 12($fp)	# n
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -8($fp)	# tmp$1

    # add tmp$0, tmp$1, tmp$0
    lw $t0, -4($fp)	# tmp$0
    lw $t1, -8($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # move deref(tmp$0), tmp$2
    lw $t0, -4($fp)	# tmp$0
    lb $t0, 0($t0)	# deref(tmp$0)
    sb $t0, -9($fp)	# tmp$2

    # move 0, tmp$3
    li $t0, 0
    sw $t0, -16($fp)	# tmp$3

    # if_eq tmp$2, tmp$3, label 0
    lb $t0, -9($fp)	# tmp$2
    lw $t1, -16($fp)	# tmp$3
    beq $t0, $t1, Lbl0

    # goto label 1
    j Lbl1

    # label 0
Lbl0:

    # leave f

    # ret 
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

    # no_op 

    # move s, tmp$5
    lw $t0, 8($fp)	# s
    sw $t0, -24($fp)	# tmp$5

    # mul n, 1, tmp$6
    lw $t0, 12($fp)	# n
    li $t1, 1
    mul $t2, $t0, $t1
    sw $t2, -28($fp)	# tmp$6

    # add tmp$5, tmp$6, tmp$5
    lw $t0, -24($fp)	# tmp$5
    lw $t1, -28($fp)	# tmp$6
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$5

    # move deref(tmp$5), tmp$7
    lw $t0, -24($fp)	# tmp$5
    lb $t0, 0($t0)	# deref(tmp$5)
    sb $t0, -29($fp)	# tmp$7

    # add u, tmp$7, tmp$4
    lw $t0, _u
    lb $t1, -29($fp)	# tmp$7
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$4

    # move tmp$4, u
    lw $t0, -20($fp)	# tmp$4
    sw $t0, _u

    # no_op 

    # no_op 

    # move 1, tmp$9
    li $t0, 1
    sw $t0, -40($fp)	# tmp$9

    # add n, tmp$9, tmp$8
    lw $t0, 12($fp)	# n
    lw $t1, -40($fp)	# tmp$9
    add $t2, $t0, $t1
    sw $t2, -36($fp)	# tmp$8

    # param tmp$8
    lw $t0, -36($fp)	# tmp$8
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param addr(s)
    lw $t0, 8($fp)	# addr(s)
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 2
    jal _f
    la $sp, 8($sp)

    # no_op 

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
# function main
# formals: 
# locals: tmp$10 (loc: -4); 
# space for locals: 4 bytes
#
_main:
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -4($sp)   # allocate stack frame

    # no_op 

    # move 0, tmp$10
    li $t0, 0
    sw $t0, -4($fp)	# tmp$10

    # param tmp$10
    lw $t0, -4($fp)	# tmp$10
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # param addr(_Str0)
    la $t0, __Str0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # call f, 2
    jal _f
    la $sp, 8($sp)

    # no_op 

    # no_op 

    # param u
    lw $t0, _u
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

