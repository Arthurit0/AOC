.data
print:
	.asciiz "O maior valor é "

.text
.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0
	li $v0, 5
	syscall
	move $a1, $v0
	
	jal greater
	
	move $t0, $v0

	li $v0, 11  # syscall 11: Imprime um caractere baseado no seu valor ASCII
    	li $a0, 10  # O valor ASCII de uma nova linha é "10"
    	syscall
    	
    	la $a0, print
    	li $v0, 4
    	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall

end:
	li $v0, 10
	syscall

greater:
	bgt $a0, $a1, true
	move $v0, $a1
	jr $ra
	
true:
	move $v0, $a0
	jr $ra
