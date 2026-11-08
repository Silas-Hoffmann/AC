.text
.globl main
main:
	addi $s0, $zero, 1 # x = 1
	add $t0, $s0, $s0
	add $t0, $t0, $t0
	add $s1, $s0, $t0 # 5*x
	addi $s1, $s1, 15 # 5*x + 15
	