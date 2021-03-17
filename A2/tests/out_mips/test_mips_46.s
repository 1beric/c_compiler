.text
# function f
# formals: u (loc: 8); 
# locals: tmp$0 (loc: -4); tmp$1 (loc: -8); tmp$2 (loc: -12); tmp$3 (loc: -16); tmp$4 (loc: -20); 
# space for locals: 20 bytes
#
_f:
    # -LEADER- block (0)
    # enter f
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -20($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # move 0, tmp$0
    li $t0, 0
    sw $t0, -4($fp)	# tmp$0

    # block (0)
    # if_ne u, 0, label 1
    lw $t0, 8($fp)	# u
    li $t1, 0
    bne $t0, $t1, Lbl1

    # -LEADER- block (1)
    # label 0
Lbl0:

    # block (1)
    # move 1, tmp$1
    li $t0, 1
    sw $t0, -8($fp)	# tmp$1

    # block (1)
    # leave f

    # block (1)
    # ret 1
    li $v0, 1
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
    # param u
    lw $t0, 8($fp)	# u
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (2)
    # call incr, 1
    jal _incr
    la $sp, 4($sp)

    # block (2)
    # no_op 

    # block (2)
    # no_op 

    # block (2)
    # move 1, tmp$3
    li $t0, 1
    sw $t0, -16($fp)	# tmp$3

    # block (2)
    # sub u, 1, tmp$2
    lw $t0, 8($fp)	# u
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -12($fp)	# tmp$2

    # block (2)
    # param tmp$2
    lw $t0, -12($fp)	# tmp$2
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (2)
    # call f, 1
    jal _f
    la $sp, 4($sp)

    # block (2)
    # retrieve tmp$4
    sw $v0, -20($fp)	# tmp$4

    # block (2)
    # leave f

    # block (2)
    # ret tmp$4
    lw $v0, -20($fp)	# tmp$4
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

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
# function incr
# formals: x (loc: 8); 
# locals: tmp$5 (loc: -4); 
# space for locals: 4 bytes
#
_incr:
    # -LEADER- block (4)
    # enter incr
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -4($sp)   # allocate stack frame

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # no_op 

    # block (4)
    # add x, u, tmp$5
    lw $t0, 8($fp)	# x
    lw $t1, _u
    add $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$5

    # block (4)
    # move tmp$5, u
    lw $t0, -4($fp)	# tmp$5
    sw $t0, _u

    # block (4)
    # leave incr

    # block (4)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (4)
    # leave incr

    # block (4)
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
    # -LEADER- block (5)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -20($sp)   # allocate stack frame

    # block (5)
    # no_op 

    # block (5)
    # move 1, tmp$6
    li $t0, 1
    sw $t0, -8($fp)	# tmp$6

    # block (5)
    # move 1, u
    li $t0, 1
    sw $t0, _u

    # block (5)
    # no_op 

    # block (5)
    # move 6, tmp$7
    li $t0, 6
    sw $t0, -12($fp)	# tmp$7

    # block (5)
    # param 6
    li $t0, 6
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (5)
    # call f, 1
    jal _f
    la $sp, 4($sp)

    # block (5)
    # retrieve tmp$8
    sw $v0, -16($fp)	# tmp$8

    # block (5)
    # move tmp$8, x
    lw $t0, -16($fp)	# tmp$8
    sw $t0, -4($fp)	# x

    # block (5)
    # no_op 

    # block (5)
    # no_op 

    # block (5)
    # no_op 

    # block (5)
    # add u, tmp$8, tmp$9
    lw $t0, _u
    lw $t1, -16($fp)	# tmp$8
    add $t2, $t0, $t1
    sw $t2, -20($fp)	# tmp$9

    # block (5)
    # move tmp$9, x
    lw $t0, -20($fp)	# tmp$9
    sw $t0, -4($fp)	# x

    # block (5)
    # no_op 

    # block (5)
    # param tmp$9
    lw $t0, -20($fp)	# tmp$9
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (5)
    # call println, 1
    jal _println
    la $sp, 4($sp)

    # block (5)
    # no_op 

    # block (5)
    # leave main

    # block (5)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (5)
    # leave main

    # block (5)
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

