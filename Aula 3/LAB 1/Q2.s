.data
endl:
	.asciiz "\n"
error:
	.asciiz "ERRO"

.text
.globl main

main:
	li $s0, 0 # soma
	li $s1, -1 # contador
	li $v0, 5 # Chama Scan
	syscall
while:
	add $s0, $s0, $v0 # Soma o que foi scanneado em $s0
	addi $s1, $s1, 1 # Incrementa contador
	bne $v0, -1, while # Se o que for scanneado for diferente de -1, volta para while

endwhile:
	# Imprime Soma
	move $a0, $s0
	li $v0, 1
	syscall
	
	# Pular Linha ("versão mais complexa")
	la $a0, endl
	li $v0, 4
	syscall 
	
	# Faz e Imprime Média 
	div $s0, $s0, $s1 # Faz a média desta soma em $s0
	move $a0, $s0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall  
	 
	
