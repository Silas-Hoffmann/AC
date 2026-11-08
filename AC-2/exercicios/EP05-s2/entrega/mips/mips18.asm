.data
x: .word 3
y: .word 4
k: .word 0

.text
.globl main
main:
	la $t0, x
	lw $t1, 0($t0) # Base x
	lw $t2, 4($t0) # Expoente y

	li $t3, 1 # k = 1
	li $t4, 0 # i

loop_potencia:
	beq $t4, $t2, fim_potencia

	move $t5, $t3
	li $t3, 0
	li $t6, 0
    
loop_multiplica:
	beq $t6, $t1, fim_multiplica
	add $t3, $t3, $t5 # k += temp
	addi $t6, $t6, 1
	j loop_multiplica
fim_multiplica:

	addi $t4, $t4, 1
	j loop_potencia

fim_potencia:
	sw $t3, 8($t0) # resultado final
