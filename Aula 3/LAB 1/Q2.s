.data
endl:
	.asciiz "\n"
error:
	.asciiz "ERRO"

.text
.globl main

main:
	li $s0, 0 # soma
	li $s1, 0 # contador
while:

	li $v0, 5 # Chama Scan
	syscall
	beq $v0, -1, endwhile # Se o que for scanneado igual a -1, sai do while
	add $s0, $s0, $v0 # Soma o que foi scanneado em $s0
	addi $s1, $s1, 1 # Incrementa contador
	b while

endwhile:
	beq $s1, 0, minusone # Se o contador não incrementou, o primeiro scanneado foi -1, tratamos essa condição na label minusone
	
	move $a0, $s0 # Imprime Soma
	li $v0, 1 
	syscall
	
	la $a0, endl # Pular Linha ("versão mais complexa")
	li $v0, 4
	syscall
		
	div $s0, $s0, $s1 # Faz a média desta soma em $s0
	move $a0, $s0
	li $v0, 1
	syscall

end:
	li $v0, 10
	syscall  
	 
minusone:
	move $a0, $s0 # O que foi somado, que nesse caso sempre será 0
	li $v0, 1
	syscall
	
	la $a0, endl # Pular Linha ("versão mais complexa")
	li $v0, 4
	syscall

	la $a0, error # Load da string "ERRO"
	li $v0 4
	syscall
	b end
