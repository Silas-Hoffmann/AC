.text
.globl main
main:
	addi $s0, $zero, 3 # x = 3
	addi $s1, $zero, 4 # y = 4
	
	add $t0, $s0, $s0 # 2x
	add $t0, $t0, $t0 # 4x
	add $t0, $t0, $t0 # 8x
	add $t0, $t0, $t0 # 16x
	sub $t0, $t0, $s0 # 15x
	
	add $t1, $s1, $s1 # 2y
	add $t1, $t1, $t1 # 4y
	add $t1, $t1, $t1 # 8y
	add $t1, $t1, $t1 # 16y
	add $t1, $t1, $t1 # 32y
	add $t1, $t1, $t1 # 64y
	
	add $t2, $s1, $s1 # 2y
	add $t1, $t1, $t2 # 66y
	add $t1, $t1, $s1 # 67y
	
	add $s2, $t0, $t1
	add $s2, $s2, $s2
	add $s2, $s2, $s2 # (15*x + 67*y)*4
	