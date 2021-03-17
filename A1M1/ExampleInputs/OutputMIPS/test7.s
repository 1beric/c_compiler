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

_glob1: .space 4
_glob2: .space 4
.text
.align 2

_foo:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -24($sp)    # allocate stack frame
lw $t1, _glob1
lw $t2, _glob2
add $t3, $t1, $t2
sw $t3, -12($fp)
lw $t1, -12($fp)
sw $t1, -4($fp)
li $t1, 1
sw $t1, -16($fp)
lw $t1, -4($fp)
lw $t2, -16($fp)
add $t3, $t1, $t2
sw $t3, -20($fp)
lw $t1, -20($fp)
sw $t1, -8($fp)
lw $t1, -8($fp)
lw $t2, _glob1
mul $t3, $t1, $t2
sw $t3, -24($fp)
lw $t1, -24($fp)
sw $t1, _glob2
j __L0
nop
__L0:
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)

