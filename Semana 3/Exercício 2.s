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
	
	li $v0, 1
	syscall

end:
	li $v0, 10
	syscall

greater:
	bgt $a0, $a1, true
	move $t1, $a0
	move $a0, $a1
true:
	jr $ra