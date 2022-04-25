.text
.globl main

main:
	li $v0, 5
	syscall
	
	move $s0, $v0 # n de inteiros
	move $s1, $v0 # contador
	
for_nums:
	add $sp, $sp, -4
	li $v0, 5
	syscall
	
	sw $v0, 0($sp)
	sub $s1, $s1, 1
	bgt $s1, $zero, for_nums
	
	jal maior

	
end:
	li $v0, 10
	syscall
	
maior: