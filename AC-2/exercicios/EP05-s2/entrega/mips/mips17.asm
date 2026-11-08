.data
x: .word 5
y: .word 12
k: .word 0 # Terceira posicao livre

.text
.globl main
main:
	la $t0, x
	lw $t1, 0($t0) # x
	lw $t2, 4($t0) # y
	li $t3, 0 # k
	li $t4, 0 # Contador
    
loop_mult:
	beq $t4, $t2, fim # Se contador == y, encerra
	add $t3, $t3, $t1 # k += x
	addi $t4, $t4, 1 # Contador++
	j loop_mult
fim:
	sw $t3, 8($t0) # Salva em k
