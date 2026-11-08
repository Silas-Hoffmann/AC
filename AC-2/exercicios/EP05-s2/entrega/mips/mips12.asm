.data
val: .word 10
p1:  .word val
p2:  .word p1
x:   .word p2

.text
.globl main
main:
	la $t0, x
	lw $t1, 0($t0) # p2
	lw $t2, 0($t1) # p1
	lw $t3, 0($t2) # val
	lw $t4, 0($t3) # k

	sll $t4, $t4, 1 # 2*k

	sw $t4, 0($t3) # Reescreve val
