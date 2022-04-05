.text
.globl main

main:
	li $v0, 5
	syscall
	move $s0,$a0
	li $s0, 1

while:
    mult $s0, $s1
    mflo $s0
    subi $s1, $s1, 1
    bnez $s1, while
    move $s0, $a0
    li $v0, 1
    syscall
    
end:
    li $v0, 10
    syscall