.data
x: .word 5
z: .word 7
y: .word 0

.text
.globl main
main:
	la $t0, x
	lw $t1, 0($t0) # x
	lw $t2, 4($t0) # z

	sll $t3, $t1, 7 # 128x
	sub $t3, $t3, $t1 # 127x

	sll $t4, $t2, 6 # 64z
	add $t4, $t4, $t2 # 65z

	sub $t5, $t3, $t4
	addi $t5, $t5, 1 # 127x - 65z + 1

	sw $t5, 8($t0) # Sobrescreve y
