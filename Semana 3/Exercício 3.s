.data
greater:
	.asciiz "O maior é "

lesser:
	.asciiz " e o menor é "
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
	
	move $t0, $v0
    	
    	li $v0, 11  # syscall 11: Imprime um caractere baseado no seu valor ASCII
    	li $a0, 10  # O valor ASCII de uma nova linha é "10"
    	syscall
    	
    	move $a0, $t0
    	li $v0, 1
    	syscall
    	
    	li $v0, 11  # syscall 11: Imprime um caractere baseado no seu valor ASCII
    	li $a0, 10  # O valor ASCII de uma nova linha é "10"
    	syscall
    	
    	move $a0, $v1
    	li $v0, 1
    	syscall
	
	
end:
	li $v0, 10
	syscall
	
lesserngreater:
	bgt $a1, $a0, a1a0 # a1 > a0 ?
	bgt $a2, $a0, a2a0a1 # a2 > a0 ? Se sim, sabemos que a0 > a1 e a2 > a0, logo, a2 > a0 > a1
	move $v0, $a0
	bgt $a1, $a2 a0a1a2 # a1 > a2 ?
	move $v1, $a1 
	j return # a0a2a1
a0a1a2:
	move $v1, $a2
	j return # a0a1a2

a1a0:
	bgt $a2, $a0 a0islesser # a1 > a0 é verdade, mas a2 é maior que a0? Se não, a1 > a0 > a2,
	move $v0, $a1
	move $v1, $a2
	j return # a1a0a2

a0islesser:
	move $v1, $a0
	bgt $a1, $a2, a1a2a0
	move $v0, $a2
	j return # a2a1a0
a1a2a0:
	move $v0, $a1
	j return # a1a2a0
	
a2a0a1:
	move $v0, $a2
	move $v1, $a1
	# a2a0a1
	
return:
	jr $ra