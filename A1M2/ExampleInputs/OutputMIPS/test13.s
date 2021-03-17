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

_x: .space 4
.align 2

_y: .space 4
.text
.align 2

# enter _foo
_foo:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -20($sp)    # allocate stack frame

# __tmp0 = 0
li $t1, 0
sw $t1, -4($fp)

# if (_z > __tmp0) goto _L1
lb $t0, 8($fp)
lw $t1, -4($fp)
bgt $t0, $t1, __L1

# goto __L2
j __L2
nop

# __L1:
__L1:

# __tmp1 = 1
li $t1, 1
sw $t1, -8($fp)

# _x = __tmp1
lw $t1, -8($fp)
sw $t1, _x

# goto __L3
j __L3
nop

# __L2:
__L2:

# __L3:
__L3:

# __tmp2 = 0
li $t1, 0
sw $t1, -12($fp)

# if (_z == __tmp2) goto _L4
lb $t0, 8($fp)
lw $t1, -12($fp)
beq $t0, $t1, __L4

# goto __L5
j __L5
nop

# __L4:
__L4:

# __tmp3 = 1
li $t1, 1
sw $t1, -16($fp)

# _y = __tmp3
lw $t1, -16($fp)
sw $t1, _y

# goto __L6
j __L6
nop

# __L5:
__L5:

# __L6:
__L6:

# if (_x > _y) goto _L8
lw $t0, _x
lw $t1, _y
bgt $t0, $t1, __L8

# goto __L7
j __L7
nop

# __L7:
__L7:

# __tmp4 = 0
li $t1, 0
sw $t1, -20($fp)

# _z = __tmp4
lw $t1, -20($fp)
sb $t1, 8($fp)

# goto __L9
j __L9
nop

# __L8:
__L8:

# __L9:
__L9:

# return _z
lb $v0, 8($fp)

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



main:
j _main
# enter _main
_main:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -4($sp)    # allocate stack frame

# __tmp6 = 97
li $t1, 97
sb $t1, -2($fp)

# param __tmp6
lb $t1, -2($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp5
sb $v0, -1($fp)

# param __tmp5
lb $t1, -1($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _println 1
jal _println
la $sp, 4($sp)

# return

# goto __L10
j __L10
nop

# __L10:
__L10:

# leave _main
la $sp, 0($fp)      # (deallocate locals)
lw $ra, 0($sp)      # (restore return address)
lw $fp, 4($sp)      # (restore frame pointer)
la $sp, 8($sp)      # (restore stack pointer)
jr $ra              # (return)


