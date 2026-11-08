.data
x1: .word 15
x2: .word 25
x3: .word 13
x4: .word 17
soma: .word -1

.text
.globl main
main:
	la $t0, x1
	lw $t1, 0($t0) # x1
	lw $t2, 4($t0) # x2
	lw $t3, 8($t0) # x3
	lw $t4, 12($t0) # x4

	add $t5, $t1, $t2
	add $t5, $t5, $t3
	add $t5, $t5, $t4 # Soma

	sw $t5, 16($t0) # Sobrescreve soma
