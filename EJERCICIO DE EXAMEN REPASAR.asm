.data 
num_eventos: 
	.word 	6
	.align 2
eventos: 
	.word 	6
	.word	1
	.word	24
	.word	35
	.asciiz		"Puerta entrada cerrada"
	.space  127
	.space 	2
	
	.word 	8
	.word	14
	.word	6
	.word	18
	.asciiz		"Calefaccion encendida"
	.space 	128
	.space 	2
	
	.word 	22
	.word	22
	.word	17
	.word	43
	.asciiz		"Luz entrada encencida"
	.space 129
	.space 	2
	
	.word 	156
	.word	20
	.word	57
	.word	9
	.asciiz		"Luz entrada apagada"
	.space 130
	.space 	2
	
	.word 	37
	.word	15
	.word	40
	.word	42
	.asciiz		"Puerta entrada abierta"
	.space  127
	.space 	2
	
	.word 	360
	.word	2
	.word	11
	.word	15
	.asciiz		"Calefacción apagada"
	.space 130
	.space	166992
	#100-6 = 994 * (150+4+(4+4+4)+2)
	# esto viene de que en l aestructura tenemos 1000 elementos pero en 
	#realidad solo utilizamos 6, ademas tenemos que contar cuanto 
	# vale la estructura en decir descrpicion = 150, dia_ano = 4
	# instante = hota =4 , minuto=4, segundo=4 y los dos bytes de relleno
	#ya qie no es multiplo de 4 
str000:
	.asciiz		"  DIA:  "
str001:
	.asciiz		". HORA: "
str002:
	.asciiz		". DESCRIPCIÓN: "
str003:
	.asciiz		", "
.text	
.globl	main
imprimir_eventos: 
	addiu	$sp, $sp, -16	
	sw	$ra, 0($sp)
	sw	$s1, 4($sp)
	sw	$s0, 8($sp)
	sw	$s2, 12($sp)
	
	li	$s0, 0		#i 
	lw	$s1, num_eventos
ie_for: 
	bge	$s0, $s1, ie_finfor	
	la	$a0, str000
	jal	print_string 
	la 	$t0, eventos
	mul	$t1, $s0, 168
	add	$s2,  $t1, $t0
	lw	$t3, 0($s2)
	move	$a0,$t3
	jal	print_integer
	la	$a0, str001
	jal	print_string
	lw	$a0, 4($s2)
	jal	print_integer
	la	$a0, str003
	jal	print_string
	lw	$a0, 8($s2)
	jal	print_integer
	la	$a0, str003
	jal	print_string
	lw	$a0, 12($s2)
	jal	print_integer
	la	$a0, str002
	jal	print_string
	#para poder poder lo que seria el array de descripción tenemos que pasarle la parte en memerio en la que empieza, entonces una ves que hemos calculado lo que seria 
	# el s2 le sumamos tantos bytes como venga antes de descripción y ya se lo pasamos, ya que print_string solo acepta punteros a memoria  
	addiu	$t0,$s2,16
	move	$a0,$t0
	jal	print_string
	addiu	$s0,$s0, 1
	li	$a0, '\n'
	jal	print_character
	j	ie_for
		
ie_finfor:
	
	lw	$ra, 0($sp)
	lw	$s1, 4($sp)
	lw	$s0, 8($sp)
	lw	$s2, 12($sp)
	addiu	$sp, $sp, 16	
	jr	$ra
	
	 
	
	

main:
	jal imprimir_eventos
	li 	$v0, 10 
	syscall
	jr	$ra 
	
print_integer:
	li	$v0, 1
	syscall	
	jr	$ra

print_character:
	li	$v0, 11
	syscall	
	jr	$ra

print_string:
	li	$v0, 4
	syscall	
	jr	$ra

read_character:
	li	$v0, 12
	syscall	
	jr	$ra
