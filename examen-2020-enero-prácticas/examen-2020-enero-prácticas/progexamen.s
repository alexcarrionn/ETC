
	.data	
	.align	2
jump_table000:
	.word	B7_4
	.word	B7_12
	.word	B7_13
	.word	B7_16
	.word	B7_5
	.word	B7_10
str000:
	.asciiz		"El entero no es válido.\n"
str001:
	.asciiz		"Rectángulo demasiado pequeño"
	.align	2
vectores:
	.word	1
	.word	2
	.word	3
	.word	3
	.word	2
	.word	1
	.word	4294967096
	.word	101
	.word	0
	.word	2000
	.word	1111
	.word	0
	.word	100
	.word	101
	.word	0
	.word	4294967226
	.word	71
	.word	0
	.word	2
	.word	1111
	.word	0
	.word	21
	.word	33
	.word	0
	.word	8
	.word	9
	.word	0
	.word	13
	.word	1
	.word	0
str002:
	.asciiz		"\n\nExamen de ETC de ensamblador\n\n 1. Lectura de un entero\n 2. Contar apariciones de una letra en un texto\n 3. Dibujar un rectángulo\n 4. Sumar array de vectores\n 5. Concatenar cadenas\n 0. Salir\n\nElige una opción: "
str003:
	.asciiz		"\n\n"
str004:
	.asciiz		"Introduce un entero entre 15 y 25: "
str005:
	.asciiz		"El entero leído ha sido: "
str006:
	.asciiz		".\n"
main.texto:
	.asciiz		"En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que..."
str007:
	.asciiz		"En el texto: «"
str008:
	.asciiz		"»\n"
main.letras:
	.ascii 		"elmM"
str009:
	.asciiz		"   la letra «"
str010:
	.asciiz		"» aparece "
str011:
	.asciiz		" veces.\n"
str012:
	.asciiz		"Introduzca el ancho deseado para el rectángulo: "
str013:
	.asciiz		"Introduzca el alto deseado para el rectángulo: "
str014:
	.asciiz		"Introduzca el carácter de relleno para el rectángulo: "
str015:
	.asciiz		"   "
str016:
	.asciiz		"\n + "
str017:
	.asciiz		"\n = "
str018:
	.asciiz		"aaaaa"
str019:
	.asciiz		"bbbbb"
str020:
	.asciiz		"anti"
str021:
	.asciiz		"congelante"
str022:
	.asciiz		"Estructura y "
str023:
	.asciiz		"Tecnología de Computadores"
str024:
	.asciiz		"E"
str025:
	.asciiz		"TC"
	.align	2
main.tests:
	.word	str018
	.word	str019
	.word	str020
	.word	str021
	.word	str022
	.word	str023
	.word	str024
	.word	str025
str026:
	.asciiz		"La concatenación de «"
str027:
	.asciiz		"» y «"
str028:
	.asciiz		"» es «"
str029:
	.asciiz		"».\n"
str030:
	.asciiz		"¡Adiós!\n"
str031:
	.asciiz		"Opción incorrecta. Pulse cualquier tecla para seguir.\n"

	.text	

preguntar_entero:
        # POR HACER
        break

convierte_a_minuscula:
	addiu	$t1, $a0, -65
	andi	$t1, $t1, 255
	li	$v0, 25
	sltu	$t1, $v0, $t1
	bnez	$t1, B1_2
	andi	$t1, $a0, 255
	addiu	$a0, $t1, 32
B1_2:	sll	$t1, $a0, 24
	sra	$v0, $t1, 24
	jr	$ra

contar_apariciones:
       #no del segundo parcial 

imprimir_rectangulo:
        # POR HACER
        break

sumar_vectores:
       move	$t0, $a0 
       move	$t1, $a1
       move	$t2, $a2
       lw	$t3, 0($t0) 
       lw	$t4, 4($t0)
       lw	$t5, 8($t0)
       li	$t3, 0		#resultado->x
       li	$t4, 0		#resultado->y
       li	$t5, 0		#resultado->z
       li	$t6, 0		#i 
    
sv_for1: 
	bge	$t6, $t2, sv_finfor
        mul	$t7, $t6, 12
        add	$t7, $t7, $t1
        lw	$t8, 0($t7) 
        add	$t3, $t3, $t8
        lw	$t8, 4($t7) 
        add	$t4, $t4, $t8
        lw	$t8, 8($t7) 
        add	$t5, $t5, $t8
        addiu 	$t6, $t6, 1
        j	sv_for1
sv_finfor: 
	jr	$ra
 print_vector:
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$s0, 16($sp)
	move	$s0, $a0
	li	$a0, 40
	jal	print_character
	lw	$a0, 0($s0)
	jal	print_integer
	li	$a0, 44
	jal	print_character
	lw	$a0, 4($s0)
	jal	print_integer
	li	$a0, 44
	jal	print_character
	lw	$a0, 8($s0)
	jal	print_integer
	li	$a0, 41
	jal	print_character
	lw	$s0, 16($sp)
	lw	$ra, 20($sp)
	addiu	$sp, $sp, 24
	jr	$ra

concatenar_cadenas:
        # POR HACER
        break

	.globl	main
main:
	addiu	$sp, $sp, -448
	sw	$ra, 444($sp)
	sw	$fp, 440($sp)
	sw	$s7, 436($sp)
	sw	$s6, 432($sp)
	sw	$s5, 428($sp)
	sw	$s4, 424($sp)
	sw	$s3, 420($sp)
	sw	$s2, 416($sp)
	sw	$s1, 412($sp)
	sw	$s0, 408($sp)
	jal	clear_screen
	la	$t1, str002
	sw	$t1, 68($sp)
	la	$t1, str003
	sw	$t1, 64($sp)
	la	$t1, str031
	sw	$t1, 60($sp)
	la	$t1, str030
	sw	$t1, 56($sp)
	la	$t1, str004
	sw	$t1, 52($sp)
	la	$t1, str005
	sw	$t1, 48($sp)
	la	$t1, str006
	sw	$t1, 44($sp)
	la	$t1, main.texto
	sw	$t1, 40($sp)
	addiu	$fp, $sp, 320
	la	$t1, str007
	sw	$t1, 36($sp)
	la	$t1, str008
	sw	$t1, 32($sp)
	la	$t1, str009
	sw	$t1, 100($sp)
	la	$t1, main.letras
	sw	$t1, 96($sp)
	la	$t1, str010
	sw	$t1, 92($sp)
	la	$t1, str011
	sw	$t1, 88($sp)
	la	$t1, str012
	sw	$t1, 28($sp)
	la	$t1, str013
	sw	$t1, 24($sp)
	la	$t1, str014
	sw	$t1, 20($sp)
	la	$t1, str015
	sw	$t1, 84($sp)
	la	$t1, vectores
	sw	$t1, 80($sp)
	la	$t1, str017
	sw	$t1, 16($sp)
	la	$t1, str016
	sw	$t1, 76($sp)
	la	$s6, str026
	la	$t1, main.tests
	sw	$t1, 72($sp)
	la	$s7, str027
	la	$s1, str028
	la	$s2, str029
	j	B7_2
B7_1:	lw	$a0, 60($sp)
	jal	print_string
	jal	read_character
B7_2:	lw	$a0, 68($sp)
	jal	print_string
	jal	read_character
	move	$s0, $v0
	lw	$a0, 64($sp)
	jal	print_string
	sll	$t1, $s0, 24
	sra	$t1, $t1, 24
	addiu	$v0, $t1, -48
	li	$t1, 5
	sltu	$t1, $t1, $v0
	bnez	$t1, B7_1
	sll	$t1, $v0, 2
	lw	$t1, jump_table000($t1)
	li	$s0, 0
	li	$s5, 0
	jr	$t1
B7_4:	lw	$a0, 56($sp)
	jal	print_string
	li	$a0, 0
	jal	mips_exit
	j	B7_2
B7_5:	bnez	$s0, B7_7
	lw	$a0, 84($sp)
	j	B7_8
B7_7:	lw	$a0, 76($sp)
B7_8:	jal	print_string
	lw	$t1, 80($sp)
	addu	$a0, $t1, $s0
	jal	print_vector
	addiu	$s0, $s0, 12
	li	$t1, 120
	bne	$s0, $t1, B7_5
	lw	$a0, 16($sp)
	jal	print_string
	la	$a1, vectores
	addiu	$s0, $sp, 304
	move	$a0, $s0
	li	$a2, 10
	jal	sumar_vectores
	move	$a0, $s0
	jal	print_vector
	j	B7_2
B7_10:	move	$a0, $s6
	jal	print_string
	lw	$t1, 72($sp)
	addu	$s0, $t1, $s5
	lw	$s3, 0($s0)
	move	$a0, $s3
	jal	print_string
	move	$a0, $s7
	jal	print_string
	lw	$s4, 4($s0)
	move	$a0, $s4
	jal	print_string
	move	$a0, $s1
	jal	print_string
	addiu	$s0, $sp, 104
	move	$a0, $s0
	move	$a1, $s3
	move	$a2, $s4
	jal	concatenar_cadenas
	move	$a0, $s0
	jal	print_string
	move	$a0, $s2
	jal	print_string
	addiu	$s5, $s5, 8
	li	$t1, 32
	bne	$s5, $t1, B7_10
	j	B7_2
B7_12:	lw	$a0, 52($sp)
	li	$a1, 15
	li	$a2, 25
	jal	preguntar_entero
	move	$s0, $v0
	lw	$a0, 48($sp)
	jal	print_string
	move	$a0, $s0
	jal	print_integer
	lw	$a0, 44($sp)
	jal	print_string
	j	B7_2
B7_13:	move	$a0, $fp
	lw	$a1, 40($sp)
	li	$a2, 88
	jal	memcpy
	lw	$a0, 36($sp)
	jal	print_string
	move	$a0, $fp
	jal	print_string
	lw	$a0, 32($sp)
	jal	print_string
	li	$s0, 0
B7_14:	lw	$a0, 100($sp)
	jal	print_string
	lw	$t1, 96($sp)
	addu	$t1, $t1, $s0
	lb	$s3, 0($t1)
	move	$a0, $s3
	jal	print_character
	lw	$a0, 92($sp)
	jal	print_string
	move	$a0, $fp
	move	$a1, $s3
	jal	contar_apariciones
	move	$a0, $v0
	jal	print_integer
	lw	$a0, 88($sp)
	jal	print_string
	addiu	$s0, $s0, 1
	li	$t1, 4
	bne	$s0, $t1, B7_14
	j	B7_2
B7_16:	lw	$a0, 28($sp)
	jal	print_string
	jal	read_integer
	move	$s3, $v0
	lw	$a0, 24($sp)
	jal	print_string
	jal	read_integer
	move	$s4, $v0
	lw	$a0, 20($sp)
	jal	print_string
	jal	read_character
	move	$s0, $v0
	li	$a0, 10
	jal	print_character
	sll	$t1, $s0, 24
	sra	$a2, $t1, 24
	move	$a0, $s3
	move	$a1, $s4
	jal	imprimir_rectangulo
	j	B7_2
	addiu	$sp, $sp, -448
	lw	$ra, 444($sp)
	lw	$fp, 440($sp)
	lw	$s7, 436($sp)
	lw	$s6, 432($sp)
	lw	$s5, 428($sp)
	lw	$s4, 424($sp)
	lw	$s3, 420($sp)
	lw	$s2, 416($sp)
	lw	$s1, 412($sp)
	lw	$s0, 408($sp)
        jr      $ra

print_integer:
	li	$v0, 1
	syscall	
	jr	$ra

read_integer:
	li	$v0, 5
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
