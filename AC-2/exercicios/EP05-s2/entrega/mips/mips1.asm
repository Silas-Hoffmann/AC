.text
.globl main
main:
   	addi $s0, $zero, 2 #a = 2;
	addi $s1, $zero, 3 #b = 3;
	addi $s2, $zero, 4 #c = 4;
	addi $s3, $zero, 5 #d = 5;
	add $t0, $s0, $s1
	add $t1, $s2, $s3
	sub $s4, $t0, $t1 #x = (a+b) - (c+d);
	sub $t0, $s0, $s1
	add $s5, $t0, $s4 #y = a – b + x;
	sub $s1, $s4, $s5 #b = x – y;
	