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


main:
j _main
# enter _main
_main:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -72($sp)    # allocate stack frame

# __tmp0 = 0
li $t1, 0
sw $t1, -36($fp)

# _i = __tmp0
lw $t1, -36($fp)
sw $t1, -32($fp)

# __tmp1 = 0
li $t1, 0
sw $t1, -40($fp)

# _res = __tmp1
lw $t1, -40($fp)
sw $t1, -28($fp)

# __L1:
__L1:

# __tmp2 = 10
li $t1, 10
sw $t1, -44($fp)

# if (_i < __tmp2) goto _L2
lw $t0, -32($fp)
lw $t1, -44($fp)
blt $t0, $t1, __L2

# goto __L3
j __L3
nop

# __L2:
__L2:

# __tmp3 = _res + _i
lw $t1, -28($fp)
lw $t2, -32($fp)
add $t3, $t1, $t2
sw $t3, -48($fp)

# _res = __tmp3
lw $t1, -48($fp)
sw $t1, -28($fp)

# __tmp4 = 1
li $t1, 1
sw $t1, -52($fp)

# __tmp5 = _i + __tmp4
lw $t1, -32($fp)
lw $t2, -52($fp)
add $t3, $t1, $t2
sw $t3, -56($fp)

# _i = __tmp5
lw $t1, -56($fp)
sw $t1, -32($fp)

# goto __L1
j __L1
nop

# __L3:
__L3:

# __tmp6 = 0
li $t1, 0
sw $t1, -60($fp)

# _i = __tmp6
lw $t1, -60($fp)
sw $t1, -32($fp)

# __L4:
__L4:

# __tmp7 = 10
li $t1, 10
sw $t1, -64($fp)

# if (_i < __tmp7) goto _L5
lw $t0, -32($fp)
lw $t1, -64($fp)
blt $t0, $t1, __L5

# goto __L6
j __L6
nop

# __L5:
__L5:

# __tmp8 = _res + _i
lw $t1, -28($fp)
lw $t2, -32($fp)
add $t3, $t1, $t2
sw $t3, -68($fp)

# _res = __tmp8
lw $t1, -68($fp)
sw $t1, -28($fp)

# __tmp9 = 1
li $t1, 1
sw $t1, -72($fp)

# __tmp10 = _i + __tmp9
lw $t1, -32($fp)
lw $t2, -72($fp)
add $t3, $t1, $t2
sw $t3, -4($fp)

# _i = __tmp10
lw $t1, -4($fp)
sw $t1, -32($fp)

# goto __L4
j __L4
nop

# __L6:
__L6:

# __tmp11 = 0
li $t1, 0
sw $t1, -8($fp)

# _i = __tmp11
lw $t1, -8($fp)
sw $t1, -32($fp)

# __L7:
__L7:

# __L8:
__L8:

# __tmp12 = _res + _i
lw $t1, -28($fp)
lw $t2, -32($fp)
add $t3, $t1, $t2
sw $t3, -12($fp)

# _res = __tmp12
lw $t1, -12($fp)
sw $t1, -28($fp)

# __tmp13 = 10
li $t1, 10
sw $t1, -16($fp)

# if (_i > __tmp13) goto _L10
lw $t0, -32($fp)
lw $t1, -16($fp)
bgt $t0, $t1, __L10

# goto __L11
j __L11
nop

# __L10:
__L10:

# param _res
lw $t1, -28($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# return

# goto __L0
j __L0
nop

# goto __L12
j __L12
nop

# __L11:
__L11:

# __L12:
__L12:

# __tmp14 = 1
li $t1, 1
sw $t1, -20($fp)

# __tmp15 = _i + __tmp14
lw $t1, -32($fp)
lw $t2, -20($fp)
add $t3, $t1, $t2
sw $t3, -24($fp)

# _i = __tmp15
lw $t1, -24($fp)
sw $t1, -32($fp)

# goto __L7
j __L7
nop

# __L9:
__L9:

# return

# goto __L0
j __L0
nop

# __L0:
__L0:

# leave _main
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


