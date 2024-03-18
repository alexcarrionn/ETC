
	.data	

str000:
	.asciiz		"El entero no es válido.\n"
	.align	2
paises:
	.asciiz		"Liechtenstein"
	.space	50
	.word	38547
	.word	166
	.asciiz		"Mónaco"
	.space	56
	.word	38897
	.word	165
	.asciiz		"Luxemburgo"
	.space	53
	.word	602005
	.word	106
	.asciiz		"Bermudas"
	.space	55
	.word	71176
	.word	102
	.asciiz		"Macao"
	.space	58
	.word	653100
	.word	81
	.asciiz		"Suiza"
	.space	58
	.word	8508898
	.word	80
	.align	2
num_paises:
	.word	6
str001:
	.asciiz		"\n"
str002:
	.asciiz		"\nExamen de ETC de ensamblador\n"
str003:
	.asciiz		"\n 1. Lectura de un entero\n 2. Calcular PIB de varios paises\n 3. Eliminar un carácter de una cadena\n 4. Filtrar paises por población\n 5. Invertir array\n 0. Salir\n\nElige una opción: "
str004:
	.asciiz		"\n\n"
str005:
	.asciiz		"Introduce un entero entre 20 y 40: "
str006:
	.asciiz		"El entero leído ha sido: "
str007:
	.asciiz		".\n"
str008:
	.asciiz		"Suiza"
str009:
	.asciiz		"Mónaco"
str010:
	.asciiz		"España"
str011:
	.asciiz		"Liechtenstein"
	.align	2
main.tests:
	.word	str008
	.word	str009
	.word	str010
	.word	str011
str012:
	.asciiz		"El PIB de «"
str013:
	.asciiz		"» no se conoce.\n"
str014:
	.asciiz		"» es de "
str015:
	.asciiz		" miles de dólares.\n"
	.asciiz		"Bienvenidos al examen de ensamblador."
main.caracteres:
	.ascii		" aeiou"
str016:
	.asciiz		"Texto inicial:                             «"
str017:
	.asciiz		"»\n"
str018:
	.asciiz		"Texto después de eliminar el carácter «"
str019:
	.asciiz		"»: «"
	.align	2
main.tests20:
	.word	100000
	.word	1000000
	.word	10000000
str020:
	.asciiz		"Países con más de "
str021:
	.asciiz		" habitantes:\n"
str022:
	.asciiz		"Total de paises encontrados: "
	.align	2
main.tests24:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	10
	.word	9
	.word	4
	.word	2
	.word	1
	.word	3
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	5
	.align	2
jump_table000:
	.word	B6_4
	.word	B6_12
	.word	B6_5
	.word	B6_13
	.word	B6_10
	.word	B6_16
str023:
	.asciiz		"Array:           "
str024:
	.asciiz		" "
str025:
	.asciiz		"\nArray invertido: "
str026:
	.asciiz		"¡Adiós!\n"
str027:
	.asciiz		"Opción incorrecta. Pulse cualquier tecla para seguir.\n"

	.text	

preguntar_entero:
        # POR HACER
        break

compara_cadena:
B1_1:	lbu	$t1, 0($a0)
	bnez	$t1, B1_3
	lbu	$t1, 0($a1)
	li	$v0, 1
	beqz	$t1, B1_4
B1_3:	addiu	$a2, $a0, 1
	addiu	$v1, $a1, 1
	lbu	$t1, 0($a1)
	lbu	$a3, 0($a0)
	li	$v0, 0
	move	$a0, $a2
	move	$a1, $v1
	beq	$a3, $t1, B1_1
B1_4:	jr	$ra

obtener_pib:
        # POR HACER
        break

cadena_eliminar:
        # POR HACER
        break

imprimir_y_contar_paises_mas_poblados:
        # POR HACER
        break

invertir_array_int:
        # POR HACER
        break

	.globl	main
main:
	addiu	$sp, $sp, -376
	sw	$ra, 372($sp)
	sw	$fp, 368($sp)
	sw	$s7, 364($sp)
	sw	$s6, 360($sp)
	sw	$s5, 356($sp)
	sw	$s4, 352($sp)
	sw	$s3, 348($sp)
	sw	$s2, 344($sp)
	sw	$s1, 340($sp)
	sw	$s0, 336($sp)
	jal	clear_screen
	la	$a0, str002
	jal	print_string
	la	$t1, str003
	sw	$t1, 92($sp)
	la	$t1, str004
	sw	$t1, 88($sp)
	la	$t1, str027
	sw	$t1, 84($sp)
	la	$t1, str026
	sw	$t1, 80($sp)
	la	$t1, str005
	sw	$t1, 76($sp)
	la	$t1, str006
	sw	$t1, 72($sp)
	la	$t1, str007
	sw	$t1, 68($sp)
	la	$t1, str012
	sw	$t1, 152($sp)
	la	$t1, main.tests
	sw	$t1, 148($sp)
	la	$t1, str013
	sw	$t1, 144($sp)
	la	$t1, str014
	sw	$t1, 140($sp)
	la	$t1, str015
	sw	$t1, 136($sp)
	lui	$t1, 27746
	lui	$v0, 29550
	lui	$v1, 25956
	lui	$a0, 25965
	lui	$a1, 25888
	lui	$a2, 8307
	ori	$a2, $a2, 28516
	sw	$a2, 64($sp)
	ori	$a1, $a1, 27745
	sw	$a1, 60($sp)
	ori	$a0, $a0, 24952
	sw	$a0, 56($sp)
	ori	$v1, $v1, 8302
	sw	$v1, 52($sp)
	ori	$v0, $v0, 25888
	sw	$v0, 48($sp)
	ori	$t1, $t1, 28001
	sw	$t1, 44($sp)
	lui	$t1, 29295
	ori	$t1, $t1, 25697
	sw	$t1, 40($sp)
	lui	$t1, 26990
	ori	$t1, $t1, 25974
	sw	$t1, 36($sp)
	lui	$t1, 28261
	ori	$t1, $t1, 26946
	sw	$t1, 32($sp)
	la	$t1, str016
	sw	$t1, 28($sp)
	la	$t1, str017
	sw	$t1, 24($sp)
	la	$t1, str018
	sw	$t1, 132($sp)
	la	$t1, main.caracteres
	sw	$t1, 128($sp)
	la	$t1, str019
	sw	$t1, 124($sp)
	la	$t1, str020
	sw	$t1, 120($sp)
	la	$t1, main.tests20
	sw	$t1, 116($sp)
	la	$t1, str021
	sw	$t1, 112($sp)
	la	$t1, str022
	sw	$t1, 108($sp)
	la	$t1, main.tests24
	sw	$t1, 20($sp)
	la	$t1, str023
	sw	$t1, 104($sp)
	la	$fp, str024
	la	$t1, str025
	sw	$t1, 100($sp)
	la	$t1, str001
	sw	$t1, 96($sp)
	j	B6_2
B6_1:	lw	$a0, 84($sp)
	jal	print_string
	jal	read_character
B6_2:	lw	$a0, 92($sp)
	jal	print_string
	jal	read_character
	move	$s4, $v0
	lw	$a0, 88($sp)
	jal	print_string
	sll	$t1, $s4, 24
	sra	$t1, $t1, 24
	addiu	$v0, $t1, -48
	li	$t1, 5
	sltu	$t1, $t1, $v0
	bnez	$t1, B6_1
	sll	$t1, $v0, 2
	lw	$t1, jump_table000($t1)
	li	$s2, 0
	li	$s3, 0
	jr	$t1
B6_4:	lw	$a0, 80($sp)
	jal	print_string
	li	$a0, 0
	jal	mips_exit
	j	B6_2
B6_5:	lw	$a0, 152($sp)
	jal	print_string
	lw	$t1, 148($sp)
	addu	$t1, $t1, $s2
	lw	$s4, 0($t1)
	move	$a0, $s4
	jal	print_string
	move	$a0, $s4
	jal	obtener_pib
	move	$s4, $v0
	li	$t1, -1
	slt	$t1, $t1, $s4
	bnez	$t1, B6_7
	lw	$a0, 144($sp)
	j	B6_8
B6_7:	lw	$a0, 140($sp)
	jal	print_string
	move	$a0, $s4
	jal	print_integer
	lw	$a0, 136($sp)
B6_8:	jal	print_string
	addiu	$s2, $s2, 4
	li	$t1, 16
	bne	$s2, $t1, B6_5
	j	B6_2
B6_10:	lw	$a0, 120($sp)
	jal	print_string
	lw	$t1, 116($sp)
	addu	$t1, $t1, $s3
	lw	$s4, 0($t1)
	move	$a0, $s4
	jal	print_integer
	lw	$a0, 112($sp)
	jal	print_string
	move	$a0, $s4
	jal	imprimir_y_contar_paises_mas_poblados
	move	$s4, $v0
	lw	$a0, 108($sp)
	jal	print_string
	move	$a0, $s4
	jal	print_integer
	la	$a0, str004
	jal	print_string
	addiu	$s3, $s3, 4
	li	$t1, 12
	bne	$s3, $t1, B6_10
	j	B6_2
B6_12:	lw	$a0, 76($sp)
	li	$a1, 20
	li	$a2, 40
	jal	preguntar_entero
	move	$s4, $v0
	lw	$a0, 72($sp)
	jal	print_string
	move	$a0, $s4
	jal	print_integer
	lw	$a0, 68($sp)
	jal	print_string
	j	B6_2
B6_13:	li	$t1, 46
	sh	$t1, 332($sp)
	lw	$t1, 40($sp)
	sw	$t1, 328($sp)
	lw	$t1, 44($sp)
	sw	$t1, 324($sp)
	lw	$t1, 48($sp)
	sw	$t1, 320($sp)
	lw	$t1, 52($sp)
	sw	$t1, 316($sp)
	lw	$t1, 56($sp)
	sw	$t1, 312($sp)
	lw	$t1, 60($sp)
	sw	$t1, 308($sp)
	lw	$t1, 64($sp)
	sw	$t1, 304($sp)
	lw	$t1, 36($sp)
	sw	$t1, 300($sp)
	lw	$t1, 32($sp)
	sw	$t1, 296($sp)
	lw	$a0, 28($sp)
	jal	print_string
	addiu	$a0, $sp, 296
	jal	print_string
	lw	$a0, 24($sp)
	jal	print_string
	li	$s2, 0
B6_14:	lw	$a0, 132($sp)
	jal	print_string
	lw	$t1, 128($sp)
	addu	$t1, $t1, $s2
	lb	$s4, 0($t1)
	move	$a0, $s4
	jal	print_character
	lw	$a0, 124($sp)
	jal	print_string
	addiu	$s5, $sp, 296
	move	$a0, $s5
	move	$a1, $s4
	jal	cadena_eliminar
	move	$a0, $s5
	jal	print_string
	la	$a0, str017			
	jal	print_string
	addiu	$s2, $s2, 1
	li	$t1, 6
	bne	$s2, $t1, B6_14
	j	B6_2
B6_16:	addiu	$s0, $sp, 160
	sw	$s0, 156($sp)
	move	$a0, $s0
	lw	$a1, 20($sp)
	li	$a2, 136
	jal	memcpy
	li	$s2, 0
	move	$s4, $s0
B6_17:	lw	$a0, 104($sp)
	jal	print_string
	li	$t1, 68
	mul	$s0, $s2, $t1
	lw	$t1, 156($sp)
	addu	$t1, $t1, $s0
	addiu	$s7, $t1, 64
	lw	$s5, 64($t1)
	slti	$t1, $s5, 1
	bnez	$t1, B6_20
	lw	$s5, 0($s7)
	li	$s1, 0
	move	$s3, $s4
B6_19:	lw	$a0, 0($s3)
	jal	print_integer
	move	$a0, $fp
	jal	print_string
	addiu	$s1, $s1, 1
	slt	$t1, $s1, $s5
	addiu	$s3, $s3, 4
	bnez	$t1, B6_19
B6_20:	addiu	$t1, $sp, 160
	addu	$a0, $t1, $s0
	move	$a1, $s5
	jal	invertir_array_int
	lw	$a0, 100($sp)
	jal	print_string
	lw	$t1, 0($s7)
	li	$s0, 0
	slti	$t1, $t1, 1
	move	$s5, $s4
	bnez	$t1, B6_22
B6_21:	lw	$a0, 0($s5)
	jal	print_integer
	la	$a0, str024
	jal	print_string
	addiu	$s0, $s0, 1
	lw	$t1, 0($s7)
	slt	$t1, $s0, $t1
	addiu	$s5, $s5, 4
	bnez	$t1, B6_21
B6_22:	lw	$a0, 96($sp)
	jal	print_string
	addiu	$s2, $s2, 1
	li	$t1, 2
	addiu	$s4, $s4, 68
	beq	$s2, $t1, B6_2
	j	B6_17
	addiu	$sp, $sp, -376
	lw	$s0, 336($sp)
	lw	$s1, 340($sp)
	lw	$s2, 344($sp)
	lw	$s3, 348($sp)
	lw	$s4, 352($sp)
	lw	$s5, 356($sp)
	lw	$s6, 360($sp)
	lw	$s7, 364($sp)
	lw	$fp, 368($sp)
        lw	$ra, 372($sp)
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

clear_screen:
	li	$v0, 39
	syscall	
	jr	$ra

mips_exit:
	li	$v0, 17
	syscall	
	jr	$ra

memcpy:
	move	$v0, $a0
memcpy_loop:
	beqz	$a2, memcpy_return
	lbu	$t0, 0($a1)
	sb	$t0, 0($a0)
	addiu	$a0, $a0, 1
	addiu	$a1, $a1, 1
	addiu	$a2, $a2, -1
	j	memcpy_loop
memcpy_return:
	jr	$ra
