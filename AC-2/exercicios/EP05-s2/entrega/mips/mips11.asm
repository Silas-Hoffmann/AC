.data
x: .word 100000
z: .word 200000
y: .word 0

.text
.globl main
main:
	la $t0, x
	lw $t1, 0($t0) # x
	lw $t2, 4($t0) # z

	sub $t3, $t1, $t2 # x - z

	lui $t4, 0x0004
	ori $t4, $t4, 0x93E0 # 300000

	add $t5, $t3, $t4 # (x - z) + 300000
	sw $t5, 8($t0) # Sobrescreve y
