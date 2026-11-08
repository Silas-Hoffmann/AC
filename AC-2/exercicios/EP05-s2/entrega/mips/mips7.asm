.text
.globl main
main:
	ori $8, $0, 0x01
	sll $8, $8, 31 # move o bit 1 para o mais significativo
	sra $8, $8, 31 # preenche todos os bits com 1
	