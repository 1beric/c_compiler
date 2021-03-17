0x5204500.align 2
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

_foo: .space 1
.align 2

_a: .space 4
.align 2

_x: .space 4
.text
.align 2

