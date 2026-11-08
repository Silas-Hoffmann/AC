.text
.globl main
main:
	addi $s0, $zero, 3 # x = 3
	addi $s1, $zero, 4 # y = 4

	sll $t0, $s0, 4 # t0 = 16x
	sub $t0, $t0, $s0 # t0 = 15x
	
	sll $t1, $s1, 6 # 64y
	sll $t2, $s1, 1 # 2y
	add $t1, $t1, $t2 # 66y
	add $t1, $t1, $s1 # 67y

	add $s2, $t0, $t1 # 15x + 67y
	sll $s2, $s2, 2 # (15x + 67y)* 4
