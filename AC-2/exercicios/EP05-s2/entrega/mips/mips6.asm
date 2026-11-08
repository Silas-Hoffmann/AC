.text
.globl main
main:
	lui $s0, 0x7FFF
	ori $s0, 0xFFFF # x = maior inteiro
	
	lui $s1, 0x0004
	ori, $s1, 0x93E0 # y = 300.000
	
	sll $t0, $s1, 2 # 4y
	
	sub $s2, $s1, $t0 # x - 4y
	