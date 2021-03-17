0x52044300x52047800x5204bf0.align 2
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

_bar: .space 1
.align 2

_hhh: .space 1
.align 2

_iii: .space 1
.align 2

_foo: .space 1
.align 2

.align 2

.align 2

.text
.align 2

