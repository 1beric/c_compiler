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

_x: .space 4
.align 2

_y: .space 4
.align 2

.text
.align 2

# enter _f
_f:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -4($sp)    # allocate stack frame

# return _x
lw $v0, 8($fp)

# goto __L0
j __L0
nop

# __L0:
__L0:

# leave _f
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


# enter _g
_g:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -4($sp)    # allocate stack frame

# return _g
lb $v0, 8($fp)

# goto __L1
j __L1
nop

# __L1:
__L1:

# leave _g
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


