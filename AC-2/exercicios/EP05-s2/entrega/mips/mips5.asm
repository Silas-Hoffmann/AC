.text
.globl main
main:
	lui $s0, 0x0001
	ori $s0, $s0, 0x86A0 # x = 100000
	
	lui $s0, 0x0003
	ori $s0, $s0, 0x0D40 # y = 200000
	
	add $s2, $s1, $s2 # x + y
	