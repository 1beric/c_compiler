0x52043600x52046b00x52049300x5204d30.align 2
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

_println: .space 1
.align 2

_fgh: .space 1
.align 2

_bar: .space 1
.align 2

_foo: .space 1
.align 2

_f: .space 1
.align 2

.text
.align 2

