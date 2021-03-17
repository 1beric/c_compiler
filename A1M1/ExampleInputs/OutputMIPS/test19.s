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

_foo:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -8($sp)    # allocate stack frame
lw $t1, 8($fp)
lw $t2, 12($fp)
add $t3, $t1, $t2
sw $t3, -4($fp)
lw $t1, -4($fp)
lw $t2, 16($fp)
add $t3, $t1, $t2
sw $t3, -8($fp)
lw $v0, -8($fp)
j __L0
nop
__L0:
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)

