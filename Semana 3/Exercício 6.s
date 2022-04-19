.data
print:
	.asciiz "O valor final é "

.text
.globl main

main:
	ori $s0, $zero, 27 # numeros de teste de preservação
	ori $s1, $zero, 27
	ori $s2, $zero, 27
	ori $s3, $zero, 27
	ori $s4, $zero, 27
	ori $s5, $zero, 27
	ori $s6, $zero, 27
	ori $s7, $zero, 27
	
	
	ori $a0, $zero, 1  # arg g
	ori $a1, $zero, 1  # arg h 
	ori $a2, $zero, 2  # arg i
	ori $a3, $zero, 2  # arg j
	
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	
	ori $s0, $zero, 1  # arg k
	ori $s1, $zero, 1  # arg l
	
	jal function
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	
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
	
function:
	addi $sp, $sp, -12
	sw $s2, 8($sp) 
	sw $s3, 12($sp) 
	sw $s4, 16($sp) 
	
	add $s2, $a0, $a1  # (g+h)
	add $s3, $a2, $a3  # (i+j)
	add $s4, $s0, $s1  # (k+z)
	
	sub $s2, $s2, $s3 # (g+h) - (i+j)
	
	li $t0, 2 # Fazendo load de 2
	mul $s4, $s4, $t0 # 2 * (k+z)
	
	add $s2, $s2, $s4 # (g+h) - (i+j) + 2 * (k+z)
	
	move $v0, $s2
	
	lw $s2, 8($sp) 
	lw $s3, 12($sp) 
	lw $s4, 16($sp)
	addi $sp, $sp, 12
	
	jr $ra
	
	