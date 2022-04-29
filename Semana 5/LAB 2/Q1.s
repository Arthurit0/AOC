.text
.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0 # Numero a contar

	beqz $a0, end # Se for igual a 0 programa para 
			
	li $v0, 5
	syscall
	move $a1, $v0 # Digito a contar
	
	jal count_digits
	
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
	
count_digits:
	move $s0, $a0 #Numero a verificar digitos 
	
recursion:
	beq $s0, $zero, end_recursion
	# Guardando $ra
	addi $sp $sp, -8
	sw $ra, 4($sp)
	
	# Dividindo por 10 e verificando o resto
	div $s0, $s0, 10
	mfhi $s1 # movendo resto para $s1
	sw $s1, 0($sp) # salvando resto
	
	jal while
	
	lw $s1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	
	bne $s1, $a1, notequal # verifica se o resto é igual ao número que desejamos verificar, se sim, contador +1
	addi $v0, $v0, 1
notequal:	
	jr $ra
	
end_recursion:
	ori $v0, $zero, 0
	jr $ra	
