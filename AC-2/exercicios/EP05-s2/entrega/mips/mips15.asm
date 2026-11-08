.data
vetor: .space 400 # 100 inteiros
soma:  .word 0

.text
.globl main
main:
	la $t0, vetor
	li $t1, 0 # i = 0
	li $t2, 100 # Limite
	li $t3, 0 # Acumulador da soma

loop:
	beq $t1, $t2, fim
	sll $t4, $t1, 1 # 2*i
	addi $t4, $t4, 1 # 2*i + 1

	sll $t5, $t1, 2 # Offset na memoria = i * 4 bytes
	add $t6, $t0, $t5 # Endereço atual = vetor + offset
	sw $t4, 0($t6) # vetor[i] = 2*i + 1

	add $t3, $t3, $t4 # soma += vetor[i]
	addi $t1, $t1, 1 # i++
	j loop
fim:
	sw $t3, 400($t0) # Salva soma
