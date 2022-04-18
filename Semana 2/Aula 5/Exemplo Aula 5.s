	.data
endl:
	.asciiz "\n"
	
	.text
	.globl main
main:
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	sgt $t0, $s0, $s1
	beqz $t0, greater
	addi $s0, $s0, 30
	
greater:
	addi $s1, $s1, 10
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, endl # Pular Linha ("versão mais complexa")
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	
end:
	li $v0, 10
	syscall