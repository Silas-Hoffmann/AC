.data
A: .word 15
livre1: .space 4 # Primeira posicao livre
livre2: .word 0 # Segunda posicao livre

.text
.globl main
main:
	la $t0, A
	lw $t1, 0($t0)
    
	andi $t2, $t1, 1 # Isola o ultimo bit
	sw $t2, 8($t0) # Salva na segunda posicao livre
