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
.text
.align 2

# enter _foo
_foo:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -56($sp)    # allocate stack frame

# __tmp0 = 0
li $t1, 0
sw $t1, -20($fp)

# if (_z > __tmp0) goto _L5
lw $t0, 8($fp)
lw $t1, -20($fp)
bgt $t0, $t1, __L5

# goto __L2
j __L2
nop

# __L5:
__L5:

# __tmp1 = 0
li $t1, 0
sw $t1, -24($fp)

# if (_x > __tmp1) goto _L4
lw $t0, _x
lw $t1, -24($fp)
bgt $t0, $t1, __L4

# goto __L2
j __L2
nop

# __L4:
__L4:

# __tmp2 = 0
li $t1, 0
sw $t1, -28($fp)

# if (_y > __tmp2) goto _L1
lw $t0, _y
lw $t1, -28($fp)
bgt $t0, $t1, __L1

# goto __L2
j __L2
nop

# __L1:
__L1:

# __tmp3 = 1
li $t1, 1
sw $t1, -32($fp)

# _x = __tmp3
lw $t1, -32($fp)
sw $t1, _x

# goto __L3
j __L3
nop

# __L2:
__L2:

# __L3:
__L3:

# __tmp4 = 0
li $t1, 0
sw $t1, -36($fp)

# if (_z == __tmp4) goto _L6
lw $t0, 8($fp)
lw $t1, -36($fp)
beq $t0, $t1, __L6

# goto __L10
j __L10
nop

# __L10:
__L10:

# __tmp5 = 0
li $t1, 0
sw $t1, -40($fp)

# if (_x == __tmp5) goto _L6
lw $t0, _x
lw $t1, -40($fp)
beq $t0, $t1, __L6

# goto __L9
j __L9
nop

# __L9:
__L9:

# __tmp6 = 0
li $t1, 0
sw $t1, -44($fp)

# if (_y == __tmp6) goto _L6
lw $t0, _y
lw $t1, -44($fp)
beq $t0, $t1, __L6

# goto __L7
j __L7
nop

# __L6:
__L6:

# __tmp7 = 1
li $t1, 1
sw $t1, -48($fp)

# _y = __tmp7
lw $t1, -48($fp)
sw $t1, _y

# goto __L8
j __L8
nop

# __L7:
__L7:

# __L8:
__L8:

# if (_x > _y) goto _L15
lw $t0, _x
lw $t1, _y
bgt $t0, $t1, __L15

# goto __L11
j __L11
nop

# __L15:
__L15:

# if (_y > _z) goto _L14
lw $t0, _y
lw $t1, 8($fp)
bgt $t0, $t1, __L14

# goto __L11
j __L11
nop

# __L14:
__L14:

# if (_z > _x) goto _L12
lw $t0, 8($fp)
lw $t1, _x
bgt $t0, $t1, __L12

# goto __L11
j __L11
nop

# __L11:
__L11:

# __tmp8 = 0
li $t1, 0
sw $t1, -52($fp)

# _z = __tmp8
lw $t1, -52($fp)
sw $t1, 8($fp)

# goto __L13
j __L13
nop

# __L12:
__L12:

# __L13:
__L13:

# if (_x > _y) goto _L23
lw $t0, _x
lw $t1, _y
bgt $t0, $t1, __L23

# goto __L22
j __L22
nop

# __L23:
__L23:

# if (_y > _z) goto _L21
lw $t0, _y
lw $t1, 8($fp)
bgt $t0, $t1, __L21

# goto __L22
j __L22
nop

# __L22:
__L22:

# if (_z > _y) goto _L21
lw $t0, 8($fp)
lw $t1, _y
bgt $t0, $t1, __L21

# goto __L20
j __L20
nop

# __L21:
__L21:

# if (_y > _x) goto _L19
lw $t0, _y
lw $t1, _x
bgt $t0, $t1, __L19

# goto __L20
j __L20
nop

# __L20:
__L20:

# if (_z == _x) goto _L19
lw $t0, 8($fp)
lw $t1, _x
beq $t0, $t1, __L19

# goto __L17
j __L17
nop

# __L19:
__L19:

# if (_x == _y) goto _L16
lw $t0, _x
lw $t1, _y
beq $t0, $t1, __L16

# goto __L17
j __L17
nop

# __L16:
__L16:

# __tmp9 = 1
li $t1, 1
sw $t1, -56($fp)

# _z = __tmp9
lw $t1, -56($fp)
sw $t1, 8($fp)

# goto __L18
j __L18
nop

# __L17:
__L17:

# __L18:
__L18:

# if (_x > _y) goto _L31
lw $t0, _x
lw $t1, _y
bgt $t0, $t1, __L31

# goto __L30
j __L30
nop

# __L31:
__L31:

# if (_y > _z) goto _L29
lw $t0, _y
lw $t1, 8($fp)
bgt $t0, $t1, __L29

# goto __L30
j __L30
nop

# __L30:
__L30:

# if (_z > _y) goto _L29
lw $t0, 8($fp)
lw $t1, _y
bgt $t0, $t1, __L29

# goto __L28
j __L28
nop

# __L29:
__L29:

# if (_y > _x) goto _L27
lw $t0, _y
lw $t1, _x
bgt $t0, $t1, __L27

# goto __L28
j __L28
nop

# __L28:
__L28:

# if (_z == _x) goto _L27
lw $t0, 8($fp)
lw $t1, _x
beq $t0, $t1, __L27

# goto __L25
j __L25
nop

# __L27:
__L27:

# if (_x == _y) goto _L24
lw $t0, _x
lw $t1, _y
beq $t0, $t1, __L24

# goto __L25
j __L25
nop

# __L24:
__L24:

# return _z
lw $v0, 8($fp)

# goto __L0
j __L0
nop

# goto __L26
j __L26
nop

# __L25:
__L25:

# __L26:
__L26:

# param _x
lw $t1, _x
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp10
sb $v0, -1($fp)

# param _y
lw $t1, _y
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp11
sb $v0, -3($fp)

# if (__tmp10 > __tmp11) goto _L37
lb $t0, -1($fp)
lb $t1, -3($fp)
bgt $t0, $t1, __L37

# goto __L36
j __L36
nop

# __L37:
__L37:

# param _z
lw $t1, 8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp12
sb $v0, -5($fp)

# param _x
lw $t1, _x
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp13
sb $v0, -7($fp)

# if (__tmp12 > __tmp13) goto _L33
lb $t0, -5($fp)
lb $t1, -7($fp)
bgt $t0, $t1, __L33

# goto __L36
j __L36
nop

# __L36:
__L36:

# param _x
lw $t1, _x
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp16
sb $v0, -13($fp)

# param __tmp16
lb $t1, -13($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp15
sb $v0, -11($fp)

# param __tmp15
lb $t1, -11($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp14
sb $v0, -9($fp)

# param _y
lw $t1, _y
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp20
sb $v0, -2($fp)

# param __tmp20
lb $t1, -2($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp19
sb $v0, -16($fp)

# param __tmp19
lb $t1, -16($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp18
sb $v0, -15($fp)

# param __tmp18
lb $t1, -15($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp17
sb $v0, -14($fp)

# if (__tmp14 == __tmp17) goto _L33
lb $t0, -9($fp)
lb $t1, -14($fp)
beq $t0, $t1, __L33

# goto __L35
j __L35
nop

# __L35:
__L35:

# param _z
lw $t1, 8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp22
sb $v0, -6($fp)

# param __tmp22
lb $t1, -6($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp21
sb $v0, -4($fp)

# param _x
lw $t1, _x
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp25
sb $v0, -12($fp)

# param __tmp25
lb $t1, -12($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp24
sb $v0, -10($fp)

# param __tmp24
lb $t1, -10($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 1
jal _foo
la $sp, 4($sp)

# retrieve __tmp23
sb $v0, -8($fp)

# if (__tmp21 != __tmp23) goto _L33
lb $t0, -4($fp)
lb $t1, -8($fp)
bne $t0, $t1, __L33

# goto __L32
j __L32
nop

# __L32:
__L32:

# return _x
lw $v0, _x

# goto __L0
j __L0
nop

# goto __L34
j __L34
nop

# __L33:
__L33:

# __L34:
__L34:

# return

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


