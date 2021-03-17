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

_u: .space 4
.align 2

.text
.align 2

# enter _f
_f:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -20($sp)    # allocate stack frame

# __tmp0 = 0
li $t1, 0
sw $t1, -4($fp)

# if (_u == __tmp0) goto _L1
lw $t0, 8($fp)
lw $t1, -4($fp)
beq $t0, $t1, __L1

# goto __L2
j __L2
nop

# __L1:
__L1:

# __tmp1 = 1
li $t1, 1
sw $t1, -8($fp)

# return __tmp1
lw $v0, -8($fp)

# goto __L0
j __L0
nop

# goto __L3
j __L3
nop

# __L2:
__L2:

# param _u
lw $t1, 8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _incr 1
jal _incr
la $sp, 4($sp)

# __tmp3 = 1
li $t1, 1
sw $t1, -16($fp)

# __tmp4 = _u - __tmp3
lw $t1, 8($fp)
lw $t2, -16($fp)
sub $t3, $t1, $t2
sw $t3, -20($fp)

# param __tmp4
lw $t1, -20($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _f 1
jal _f
la $sp, 4($sp)

# retrieve __tmp2
sw $v0, -12($fp)

# return __tmp2
lw $v0, -12($fp)

# goto __L0
j __L0
nop

# __L3:
__L3:

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


# enter _incr
_incr:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -4($sp)    # allocate stack frame

# __tmp5 = _x + _u
lw $t1, 8($fp)
lw $t2, _u
add $t3, $t1, $t2
sw $t3, -4($fp)

# _u = __tmp5
lw $t1, -4($fp)
sw $t1, _u

# return

# goto __L4
j __L4
nop

# __L4:
__L4:

# leave _incr
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)



.data
.align 2

.text
.align 2


main:
j _main
# enter _main
_main:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -20($sp)    # allocate stack frame

# __tmp6 = 1
li $t1, 1
sw $t1, -8($fp)

# _u = __tmp6
lw $t1, -8($fp)
sw $t1, _u

# __tmp8 = 6
li $t1, 6
sw $t1, -16($fp)

# param __tmp8
lw $t1, -16($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _f 1
jal _f
la $sp, 4($sp)

# retrieve __tmp7
sw $v0, -12($fp)

# _x = __tmp7
lw $t1, -12($fp)
sw $t1, -4($fp)

# __tmp9 = _u + _x
lw $t1, _u
lw $t2, -4($fp)
add $t3, $t1, $t2
sw $t3, -20($fp)

# _x = __tmp9
lw $t1, -20($fp)
sw $t1, -4($fp)

# param _x
lw $t1, -4($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# return

# goto __L5
j __L5
nop

# __L5:
__L5:

# leave _main
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


