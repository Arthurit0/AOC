.data

.text
.globl main

main:
	li $s0, 0 # Anterior do Fib
	li $s1, 1 # Atual do Fib
	li $v0, 5 
	syscall
	move $s3, $v0 # Contador passado pelo usuário, n-ésimo número de Fib
	
while:
	beq $s3, 0, endwhile # Quebra loop se o contador estiver/for = 0
	
	add $t0, $s0, $s1 # Soma anterior com atual, guarda em $s2
    	move $s0, $s1 # Anterior guarda o Atual
    	move $s1, $t0 # Atual agora é a soma, que está em $s2
	addi $s3, $s3, -1 # Contador diminui
	
	b while # Nova iteração do Lopp
	
endwhile:
	move $a0, $s1
	li $v0, 1
	syscall # Imprime o n-ésimo número de Fibonacci
	
end:
	li $v0, 10
	syscall