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

.align 2

_q: .space 4
.text
.align 2

# enter _f
_f:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -20($sp)    # allocate stack frame

# __tmp0 = 2
li $t1, 2
sw $t1, -4($fp)

# __tmp1 = 1
li $t1, 1
sw $t1, -8($fp)

# __tmp2 = __tmp0 - __tmp1
lw $t1, -4($fp)
lw $t2, -8($fp)
sub $t3, $t1, $t2
sw $t3, -12($fp)

# __tmp3 = 3
li $t1, 3
sw $t1, -16($fp)

# __tmp4 = __tmp2 * __tmp3
lw $t1, -12($fp)
lw $t2, -16($fp)
mul $t3, $t1, $t2
sw $t3, -20($fp)

# return __tmp4
lw $v0, -20($fp)

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
la $sp, -32($sp)    # allocate stack frame

# __tmp5 = 10
li $t1, 10
sw $t1, -16($fp)

# __tmp6 =  -(__tmp5)
lw $t1, -16($fp)
neg $t2, $t1
sw $t2, -20($fp)

# _x = __tmp6
lw $t1, -20($fp)
sw $t1, -12($fp)

# __tmp7 = 1
li $t1, 1
sw $t1, -24($fp)

# __tmp8 = _x + __tmp7
lw $t1, -12($fp)
lw $t2, -24($fp)
add $t3, $t1, $t2
sw $t3, -28($fp)

# _x = __tmp8
lw $t1, -28($fp)
sw $t1, -12($fp)

# __tmp10 = 1
li $t1, 1
sw $t1, -4($fp)

# param __tmp10
lw $t1, -4($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# param _x
lw $t1, -12($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _f 2
jal _f
la $sp, 8($sp)

# retrieve __tmp9
sw $v0, -32($fp)

# __tmp11 =  -(__tmp9)
lw $t1, -32($fp)
neg $t2, $t1
sw $t2, -8($fp)

# _x = __tmp11
lw $t1, -8($fp)
sw $t1, -12($fp)

# return _x
lw $v0, -12($fp)

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



main:
j _main
# enter _main
_main:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -32($sp)    # allocate stack frame

# __tmp12 = 5
li $t1, 5
sw $t1, -4($fp)

# _a = __tmp12
lw $t1, -4($fp)
sw $t1, -32($fp)

# __tmp13 = 1
li $t1, 1
sw $t1, -8($fp)

# param __tmp13
lw $t1, -8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# param _a
lw $t1, -32($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# __tmp15 = 1
li $t1, 1
sw $t1, -16($fp)

# __tmp16 = 2
li $t1, 2
sw $t1, -20($fp)

# param __tmp16
lw $t1, -20($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# param __tmp15
lw $t1, -16($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _f 2
jal _f
la $sp, 8($sp)

# retrieve __tmp14
sw $v0, -12($fp)

# param __tmp14
lw $t1, -12($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# call _g 0
jal _g
la $sp, 0($sp)

# retrieve __tmp17
sw $v0, -24($fp)

# param __tmp17
lw $t1, -24($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# __tmp18 = 2
li $t1, 2
sw $t1, -28($fp)

# _a = __tmp18
lw $t1, -28($fp)
sw $t1, -32($fp)

# return

# goto __L2
j __L2
nop

# __L2:
__L2:

# leave _main
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


