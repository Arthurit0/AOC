.data
maior:
	.asciiz "O maior valor é "
menor: 
	.asciiz "O menor valor é "
	
.text
.globl main



main:
	li $v0, 5
	syscall
	move $a0, $v0
	li $v0, 5
	syscall
	move $a1, $v0
	li $v0, 5
	syscall
	move $a2, $v0
	jal lesserngreater
	
	move $t0, $v0 # Guarda o valor em v0, pois ele é chamado para instruções
    	
    	li $v0, 11  # syscall 11: Imprime um caractere baseado no seu valor ASCII
    	li $a0, 10  # O valor ASCII de uma nova linha é "10"
    	syscall
    	
    	la $a0, maior # Chama string para o maior
    	li $v0, 4
    	syscall
    	
    	move $a0, $t0
    	li $v0, 1
    	syscall
    	
    	li $v0, 11  # syscall 11: Imprime um caractere baseado no seu valor ASCII
    	li $a0, 10  # O valor ASCII de uma nova linha é "10"
    	syscall
    	
    	la $a0, menor # Chama string para o menor
    	li $v0, 4
    	syscall
    	
    	move $a0, $v1
    	li $v0, 1
    	syscall
	
	
end:
	li $v0, 10
	syscall
	
lesserngreater:
	bgt $a1, $a0, a1_a0 # a1 > a0 ?
	bgt $a2, $a0, a2_a0_a1 # a2 > a0 ? Sim: a0 > a1 e a2 > a0, então a2 > a0 > a1, Não: a0 > a1 e a0 > a2 
	
	move $v0, $a0 # bigger: a0
	
	bgt $a1, $a2, a0_a1_a2 # a1 > a2 ? Sim: a0 > a1 > a2, Não: a0 > a2 > a1
	
	move $v1, $a1 # lower: a1
	j return # a0a2a1

a0_a1_a2:
	move $v1, $a2 # lower: a2
	j return # a0a1a2

a1_a0:
	bgt $a2, $a0 a0_lower # a1 > a0 é verdade, mas a2 > a0? Sim: a1 > a0 e a2 > a0, Não a1 > a0 e a0 > a2, então a1 > a0 > a2
	
	move $v0, $a1 # bigger: a1
	move $v1, $a2 # lower: a2
	
	j return # a1a0a2

a0_lower:
	move $v1, $a0 # lower: a0
	
	bgt $a1, $a2, a1_a2_a0 # a1 > a2 ? Sim: a1 > a2 > a0, Não : a2 > a1 > a0
	
	move $v0, $a2 # bigger: a2
	
	j return # a2a1a0

a1_a2_a0:
	move $v0, $a1 # bigger: a1
	
	j return # a1a2a0
	
a2_a0_a1:
	move $v0, $a2 # bigger: a2
	
	move $v1, $a1 # lower: a1
	
	# a2a0a1
	
return:
	jr $ra
