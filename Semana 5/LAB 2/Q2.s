.text
.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0 # Numero a contar

	beqz $a0, end # Se for igual a zero programa para 
	
	jal sum_digits
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 11  # syscall 11: Imprime um caractere baseado no seu valor ASCII
    	li $a0, 10  # O valor ASCII de uma nova linha é "10"
    	syscall
	
	j main
end:
	li $v0, 10
	syscall
	
sum_digits:
	beq $a0, $zero, end_recursion
	# Guardando $ra
	addi $sp $sp, -8
	sw $ra, 4($sp)
	
	# Dividindo por 10 e verificando o resto
	div $a0, $a0, 10
	mfhi $s0 # movendo resto para $s0
	sw $s0, 0($sp) # salvando resto
	
	jal sum_digits
	
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	
	# Soma em $v0
	add $v0, $v0, $s0
	jr $ra
	
end_recursion:
	ori $v0, $zero, 0
	jr $ra	
