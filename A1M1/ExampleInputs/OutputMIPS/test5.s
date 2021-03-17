.align 2
.data
__nl :.asciiz "\n"
.align 2
.text
#println : print out an integer followed by a newline
_println :
li $v0, 1
lw $a0, 0($sp)
syscall
li $v0, 4
la $a0, __nl
syscall
jr $ra



.data
.align 2

_q: .space 4
.text
.align 2

_f:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -20($sp)    # allocate stack frame
li $t1, 2
sw $t1, -4($fp)
li $t1, 1
sw $t1, -8($fp)
lw $t1, -4($fp)
lw $t2, -8($fp)
sub $t3, $t1, $t2
sw $t3, -12($fp)
li $t1, 3
sw $t1, -16($fp)
lw $t1, -12($fp)
lw $t2, -16($fp)
mul $t3, $t1, $t2
sw $t3, -20($fp)
lw $v0, -20($fp)
j __L0
nop
__L0:
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)

_g:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -32($sp)    # allocate stack frame
li $t1, 10
sw $t1, -16($fp)
lw $t1, -16($fp)
neg $t2, $t1
sw $t2, -20($fp)
lw $t1, -20($fp)
sw $t1, -12($fp)
li $t1, 1
sw $t1, -24($fp)
lw $t1, -12($fp)
lw $t2, -24($fp)
add $t3, $t1, $t2
sw $t3, -28($fp)
lw $t1, -28($fp)
sw $t1, -12($fp)
li $t1, 1
sw $t1, -4($fp)
lw $t1, -4($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
lw $t1, -12($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _f
la $sp, 8($sp)
sw $v0, -32($fp)
lw $t1, -32($fp)
neg $t2, $t1
sw $t2, -8($fp)
lw $t1, -8($fp)
sw $t1, -12($fp)
lw $v0, -12($fp)
j __L1
nop
__L1:
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


main:
j _main
_main:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -32($sp)    # allocate stack frame
li $t1, 5
sw $t1, -4($fp)
lw $t1, -4($fp)
sw $t1, -32($fp)
li $t1, 1
sw $t1, -8($fp)
lw $t1, -8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
lw $t1, -32($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
li $t1, 1
sw $t1, -16($fp)
li $t1, 2
sw $t1, -20($fp)
lw $t1, -20($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
lw $t1, -16($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _f
la $sp, 8($sp)
sw $v0, -12($fp)
lw $t1, -12($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
jal _g
la $sp, 0($sp)
sw $v0, -24($fp)
lw $t1, -24($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
li $t1, 2
sw $t1, -28($fp)
lw $t1, -28($fp)
sw $t1, -32($fp)
j __L2
nop
__L2:
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)

