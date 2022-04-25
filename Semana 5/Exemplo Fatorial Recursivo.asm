.text
.globl main

main:
	li $a0, 4
	jal fatorial
	move $a0, $v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
	
fatorial:
	# if ($a0 < 1)
	blt $a0, 1 , fat_parada
	# salvar contexto
	addi $sp, $sp, 8
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	# código principal com chamada recursiva
	move $s0, $a0
	addi $a0, $a0, -1
	jal fatorial # $v0 = fatorial ($a0-1)
	mul $v0, $v0, $s0 # $v0 *= $s0
	# restaurar
	jr $ra
	
fat_parada:
	ori $v0, 1
	jr $ra