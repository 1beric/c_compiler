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

# enter _f
_f:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -24($sp)    # allocate stack frame

# __tmp0 = 38
li $t1, 38
sb $t1, -10($fp)

# _u = __tmp0
lb $t1, -10($fp)
sb $t1, -1($fp)

# __tmp1 = 345
li $t1, 345
sw $t1, -16($fp)

# _v = __tmp1
lw $t1, -16($fp)
sw $t1, -8($fp)

# param _x
lw $t1, 8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# __tmp2 = 55
li $t1, 55
sb $t1, -17($fp)

# _w = __tmp2
lb $t1, -17($fp)
sb $t1, -9($fp)

# param _u
lb $t1, -1($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# __tmp3 = 678
li $t1, 678
sw $t1, -24($fp)

# _x = __tmp3
lw $t1, -24($fp)
sw $t1, 8($fp)

# param _v
lw $t1, -8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# param _w
lb $t1, -9($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# param _x
lw $t1, 8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# return

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



main:
j _main
# enter _main
_main:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -4($sp)    # allocate stack frame

# __tmp4 = 123
li $t1, 123
sw $t1, -4($fp)

# param __tmp4
lw $t1, -4($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _f 1
jal _f
la $sp, 4($sp)

# return

# goto __L1
j __L1
nop

# __L1:
__L1:

# leave _main
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


