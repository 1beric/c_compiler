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

# enter _foo
_foo:
la $sp, -8($sp)     # allocate space for old $fp and $ra
sw $fp, 4($sp)      # save old $fp
sw $ra, 0($sp)      # save return address
la $fp, 0($sp)      # set up frame pointer
la $sp, -200($sp)    # allocate stack frame

# __tmp0 = 0
li $t1, 0
sw $t1, -164($fp)

# if (_x > __tmp0) goto _L4
lw $t0, 8($fp)
lw $t1, -164($fp)
bgt $t0, $t1, __L4

# goto __L2
j __L2
nop

# __L4:
__L4:

# __tmp1 = 100
li $t1, 100
sw $t1, -168($fp)

# if (_x < __tmp1) goto _L1
lw $t0, 8($fp)
lw $t1, -168($fp)
blt $t0, $t1, __L1

# goto __L2
j __L2
nop

# __L1:
__L1:

# __tmp2 = 0
li $t1, 0
sw $t1, -172($fp)

# _y = __tmp2
lw $t1, -172($fp)
sw $t1, 12($fp)

# __L5:
__L5:

# __tmp3 = 10
li $t1, 10
sw $t1, -176($fp)

# if (_y < __tmp3) goto _L8
lw $t0, 12($fp)
lw $t1, -176($fp)
blt $t0, $t1, __L8

# goto __L7
j __L7
nop

# __L8:
__L8:

# __tmp7 = 1
li $t1, 1
sw $t1, -192($fp)

# __tmp8 = _x + __tmp7
lw $t1, 8($fp)
lw $t2, -192($fp)
add $t3, $t1, $t2
sw $t3, -196($fp)

# __tmp9 = 1
li $t1, 1
sw $t1, -200($fp)

# __tmp10 = _y - __tmp9
lw $t1, 12($fp)
lw $t2, -200($fp)
sub $t3, $t1, $t2
sw $t3, -4($fp)

# __tmp11 = 2
li $t1, 2
sw $t1, -12($fp)

# __tmp12 = _z * __tmp11
lw $t1, 16($fp)
lw $t2, -12($fp)
mul $t3, $t1, $t2
sw $t3, -24($fp)

# param __tmp12
lw $t1, -24($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# param __tmp10
lw $t1, -4($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# param __tmp8
lw $t1, -196($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 3
jal _foo
la $sp, 12($sp)

# retrieve __tmp6
sw $v0, -188($fp)

# param __tmp6
lw $t1, -188($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _bar 1
jal _bar
la $sp, 4($sp)

# retrieve __tmp5
sw $v0, -184($fp)

# param __tmp5
lw $t1, -184($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _bar 1
jal _bar
la $sp, 4($sp)

# retrieve __tmp4
sw $v0, -180($fp)

# if (_y != __tmp4) goto _L6
lw $t0, 12($fp)
lw $t1, -180($fp)
bne $t0, $t1, __L6

# goto __L7
j __L7
nop

# __L6:
__L6:

# __tmp13 = 1
li $t1, 1
sw $t1, -40($fp)

# if (_x > __tmp13) goto _L12
lw $t0, 8($fp)
lw $t1, -40($fp)
bgt $t0, $t1, __L12

# goto __L10
j __L10
nop

# __L12:
__L12:

# __tmp14 = 99
li $t1, 99
sw $t1, -56($fp)

# if (_x < __tmp14) goto _L9
lw $t0, 8($fp)
lw $t1, -56($fp)
blt $t0, $t1, __L9

# goto __L10
j __L10
nop

# __L9:
__L9:

# __L13:
__L13:

# __tmp15 = 0
li $t1, 0
sw $t1, -72($fp)

# if (_y > __tmp15) goto _L14
lw $t0, 12($fp)
lw $t1, -72($fp)
bgt $t0, $t1, __L14

# goto __L15
j __L15
nop

# __L14:
__L14:

# __tmp16 = 1
li $t1, 1
sw $t1, -88($fp)

# __tmp17 = _y + __tmp16
lw $t1, 12($fp)
lw $t2, -88($fp)
add $t3, $t1, $t2
sw $t3, -104($fp)

# _y = __tmp17
lw $t1, -104($fp)
sw $t1, 12($fp)

# __L16:
__L16:

# __tmp18 = 1
li $t1, 1
sw $t1, -120($fp)

# if (_y > __tmp18) goto _L17
lw $t0, 12($fp)
lw $t1, -120($fp)
bgt $t0, $t1, __L17

# goto __L18
j __L18
nop

# __L17:
__L17:

# __tmp19 = 2
li $t1, 2
sw $t1, -136($fp)

# __tmp20 = _y + __tmp19
lw $t1, 12($fp)
lw $t2, -136($fp)
add $t3, $t1, $t2
sw $t3, -8($fp)

# _y = __tmp20
lw $t1, -8($fp)
sw $t1, 12($fp)

# __L19:
__L19:

# __tmp21 = 3
li $t1, 3
sw $t1, -20($fp)

# if (_y > __tmp21) goto _L20
lw $t0, 12($fp)
lw $t1, -20($fp)
bgt $t0, $t1, __L20

# goto __L21
j __L21
nop

# __L20:
__L20:

# __tmp22 = 0
li $t1, 0
sw $t1, -36($fp)

# _z = __tmp22
lw $t1, -36($fp)
sw $t1, 16($fp)

# __L22:
__L22:

# if (_z != _x) goto _L23
lw $t0, 16($fp)
lw $t1, 8($fp)
bne $t0, $t1, __L23

# goto __L24
j __L24
nop

# __L23:
__L23:

# __tmp23 = 1
li $t1, 1
sw $t1, -52($fp)

# _z = __tmp23
lw $t1, -52($fp)
sw $t1, 16($fp)

# __L25:
__L25:

# __tmp24 = 1
li $t1, 1
sw $t1, -68($fp)

# __tmp25 = _x + __tmp24
lw $t1, 8($fp)
lw $t2, -68($fp)
add $t3, $t1, $t2
sw $t3, -84($fp)

# if (_z != __tmp25) goto _L26
lw $t0, 16($fp)
lw $t1, -84($fp)
bne $t0, $t1, __L26

# goto __L27
j __L27
nop

# __L26:
__L26:

# __tmp26 = 2
li $t1, 2
sw $t1, -100($fp)

# _z = __tmp26
lw $t1, -100($fp)
sw $t1, 16($fp)

# __L28:
__L28:

# __tmp28 = 1
li $t1, 1
sw $t1, -132($fp)

# __tmp29 = _x + __tmp28
lw $t1, 8($fp)
lw $t2, -132($fp)
add $t3, $t1, $t2
sw $t3, -148($fp)

# __tmp30 = 2
li $t1, 2
sw $t1, -16($fp)

# __tmp31 = _x + __tmp30
lw $t1, 8($fp)
lw $t2, -16($fp)
add $t3, $t1, $t2
sw $t3, -32($fp)

# param __tmp31
lw $t1, -32($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# param __tmp29
lw $t1, -148($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# param _x
lw $t1, 8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 3
jal _foo
la $sp, 12($sp)

# retrieve __tmp27
sw $v0, -116($fp)

# if (_z != __tmp27) goto _L29
lw $t0, 16($fp)
lw $t1, -116($fp)
bne $t0, $t1, __L29

# goto __L30
j __L30
nop

# __L29:
__L29:

# __L31:
__L31:

# __tmp32 = 4
li $t1, 4
sw $t1, -48($fp)

# if (_y > __tmp32) goto _L32
lw $t0, 12($fp)
lw $t1, -48($fp)
bgt $t0, $t1, __L32

# goto __L33
j __L33
nop

# __L32:
__L32:

# goto __L31
j __L31
nop

# __L33:
__L33:

# __tmp33 = 1
li $t1, 1
sw $t1, -64($fp)

# __tmp34 = _z - __tmp33
lw $t1, 16($fp)
lw $t2, -64($fp)
sub $t3, $t1, $t2
sw $t3, -80($fp)

# _z = __tmp34
lw $t1, -80($fp)
sw $t1, 16($fp)

# goto __L28
j __L28
nop

# __L30:
__L30:

# __tmp35 = 1
li $t1, 1
sw $t1, -96($fp)

# __tmp36 = _z - __tmp35
lw $t1, 16($fp)
lw $t2, -96($fp)
sub $t3, $t1, $t2
sw $t3, -112($fp)

# _z = __tmp36
lw $t1, -112($fp)
sw $t1, 16($fp)

# goto __L25
j __L25
nop

# __L27:
__L27:

# __tmp37 = 1
li $t1, 1
sw $t1, -128($fp)

# __tmp38 = _z - __tmp37
lw $t1, 16($fp)
lw $t2, -128($fp)
sub $t3, $t1, $t2
sw $t3, -144($fp)

# _z = __tmp38
lw $t1, -144($fp)
sw $t1, 16($fp)

# goto __L22
j __L22
nop

# __L24:
__L24:

# goto __L19
j __L19
nop

# __L21:
__L21:

# goto __L16
j __L16
nop

# __L18:
__L18:

# goto __L13
j __L13
nop

# __L15:
__L15:

# goto __L11
j __L11
nop

# __L10:
__L10:

# if (_x > _y) goto _L38
lw $t0, 8($fp)
lw $t1, 12($fp)
bgt $t0, $t1, __L38

# goto __L35
j __L35
nop

# __L38:
__L38:

# if (_y > _z) goto _L37
lw $t0, 12($fp)
lw $t1, 16($fp)
bgt $t0, $t1, __L37

# goto __L35
j __L35
nop

# __L37:
__L37:

# if (_z > _x) goto _L34
lw $t0, 16($fp)
lw $t1, 8($fp)
bgt $t0, $t1, __L34

# goto __L35
j __L35
nop

# __L34:
__L34:

# if (_y > _z) goto _L39
lw $t0, 12($fp)
lw $t1, 16($fp)
bgt $t0, $t1, __L39

# goto __L43
j __L43
nop

# __L43:
__L43:

# if (_z > _x) goto _L39
lw $t0, 16($fp)
lw $t1, 8($fp)
bgt $t0, $t1, __L39

# goto __L42
j __L42
nop

# __L42:
__L42:

# if (_x > _y) goto _L39
lw $t0, 8($fp)
lw $t1, 12($fp)
bgt $t0, $t1, __L39

# goto __L40
j __L40
nop

# __L39:
__L39:

# if (_z > _x) goto _L45
lw $t0, 16($fp)
lw $t1, 8($fp)
bgt $t0, $t1, __L45

# goto __L47
j __L47
nop

# __L47:
__L47:

# if (_x > _y) goto _L48
lw $t0, 8($fp)
lw $t1, 12($fp)
bgt $t0, $t1, __L48

# goto __L44
j __L44
nop

# __L48:
__L48:

# if (_y > _z) goto _L44
lw $t0, 12($fp)
lw $t1, 16($fp)
bgt $t0, $t1, __L44

# goto __L45
j __L45
nop

# __L44:
__L44:

# __tmp39 = 1
li $t1, 1
sw $t1, -156($fp)

# __tmp40 = _x + __tmp39
lw $t1, 8($fp)
lw $t2, -156($fp)
add $t3, $t1, $t2
sw $t3, -28($fp)

# _x = __tmp40
lw $t1, -28($fp)
sw $t1, 8($fp)

# goto __L46
j __L46
nop

# __L45:
__L45:

# __tmp41 = 1
li $t1, 1
sw $t1, -44($fp)

# __tmp42 = _x - __tmp41
lw $t1, 8($fp)
lw $t2, -44($fp)
sub $t3, $t1, $t2
sw $t3, -60($fp)

# _x = __tmp42
lw $t1, -60($fp)
sw $t1, 8($fp)

# __L46:
__L46:

# goto __L41
j __L41
nop

# __L40:
__L40:

# __tmp43 = 2
li $t1, 2
sw $t1, -76($fp)

# __tmp44 = _y * __tmp43
lw $t1, 12($fp)
lw $t2, -76($fp)
mul $t3, $t1, $t2
sw $t3, -92($fp)

# _y = __tmp44
lw $t1, -92($fp)
sw $t1, 12($fp)

# __L41:
__L41:

# goto __L36
j __L36
nop

# __L35:
__L35:

# param _x
lw $t1, 8($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# param _z
lw $t1, 16($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# param _y
lw $t1, 12($fp)
la $sp, -4($sp)
sw $t1, 0($sp)

# call _foo 3
jal _foo
la $sp, 12($sp)

# retrieve __tmp45
sw $v0, -108($fp)

# _z = __tmp45
lw $t1, -108($fp)
sw $t1, 16($fp)

# __L36:
__L36:

# __L11:
__L11:

# __tmp46 = 1
li $t1, 1
sw $t1, -124($fp)

# __tmp47 = _x + __tmp46
lw $t1, 8($fp)
lw $t2, -124($fp)
add $t3, $t1, $t2
sw $t3, -140($fp)

# _y = __tmp47
lw $t1, -140($fp)
sw $t1, 12($fp)

# goto __L5
j __L5
nop

# __L7:
__L7:

# goto __L3
j __L3
nop

# __L2:
__L2:

# __L3:
__L3:

# __tmp48 = _x + _y
lw $t1, 8($fp)
lw $t2, 12($fp)
add $t3, $t1, $t2
sw $t3, -152($fp)

# __tmp49 = __tmp48 + _z
lw $t1, -152($fp)
lw $t2, 16($fp)
add $t3, $t1, $t2
sw $t3, -160($fp)

# return __tmp49
lw $v0, -160($fp)

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


