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

.text
.align 2

_h:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
lw $t1, 8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
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
la $sp, -8($sp)    # allocate stack frame
lw $t1, 8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
li $t1, 1234
sw $t1, -4($fp)
lw $t1, -4($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _h
la $sp, 4($sp)
li $t1, 12345
sw $t1, -8($fp)
lw $t1, -8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
j __L1
nop
__L1:
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)

_f:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -12($sp)    # allocate stack frame
li $t1, 12
sw $t1, -4($fp)
lw $t1, -4($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
li $t1, 123
sw $t1, -8($fp)
lw $t1, -8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _g
la $sp, 4($sp)
li $t1, 123456
sw $t1, -12($fp)
lw $t1, -12($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
j __L2
nop
__L2:
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
la $sp, -12($sp)    # allocate stack frame
li $t1, 1
sw $t1, -4($fp)
lw $t1, -4($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
li $t1, 0
sw $t1, -8($fp)
lw $t1, -8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _f
la $sp, 4($sp)
li $t1, 1234567
sw $t1, -12($fp)
lw $t1, -12($fp)
la $sp, -4($sp)
sw $t1, 0($sp)
jal _println
la $sp, 4($sp)
j __L3
nop
__L3:
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)

