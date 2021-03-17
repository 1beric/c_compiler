.text
# function acc
# formals: x (loc: 8); 
# locals: tmp$0 (loc: -4); 
# space for locals: 4 bytes
#
_acc:
    # -LEADER- block (0)
    # enter acc
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -4($sp)   # allocate stack frame

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # no_op 

    # block (0)
    # mul y, x, tmp$0
    lw $t0, _y
    lw $t1, 8($fp)	# x
    mul $t2, $t0, $t1
    sw $t2, -4($fp)	# tmp$0

    # block (0)
    # move tmp$0, y
    lw $t0, -4($fp)	# tmp$0
    sw $t0, _y

    # block (0)
    # leave acc

    # block (0)
    # ret 
    la $sp, 0($fp)     # deallocate locals
    lw $ra, 0($sp)     # restore return address
    lw $fp, 4($sp)     # restore frame pointer
    la $sp, 8($sp)     # restore stack pointer
    jr $ra

    # block (0)
    # leave acc

    # block (0)
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
    # -LEADER- block (1)
    # enter main
    la $sp, -8($sp)    # allocate space for old $fp and $ra
    sw $fp, 4($sp)     # save old $fp
    sw $ra, 0($sp)     # save old $ra
    la $fp, 0($sp)     # $fp := $sp
    la $sp, -28($sp)   # allocate stack frame

    # block (1)
    # no_op 

    # block (1)
    # move 1, tmp$1
    li $t0, 1
    sw $t0, -12($fp)	# tmp$1

    # block (1)
    # move 1, y
    li $t0, 1
    sw $t0, _y

    # block (1)
    # no_op 

    # block (1)
    # move 7, tmp$2
    li $t0, 7
    sw $t0, -16($fp)	# tmp$2

    # block (1)
    # move 7, n
    li $t0, 7
    sw $t0, -8($fp)	# n

    # -LEADER- block (2)
    # label 0
Lbl0:

    # block (2)
    # no_op 

    # block (2)
    # move 0, tmp$3
    li $t0, 0
    sw $t0, -20($fp)	# tmp$3

    # block (2)
    # if_le n, 0, label 2
    lw $t0, -8($fp)	# n
    li $t1, 0
    ble $t0, $t1, Lbl2

    # -LEADER- block (3)
    # label 1
Lbl1:

    # block (3)
    # no_op 

    # block (3)
    # param n
    lw $t0, -8($fp)	# n
    la $sp, -4($sp)
    sw $t0, 0($sp)

    # block (3)
    # call acc, 1
    jal _acc
    la $sp, 4($sp)

    # block (3)
    # no_op 

    # block (3)
    # no_op 

    # block (3)
    # no_op 

    # block (3)
    # move 1, tmp$5
    li $t0, 1
    sw $t0, -28($fp)	# tmp$5

    # block (3)
    # sub n, 1, tmp$4
    lw $t0, -8($fp)	# n
    li $t1, 1
    sub $t2, $t0, $t1
    sw $t2, -24($fp)	# tmp$4

    # block (3)
    # move tmp$4, n
    lw $t0, -24($fp)	# tmp$4
    sw $t0, -8($fp)	# n

    # block (3)
    # goto label 0
    j Lbl0

    # -LEADER- block (4)
    # label 2
Lbl2:

    # block (4)
    # no_op 

    # block (4)
    # param y
    lw $t0, _y
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

