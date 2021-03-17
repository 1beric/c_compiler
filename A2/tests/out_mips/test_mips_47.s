.text
# function f
# formals: s (loc: 8); n (loc: 12); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -9); tmp$3 (loc: -16); tmp$4 (loc: -20); tmp$5 (loc: -24); tmp$6 (loc: -28); tmp$7 (loc: -29); tmp$8 (loc: -36); tmp$9 (loc: -40); 
# space for locals: 40 bytes
#
_f:
    # -LEADER- block (0)
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -40($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move s, tmp$0
    lw $t0, 8($fp)	# s
    sw $t0, -4($fp)	# tmp$0

    # block (0)
    # move n, tmp$1
    lw $t0, 12($fp)	# n
    sw $t0, -8($fp)	# tmp$1

    # block (0)
    # add s, tmp$1, tmp$0
    lw $t0, 8($fp)	# s
    lw $t1, -8($fp)	# tmp$1
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # block (0)
    # move deref(tmp$0), tmp$2
    lw $t0, -4($fp)	# tmp$0
    lb $t0, 0($t0)	# deref(tmp$0)
    sb $t0, -9($fp)	# tmp$2

    # block (0)
    # move 0, tmp$3
    li $t0, 0
    sw $t0, -16($fp)	# tmp$3

    # block (0)
    # if_ne tmp$2, 0, label 1
    lb $t0, -9($fp)	# tmp$2
    li $t1, 0
    bne $t0, $t1, Lbl1

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # leave f

    # block (1)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (1)
    # goto label 2
    j Lbl2

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
    # move s, tmp$5
    lw $t0, 8($fp)	# s
    sw $t0, -24($fp)	# tmp$5

    # block (2)
    # move n, tmp$6
    lw $t0, 12($fp)	# n
    sw $t0, -28($fp)	# tmp$6

    # block (2)
    # add s, tmp$6, tmp$5
    lw $t0, 8($fp)	# s
    lw $t1, -28($fp)	# tmp$6
    add $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$5

    # block (2)
    # move deref(tmp$5), tmp$7
    lw $t0, -24($fp)	# tmp$5
    lb $t0, 0($t0)	# deref(tmp$5)
    sb $t0, -29($fp)	# tmp$7

    # block (2)
    # add u, tmp$7, tmp$4
    lw $t0, _u
    lb $t1, -29($fp)	# tmp$7
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$4

    # block (2)
    # move tmp$4, u
    lw $t0, -20($fp)	# tmp$4
    sw $t0, _u

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # move 1, tmp$9
    li $t0, 1
    sw $t0, -40($fp)	# tmp$9

    # block (2)
    # add n, 1, tmp$8
    lw $t0, 12($fp)	# n
    li $t1, 1
    add $t2, $t0, $t1
    sw $t2, -36($fp)	# tmp$8

    # block (2)
    # param tmp$8
    lw $t0, -36($fp)	# tmp$8
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (2)
    # param addr(s)
    lw $t0, 8($fp)	# addr(s)
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (2)
    # call f, 2
    jal _f
    la $sp, 8($sp)

    # block (2)
    # no_op 

    # -LEADER- block (3)
    # label 2
Lbl2:

    # block (3)
    # leave f

    # block (3)
    # ret 
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
# locals: tmp$10 (loc: -4); 
# space for locals: 4 bytes
#
_main:
    # -LEADER- block (4)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -4($sp)   # allocate stack frame

    # block (4)
    # no_op 

    # block (4)
    # move 0, tmp$10
    li $t0, 0
    sw $t0, -4($fp)	# tmp$10

    # block (4)
    # param 0
    li $t0, 0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # param addr(_Str0)
    la $t0, __Str0
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (4)
    # call f, 2
    jal _f
    la $sp, 8($sp)

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # param u
    lw $t0, _u
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

