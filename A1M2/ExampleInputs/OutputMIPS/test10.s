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


# enter _foo
_foo:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -8($sp)    # allocate stack frame

# call _foo 0
jal _foo
la $sp, 0($sp)

# retrieve __tmp0
sw $v0, -8($fp)

# _x = __tmp0
lw $t1, -8($fp)
sw $t1, -4($fp)

# return _x
lw $v0, -4($fp)

# goto __L0
j __L0
nop

# __L0:
__L0:

# leave _foo
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


# enter _bar
_bar:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer

# call _bar 0
jal _bar
la $sp, 0($sp)

# return

# goto __L1
j __L1
nop

# __L1:
__L1:

# leave _bar
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


