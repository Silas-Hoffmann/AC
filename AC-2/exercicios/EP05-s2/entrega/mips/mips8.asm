.text
.globl main
main:
	lui $8, 0x1234
	ori $8, $8, 0x5678
	
	srl $9, $8, 24
	
	srl $10, $8, 16
	andi $10, $10, 0xFF
	
	srl $11, $8, 8
	andi $11, $11, 0xFF
	
	andi $12, $8, 0xFF
	