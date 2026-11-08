.data
A: .word -42

.text
.globl main
main:
	la $t0, A
	lw $t1, 0($t0)
	bgez $t1, positivo # Se for >= 0, pula a conversao
	sub $t1, $zero, $t1 # (0 - A)
positivo:
	sw $t1, 0($t0) # Sobrescreve A
