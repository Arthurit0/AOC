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
	bgt $a0, $a1, a0_maior
	move $v0, a1
	move $v1, a0
	j comp_a3
	
	
a0_maior:
	move $v0, $a0
	move $v1, $a1
	
cmp_a3:
	bgt $v0, $a2, v0_ok
	move $v0, $a2
	jr $ra
	
v0_ok:
	blt $v1, $a2, v1_ok
	move $v1, $a2
	
v1_ok:
	jr $ra
	
return:
	jr $ra
