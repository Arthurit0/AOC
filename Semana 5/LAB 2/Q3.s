.text
.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0
	
	jal recursive_fib
	
	move $a0, $v0
	li $v0, 1
	syscall
	
end:
	li $v0, 10
	syscall
	
recursive_fib:
	li $v0, 1 # caso do argumento ser 0
	li $s0, 0
	li $s1, 1
	move $s2, $a0 # Copia número da n-ésima posição

recursion:

	beq $s2, $zero, end_recursion
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	
	move $t0, $s1
	add $s1, $s0, $s1
	move $s0, $t0
	
	addi $s2, $s2, -1
	
	sw $s1, 4($sp)

	jal recursion
	
	lw $ra, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	
	bnez $s2, jump
	move $v0, $s1
jump:
	addi $s2, $s2, 1
	jr $ra

end_recursion:
	jr $ra