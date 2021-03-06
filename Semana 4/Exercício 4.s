.data
print1:
	.asciiz  "O número possui "
print2:
	.asciiz " digito(s)"

.text
.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0
	jal digits
	
	move $t0, $v0
	
	li $v0, 11  # syscall 11: Imprime um caractere baseado no seu valor ASCII
    	li $a0, 10  # O valor ASCII de uma nova linha é "10"
    	syscall
    	
    	la $a0, print1
    	li $v0, 4
    	syscall
    	
    	move $a0, $t0
    	
    	li $v0, 1
    	syscall
    	
    	la $a0, print2
    	li $v0, 4
    	syscall
    	
end:
	li $v0, 10
	syscall
	
digits:
	ori $s0, $zero, 1
	la $s1, ($a0)
while:
	blt $s1, 10, end_digits
	addi $s0, $s0, 1
	div $s1, $s1, 10
	j while
	
end_digits:
	move $v0, $s0
	jr $ra
