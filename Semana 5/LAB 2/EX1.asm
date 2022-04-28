.text
.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0 # Numero a contar

	beqz $a0, end # Se for igual a zero programa para 
			
	li $v0, 5
	syscall
	move $a1, $v0 # Digito a contar
	
	jal count_digits
	
	j main

end:
	li $v0, 10
	syscall
	
count_digits:
	move $s0, $a0 #Numero a verificar digitos 
	ori $s2, $zero, 0 # contador
	
while:
	beq $s0, $zero, endwhile
	# Guardando $ra
	addi $sp $sp, -4
	sw $ra, 0($sp)
	
	# Dividindo por 10 e verificando o resto
	div $s0, $s0, 10
	
	mfhi $t0 # movendo resto para $t0
			
	bne $a1, $t0, notequal # verifica se o resto é igual ao número que desejamos verificar, se sim, contador +1
	addi $s2, $s2, 1
notequal:
	jal while
	jr $ra
	
endwhile:
	jr $ra	
