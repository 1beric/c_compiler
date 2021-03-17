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

.align 2

.align 2

.align 2

_x: .space 4
.align 2

_y: .space 4
.align 2

_z: .space 4
.text
.align 2

# enter _foo
_foo:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -8($sp)    # allocate stack frame

# __tmp0 = 0
li $t1, 0
sw $t1, -8($fp)

# return __tmp0
lw $v0, -8($fp)

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



.data
.align 2

.text
.align 2

# enter _bar
_bar:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -4($sp)    # allocate stack frame

# __tmp1 = 1
li $t1, 1
sw $t1, -4($fp)

# return __tmp1
lw $v0, -4($fp)

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


# enter _ggg
_ggg:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer

# return

# goto __L2
j __L2
nop

# __L2:
__L2:

# leave _ggg
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


# enter _hhh
_hhh:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer

# return

# goto __L3
j __L3
nop

# __L3:
__L3:

# leave _hhh
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


# enter _iii
_iii:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -4($sp)    # allocate stack frame

# __tmp2 = 97
li $t1, 97
sb $t1, -1($fp)

# return __tmp2
lb $v0, -1($fp)

# goto __L4
j __L4
nop

# __L4:
__L4:

# leave _iii
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


