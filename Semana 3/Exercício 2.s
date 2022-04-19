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
	
	move $a0, $v0
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
