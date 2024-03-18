
	.data	

buffer_contar_apariciones:
	.space	1024

	.align	2
cuentas:
	.asciiz		"Pepe Fulanito Mengano"
	.space	78
	.word	123453
	.asciiz		"Pepa Fulanito del Monte"
	.space	76
	.word	213441
	.asciiz		"Pepe Segundo"
	.space	87
	.word	1457894
	.asciiz		"Manuel Zutano"
	.space	86
	.word	457814
	.align	2

num_cuentas:
	.word	4
	

str000:
	.asciiz		"\nExamen de ETC de ensamblador\n"
str001:
	.asciiz		"\n\n 1. Lectura de una cadena por teclado\n 2. Comparar cadenas (prefijos)\n 3. Buscar cuantas veces aparece un nombre o teléfono en una agenda\n 4. Contar vocales\n 5. Buscar en tabla de saldos\n 0. Salir\n\nElige una opción: "
str002:
	.asciiz		"\n\n"
str003:
	.asciiz		"Introduce una cadena: "
str004:
	.asciiz		"\nLa cadena leída ha sido: «"
str005:
	.asciiz		"».\n"
str006:
	.asciiz		"aaaaaaaa"
str007:
	.asciiz		"bbbbbbbbb"
str008:
	.asciiz		"abcdef"
str009:
	.asciiz		"abcdeg"
str010:
	.asciiz		"abcd"
str011:
	.asciiz		"Los primeros "
str012:
	.asciiz		" caracteres de las cadenas «"
str013:
	.asciiz		"» y «"
str014:
	.asciiz		"» son iguales.\n"
str015:
	.asciiz		"» son distintos.\n"
str016:
	.asciiz		"Pepe Pérez López: 679876543\nPepa López Pérez: 654783421\nTío Pepe: 679876543\nManuel Gómez Martínez: 666457482\n"
str017:
	.asciiz		"Pepe"
str018:
	.asciiz		"Gómez Martínez"
str019:
	.asciiz		"Sánchez"
str020:
	.asciiz		"679876543"
str021:
	.asciiz		"En la siguiente agenda: \n"
str022:
	.asciiz		"\n"
str023:
	.asciiz		"El nombre o teléfono «"
str024:
	.asciiz		"» aparece "
str025:
	.asciiz		" veces.\n"
str026:
	.asciiz		"En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que vivía un hidalgo de los de lanza en astillero, adarga antigua, rocín flaco y galgo corredor." 
str027:
	.asciiz		"En el siguiente texto: \n«"
str028:
	.asciiz		"»\n\n"
str029:
	.asciiz		"Aparecen "
str030:
	.asciiz		" aes, "
str031:
	.asciiz		" es, "
str032:
	.asciiz		" íes, "
str033:
	.asciiz		" oes, y "
str034:
	.asciiz		" úes minúsculas y sin tilde.\n"
str035:
	.asciiz		"Pepe Fulanito Mengano"
str036:
	.asciiz		"Juana Menganita"
str037:
	.asciiz		"Pepa Fulanito del Monte"
str038:
	.asciiz		"Manuel Zutano"
str039:
	.asciiz		"El saldo de «"
str040:
	.asciiz		"» es de "
str041:
	.asciiz		" pesetas.\n"
str042:
	.asciiz		"¡Adiós!\n"
str043:
	.asciiz		"Opción incorrecta. Pulse cualquier tecla para seguir.\n"

jump_table000:
	.word	B9_4
	.word	B9_9
	.word	B9_5
	.word	B9_10
	.word	B9_13
	.word	B9_7
main.tests1:
	.word	5
	.word	str006
	.word	str007
	.word	5
	.word	str008
	.word	str009
	.word	6
	.word	str008
	.word	str009
	.word	9
	.word	str008
	.word	str008
	.word	9
	.word	str008
	.word	str010
main.tests2:
	.word	str017
	.word	str018
	.word	str019
	.word	str020
main.tests3:
	.word	str035
	.word	str036
	.word	str037
	.word	str038

	.text	

# void preguntar_cadena(char* mensaje, char* buffer, int max)
# Pregunta una cadena de longitud máxima max caracteres y la almacena
# en buffer 
preguntar_cadena:
        # POR HACER
        break

# bool compara_cadena_prefijos(char *s1, char *s2, int num_caracteres) 
# Compara los primeros num_caracteres de dos cadenas (s1 y s2),
# devolviendo true si y solo si sus primeros num_caracteres son
# iguales o si ambas cadenas son iguales y tienen menos de
# num_caracteres 
compara_cadena_prefijos:
        # POR HACER
        break

# int cadena_longitud(char* str)
# Cuenta el número de caracteres de una cadena
cadena_longitud:
	li	$v0, -1
B2_1:	addu	$t5, $a0, $v0
	lbu	$t5, 1($t5)
	addiu	$v0, $v0, 1
	bnez	$t5, B2_1
	jr	$ra

# bool extraer_linea(char *texto, int i, char *buffer)
# Si la cadena texto tiene al menos i líneas, copia la línea iésima
# de texto en buffer (que debe de tener suficiente espacio) y
# devuelve true. Si la cadena tiene menos de i líneas, devuelve
# false 
extraer_linea:
	slti	$t5, $a1, 1			
	li	$v0, 0
	bnez	$t5, B3_7
	li	$a3, 10
	li	$v1, 0
B3_2:	lbu	$t0, 0($a0)
	beqz	$t0, B3_8
	bne	$t0, $a3, B3_5
	addiu	$v1, $v1, 1
B3_5:	slt	$t5, $v1, $a1
	addiu	$a0, $a0, 1
	bnez	$t5, B3_2
	j	B3_8
B3_7:	li	$v1, 0
B3_8:	bne	$v1, $a1, B3_14
	li	$v0, 10
	j	B3_11
B3_10:	sb	$v1, 0($a2)
	addiu	$a2, $a2, 1
	addiu	$a0, $a0, 1
B3_11:	lbu	$v1, 0($a0)
	beqz	$v1, B3_13
	bne	$v1, $v0, B3_10
B3_13:	sb	$zero, 0($a2)
	li	$v0, 1
B3_14:	jr	$ra

# bool aparece_nombre(char *linea, char *nombre) 
# Comprueba si una cadena (nombre) es subcadena de otra (linea) 
aparece_nombre:
	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)
	sw	$s2, 24($sp)
	sw	$s1, 20($sp)
	sw	$s0, 16($sp)
	move	$s0, $a1
	move	$s1, $a0
	move	$a0, $s0
	jal	cadena_longitud
	lbu	$t5, 0($s1)
	move	$s2, $v0
	beqz	$t5, B4_4
B4_1:	move	$a0, $s1
	move	$a1, $s0
	move	$a2, $s2
	jal	compara_cadena_prefijos
	move	$t5, $v0
	li	$v0, 1
	bnez	$t5, B4_5
	addiu	$t5, $s1, 1
	lbu	$v0, 1($s1)
	move	$s1, $t5
	bnez	$v0, B4_1
	li	$v0, 0
	j	B4_5
B4_4:	li	$v0, 0
B4_5:	lw	$s0, 16($sp)
	lw	$s1, 20($sp)
	lw	$s2, 24($sp)
	lw	$ra, 28($sp)
	addiu	$sp, $sp, 32
	jr	$ra

# int contar_apariciones(char *texto, char *nombre)
# Cuenta cuántas líneas de texto tienen a nombre como subcadena
contar_apariciones:
        # POR HACER
        break

# void cadena_eliminar(char *str, char c) 
# Elimina de la cadena str todas las apariciones de c
cadena_eliminar:
	lbu	$t5, 0($a0)
	li	$v0, 0
	beqz	$t5, B6_5
	andi	$v1, $a1, 255
	li	$a1, 0
B6_2:	addu	$a2, $a0, $v0
	addiu	$a1, $a1, -1
B6_3:	addu	$t5, $a2, $a1
	lbu	$a3, 1($t5)
	addiu	$a1, $a1, 1
	beq	$a3, $v1, B6_3
	sb	$a3, 0($a2)
	addu	$t5, $a2, $a1
	lbu	$t5, 1($t5)
	addiu	$v0, $v0, 1
	bnez	$t5, B6_2
B6_5:	addu	$t5, $a0, $v0
	sb	$zero, 0($t5)
	jr	$ra

# void contar_vocales(char *texto, CuentaVocales *resultado)
# Cuenta cuántas veces aparece cada vocal minúscula y sin acento
# (caracteres aeiou) en la cadena texto, y rellena la estructura
# resultado con el resultado 
contar_vocales:
        # POR HACER
        break


# int obtener_saldo(char *titular)
# Devuelve el saldo del cliente titular de acuerdo al array cuentas,
# o 0 si no se encuentra al cliente 
obtener_saldo:
        # POR HACER
        break

	.globl	main
main:
	addiu	$sp, $sp, -216
	sw	$ra, 212($sp)
	sw	$fp, 208($sp)
	sw	$s7, 204($sp)
	sw	$s6, 200($sp)
	sw	$s5, 196($sp)
	sw	$s4, 192($sp)
	sw	$s3, 188($sp)
	sw	$s2, 184($sp)
	sw	$s1, 180($sp)
	sw	$s0, 176($sp)
	jal	clear_screen
	la	$a0, str000
	jal	print_string
	la	$t5, str001
	sw	$t5, 96($sp)
	la	$t5, str002
	sw	$t5, 92($sp)
	la	$t5, str043
	sw	$t5, 88($sp)
	la	$t5, str042
	sw	$t5, 84($sp)
	la	$t5, str003
	sw	$t5, 80($sp)
	addiu	$t5, $sp, 156
	sw	$t5, 76($sp)
	la	$t5, str004
	sw	$t5, 72($sp)
	la	$t5, str005
	sw	$t5, 68($sp)
	la	$t5, str011
	sw	$t5, 132($sp)
	la	$t5, main.tests1
	sw	$t5, 128($sp)
	la	$t5, str012
	sw	$t5, 124($sp)
	la	$t5, str013
	sw	$t5, 120($sp)
	la	$t5, str015
	sw	$t5, 116($sp)
	la	$t5, str014
	sw	$t5, 112($sp)
	la	$t5, str021
	sw	$t5, 64($sp)
	la	$t5, str016
	sw	$t5, 60($sp)
	la	$t5, str022
	sw	$t5, 56($sp)
	la	$t5, str023
	sw	$t5, 108($sp)
	la	$t5, main.tests2
	sw	$t5, 104($sp)
	la	$t5, str024
	sw	$t5, 100($sp)
	la	$s2, str025
	la	$t5, str027
	sw	$t5, 52($sp)
	la	$t5, str026
	sw	$t5, 48($sp)
	la	$t5, str028
	sw	$t5, 44($sp)
	la	$t5, str029
	sw	$t5, 40($sp)
	la	$t5, str030
	sw	$t5, 36($sp)
	la	$t5, str031
	sw	$t5, 32($sp)
	la	$t5, str032
	sw	$t5, 28($sp)
	la	$t5, str033
	sw	$t5, 24($sp)
	la	$t5, str034
	sw	$t5, 20($sp)
	la	$s3, str039
	la	$s6, main.tests3
	la	$s4, str040
	la	$s5, str041
	j	B9_2
B9_1:	lw	$a0, 88($sp)
	jal	print_string
	jal	read_character
B9_2:	lw	$a0, 96($sp)
	jal	print_string
	jal	read_character
	move	$s0, $v0
	lw	$a0, 92($sp)
	jal	print_string
	sll	$t5, $s0, 24
	sra	$t5, $t5, 24
	addiu	$v0, $t5, -48
	li	$t5, 5
	sltu	$t5, $t5, $v0
	bnez	$t5, B9_1
	sll	$t5, $v0, 2
	lw	$t5, jump_table000($t5)
	li	$s7, 0
	li	$s1, 0
	jr	$t5
B9_4:	lw	$a0, 84($sp)
	jal	print_string
	li	$a0, 0
	jal	mips_exit
	j	B9_2
B9_5:	lw	$a0, 132($sp)
	jal	print_string
	lw	$t5, 128($sp)
	addu	$s1, $t5, $s7
	lw	$fp, 0($s1)
	move	$a0, $fp
	jal	print_integer
	lw	$a0, 124($sp)
	jal	print_string
	lw	$s0, 4($s1)
	move	$a0, $s0
	jal	print_string
	lw	$a0, 120($sp)
	jal	print_string
	lw	$s1, 8($s1)
	move	$a0, $s1
	jal	print_string
	move	$a0, $s0
	move	$a1, $s1
	move	$a2, $fp
	jal	compara_cadena_prefijos
	lw	$a0, 116($sp)
	lw	$t5, 112($sp)
	movn	$a0, $t5, $v0
	jal	print_string
	addiu	$s7, $s7, 12
	li	$t5, 60
	bne	$s7, $t5, B9_5
	j	B9_2
B9_7:	move	$a0, $s3
	jal	print_string
	addu	$t5, $s6, $s1
	lw	$s0, 0($t5)
	move	$a0, $s0
	jal	print_string
	move	$a0, $s4
	jal	print_string
	move	$a0, $s0
	jal	obtener_saldo
	move	$a0, $v0
	jal	print_integer
	move	$a0, $s5
	jal	print_string
	addiu	$s1, $s1, 4
	li	$t5, 16
	bne	$s1, $t5, B9_7
	j	B9_2
B9_9:	lw	$a0, 80($sp)
	lw	$s0, 76($sp)
	move	$a1, $s0
	li	$a2, 20
	jal	preguntar_cadena
	move	$a0, $s0
	li	$a1, 10
	jal	cadena_eliminar
	lw	$a0, 72($sp)
	jal	print_string
	move	$a0, $s0
	jal	print_string
	lw	$a0, 68($sp)
	jal	print_string
	j	B9_2
B9_10:	lw	$a0, 64($sp)
	jal	print_string
	lw	$a0, 60($sp)
	jal	print_string
	lw	$a0, 56($sp)
	jal	print_string
	li	$s1, 0
B9_11:	lw	$a0, 108($sp)
	jal	print_string
	lw	$t5, 104($sp)
	addu	$t5, $t5, $s1
	lw	$s0, 0($t5)
	move	$a0, $s0
	jal	print_string
	lw	$a0, 100($sp)
	jal	print_string
	la	$a0, str016
	move	$a1, $s0
	jal	contar_apariciones
	move	$a0, $v0
	jal	print_integer
	move	$a0, $s2
	jal	print_string
	addiu	$s1, $s1, 4
	li	$t5, 16
	bne	$s1, $t5, B9_11
	j	B9_2
B9_13:	lw	$a0, 52($sp)
	jal	print_string
	lw	$s0, 48($sp)
	move	$a0, $s0
	jal	print_string
	lw	$a0, 44($sp)
	jal	print_string
	addiu	$a1, $sp, 136
	sw	$zero, 152($sp)
	sw	$zero, 148($sp)
	sw	$zero, 144($sp)
	sw	$zero, 140($sp)
	sw	$zero, 136($sp)
	move	$a0, $s0
	jal	contar_vocales
	lw	$a0, 40($sp)
	jal	print_string
	lw	$a0, 136($sp)
	jal	print_integer
	lw	$a0, 36($sp)
	jal	print_string
	lw	$a0, 140($sp)
	jal	print_integer
	lw	$a0, 32($sp)
	jal	print_string
	lw	$a0, 144($sp)
	jal	print_integer
	lw	$a0, 28($sp)
	jal	print_string
	lw	$a0, 148($sp)
	jal	print_integer
	lw	$a0, 24($sp)
	jal	print_string
	lw	$a0, 152($sp)
	jal	print_integer
	lw	$a0, 20($sp)
	jal	print_string
	j	B9_2
	lw	$ra, 212($sp)
	lw	$fp, 208($sp)
	lw	$s7, 204($sp)
	lw	$s6, 200($sp)
	lw	$s5, 196($sp)
	lw	$s4, 192($sp)
	lw	$s3, 188($sp)
	lw	$s2, 184($sp)
	lw	$s1, 180($sp)
	lw	$s0, 176($sp)
	addiu	$sp, $sp, 216
        jr      $ra

print_integer:
	li	$v0, 1
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
