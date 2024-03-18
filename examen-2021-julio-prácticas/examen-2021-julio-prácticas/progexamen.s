
	.data	
	.align	2
jump_table000:
	.word	B8_1
	.word	B8_4
	.word	B8_6
	.word	B8_12
	.align	2
ciudades:
	.asciiz		"Tokyo\0\0\0\0\0\0\0\0\0"
	.asciiz		"Japan\0\0\0\0\0\0\0\0\0"
	.space	2
	.word	37400068
	.word	4294967291
	.asciiz		"Delhi\0\0\0\0\0\0\0\0\0"
	.asciiz		"India\0\0\0\0\0\0\0\0\0"
	.space	2
	.word	28514000
	.word	9
	.asciiz		"Shanghai\0\0\0\0\0\0"
	.asciiz		"China\0\0\0\0\0\0\0\0\0"
	.space	2
	.word	25582000
	.word	7
	.asciiz		"Sao Paulo\0\0\0\0\0"
	.asciiz		"Brazil\0\0\0\0\0\0\0\0"
	.space	2
	.word	21650000
	.word	3
	.asciiz		"Mexico City\0\0\0"
	.asciiz		"Mexico\0\0\0\0\0\0\0\0"
	.space	2
	.word	21581000
	.word	4
	.asciiz		"Cairo\0\0\0\0\0\0\0\0\0"
	.asciiz		"Egypt\0\0\0\0\0\0\0\0\0"
	.space	2
	.word	20076000
	.word	4294967294
	.asciiz		"Mumbai\0\0\0\0\0\0\0\0"
	.asciiz		"India\0\0\0\0\0\0\0\0\0"
	.space	2
	.word	19980000
	.word	8
	.asciiz		"Beijing\0\0\0\0\0\0\0"
	.asciiz		"China\0\0\0\0\0\0\0\0\0"
	.space	2
	.word	19618000
	.word	3
	.asciiz		"Dhaka\0\0\0\0\0\0\0\0\0"
	.asciiz		"Bangladesh\0\0\0\0"
	.space	2
	.word	19578000
	.word	8
	.asciiz		"Osaka\0\0\0\0\0\0\0\0\0"
	.asciiz		"Japan\0\0\0\0\0\0\0\0\0"
	.space	2
	.word	19281000
	.word	4294967295
	.asciiz		"New York City\0"
	.asciiz		"United States "
	.space	2
	.word	18819000
	.word	2
	.asciiz		"Karachi\0\0\0\0\0\0\0"
	.asciiz		"Pakistan\0\0\0\0\0\0"
	.space	2
	.word	15400000
	.word	8
	.asciiz		"Buenos Aires\0\0"
	.asciiz		"Argentina\0\0\0\0\0"
	.space	2
	.word	14967000
	.word	4294967295
	.asciiz		"Chongqing\0\0\0\0\0"
	.asciiz		"China\0\0\0\0\0\0\0\0\0"
	.space	2
	.word	14838000
	.word	4
	.asciiz		"Istanbul\0\0\0\0\0\0"
	.asciiz		"Turkey\0\0\0\0\0\0\0\0"
	.space	2
	.word	14751000
	.word	4
	.asciiz		"Kolkata\0\0\0\0\0\0\0"
	.asciiz		"India\0\0\0\0\0\0\0\0\0"
	.space	2
	.word	14681000
	.word	7
	.space	3360
	.align	2
num_ciudades:
	.word	16
str000:
	.asciiz		"\n\nExamen de ETC de ensamblador\n\n 1. Ordenar ciudades alfabéticamente\n 2. Seleccionar ciudades por país\n 3. Actualizar población de las ciudades\n 0. Salir\n\nElige una opción: "
str001:
	.asciiz		"\n\n"
str002:
	.asciiz		"Listado de ciudades:\n"
str003:
	.asciiz		"\nListado de ciudades ordenado alfabéticamente:\n"
str004:
	.asciiz		"Japan"
str005:
	.asciiz		"China"
str006:
	.asciiz		"India"
str007:
	.asciiz		"Bangladesh"
str008:
	.asciiz		"Egypt"
str009:
	.asciiz		"Spain"
	.align	2
__const.main.paises:
	.word	str004
	.word	str005
	.word	str006
	.word	str007
	.word	str008
	.word	str009
str010:
	.asciiz		"Ciudades de "
str011:
	.asciiz		": "
str012:
	.asciiz		"\nListado de ciudades 5 años después:\n"
str013:
	.asciiz		"\nVariación total de población: "
str014:
	.asciiz		"¡Adiós!\n"
str015:
	.asciiz		"Opción incorrecta. Pulse cualquier tecla para seguir.\n"

	.text	

strlen:
	li	$v0, 0
B0_1:	addu	$t5, $a0, $v0
	lbu	$t5, 0($t5)
	addiu	$v0, $v0, 1
	bnez	$t5, B0_1
	addiu	$v0, $v0, -1
	jr	$ra

strcmp:
	lbu	$v0, 0($a1)
	lbu	$v1, 0($a0)
	beqz	$v1, B1_5
	andi	$t5, $v0, 255
	bne	$v1, $t5, B1_5
	addiu	$a0, $a0, 1
	addiu	$a1, $a1, 1
B1_3:	lbu	$v0, 0($a1)
	lbu	$v1, 0($a0)
	beqz	$v1, B1_5
	addiu	$a0, $a0, 1
	andi	$t5, $v0, 255
	addiu	$a1, $a1, 1
	beq	$v1, $t5, B1_3
B1_5:	sll	$t5, $v0, 24
	sra	$t5, $t5, 24
	sll	$v0, $v1, 24
	sra	$v0, $v0, 24
	subu	$v0, $v0, $t5
	jr	$ra

listar_ciudades:
	addiu	$sp, $sp, -48
	sw	$ra, 44($sp)
	sw	$s5, 40($sp)
	sw	$s4, 36($sp)
	sw	$s3, 32($sp)
	sw	$s2, 28($sp)
	sw	$s1, 24($sp)
	sw	$s0, 20($sp)
	lw	$t5, num_ciudades
	blez	$t5, B2_10
	li	$s2, 0
	la	$s4, ciudades
	j	B2_3
B2_2:	lw	$a0, 32($s5)
	jal	print_integer
	li	$a0, 9
	jal	print_character
	lw	$a0, 36($s5)
	jal	print_integer
	li	$a0, 10
	jal	print_character
	addiu	$s2, $s2, 1
	lw	$t5, num_ciudades
	slt	$t5, $s2, $t5
	beqz	$t5, B2_10
B2_3:	sll	$t5, $s2, 3
	sll	$v0, $s2, 5
	addu	$s5, $v0, $t5
	addu	$s0, $s4, $s5
	move	$a0, $s0
	jal	print_string
	move	$a0, $s0
	jal	strlen
	slti	$t5, $v0, 17
	beqz	$t5, B2_6
	addiu	$s0, $v0, -17
B2_5:	li	$a0, 32
	jal	print_character
	addiu	$t5, $s0, 1
	sltu	$v0, $t5, $s0
	move	$s0, $t5
	beqz	$v0, B2_5
B2_6:	la	$t5, ciudades
	addu	$s5, $t5, $s5
	addiu	$s0, $s5, 15
	move	$a0, $s0
	jal	print_string
	move	$a0, $s0
	jal	strlen
	slti	$t5, $v0, 17
	beqz	$t5, B2_2
	addiu	$s0, $v0, -17
B2_8:	li	$a0, 32
	jal	print_character
	addiu	$t5, $s0, 1
	sltu	$v0, $t5, $s0
	move	$s0, $t5
	beqz	$v0, B2_8
	j	B2_2
B2_10:	lw	$s0, 20($sp)
	lw	$s1, 24($sp)
	lw	$s2, 28($sp)
	lw	$s3, 32($sp)
	lw	$s4, 36($sp)
	lw	$s5, 40($sp)
	lw	$ra, 44($sp)
	addiu	$sp, $sp, 48
	jr	$ra

intercambiar_ciudades:
	addiu	$sp, $sp, -40
	sll	$t5, $a0, 3
	sll	$v0, $a0, 5
	addu	$t5, $v0, $t5
	la	$v0, ciudades
	addu	$t5, $v0, $t5
	lw	$v1, 24($t5)
	lw	$a0, 28($t5)
	lw	$a2, 32($t5)
	lw	$a3, 4($t5)
	lw	$t0, 8($t5)
	lw	$t1, 12($t5)
	lw	$t2, 16($t5)
	lw	$t3, 20($t5)
	lw	$t4, 36($t5)
	sw	$t4, 36($sp)
	sw	$a2, 32($sp)
	sw	$a0, 28($sp)
	sw	$v1, 24($sp)
	sw	$t3, 20($sp)
	sw	$t2, 16($sp)
	sw	$t1, 12($sp)
	sw	$t0, 8($sp)
	sw	$a3, 4($sp)
	lw	$v1, 0($t5)
	sw	$v1, 0($sp)
	sll	$v1, $a1, 3
	sll	$a0, $a1, 5
	addu	$v1, $a0, $v1
	addu	$v0, $v0, $v1
	lw	$v1, 12($v0)
	lw	$a0, 16($v0)
	lw	$a1, 20($v0)
	lw	$a2, 24($v0)
	lw	$a3, 28($v0)
	lw	$t0, 32($v0)
	lw	$t1, 36($v0)
	sw	$t1, 36($t5)
	sw	$t0, 32($t5)
	sw	$a3, 28($t5)
	sw	$a2, 24($t5)
	sw	$a1, 20($t5)
	sw	$a0, 16($t5)
	sw	$v1, 12($t5)
	lw	$v1, 8($v0)
	sw	$v1, 8($t5)
	lw	$v1, 4($v0)
	sw	$v1, 4($t5)
	lw	$v1, 0($v0)
	sw	$v1, 0($t5)
	lw	$t5, 12($sp)
	lw	$v1, 16($sp)
	lw	$a0, 20($sp)
	lw	$a1, 24($sp)
	lw	$a2, 28($sp)
	lw	$a3, 32($sp)
	lw	$t0, 36($sp)
	sw	$t0, 36($v0)
	sw	$a3, 32($v0)
	sw	$a2, 28($v0)
	sw	$a1, 24($v0)
	sw	$a0, 20($v0)
	sw	$v1, 16($v0)
	sw	$t5, 12($v0)
	lw	$t5, 8($sp)
	sw	$t5, 8($v0)
	lw	$t5, 4($sp)
	sw	$t5, 4($v0)
	lw	$t5, 0($sp)
	sw	$t5, 0($v0)
	addiu	$sp, $sp, 40
	jr	$ra

        # Ejercicio 1
ordenar_ciudades_alfabeticamente:
	addiu	$sp, $sp, -20
	sw	$ra, 0($sp)
	sw	$s5, 4($sp)
	sw	$s7, 8($sp)
	sw	$s6, 12($sp)
	sw	$s1, 16($sp)
	
	lw	$s6, num_ciudades	#g
	li	$s7, 0			#finish 
B4_1:	bnez    $s7, B4_7
        mul     $t0, $s6, 10
        div     $s6, $t0, 13
        bge     $s6, 1, B4_2
        li      $s6, 1
        li      $s7, 1 
               
B4_2:   li      $s5, 0			#i 
B4_3:   addu    $s1, $s5, $s6		#i+g
        lw      $t2, num_ciudades
        bge     $s1, $t2, B4_4
        la      $t0, ciudades
        mul     $t3, $s5, 40
        add     $a0, $t0, $t3
        mul     $t4, $s1, 40
        add     $a1, $t0, $t4
        jal     strcmp
        blez    $v0, B4_5
        li      $s7, 0
        move    $a0, $s5
        move    $a1, $s1
        jal     intercambiar_ciudades
B4_5:  
	addiu   $s5, $s5, 1
        j       B4_3
B4_4:  
	j	B4_1
B4_7:	
	
	lw	$ra, 0($sp)
	lw	$s5, 4($sp)
	lw	$s7, 8($sp)
	lw	$s6, 12($sp)
	lw	$s1, 16($sp)
	addiu	$sp, $sp, 20
	jr	$ra

copiar_ciudad:
	sll	$t5, $a0, 3
	sll	$v0, $a0, 5
	addu	$t5, $v0, $t5
	la	$v0, ciudades
	addu	$t5, $v0, $t5
	lw	$v0, 12($t5)
	lw	$v1, 16($t5)
	lw	$a0, 20($t5)
	lw	$a3, 24($t5)
	lw	$t0, 28($t5)
	lw	$t1, 32($t5)
	sll	$t2, $a2, 3
	sll	$a2, $a2, 5
	addu	$a2, $a2, $t2
	addu	$a1, $a1, $a2
	lw	$a2, 36($t5)
	sw	$a2, 36($a1)
	sw	$t1, 32($a1)
	sw	$t0, 28($a1)
	sw	$a3, 24($a1)
	sw	$a0, 20($a1)
	sw	$v1, 16($a1)
	sw	$v0, 12($a1)
	lw	$v0, 8($t5)
	sw	$v0, 8($a1)
	lw	$v0, 4($t5)
	sw	$v0, 4($a1)
	lw	$t5, 0($t5)
	sw	$t5, 0($a1)
	jr	$ra

        # Ejercicio 2
seleccionar_ciudades_por_pais:
	addiu	$sp, $sp, -32
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	sw	$s3, 16($sp)
	sw	$s4, 20($sp)
	sw	$s5, 24($sp) 
	sw	$s6, 28($sp) 
	
	move	$s0,$a0		#pais 
	move	$s1, $a1	#array_destino
	jal	strlen	
	move	$s2, $v0	#longitud_pais
	li	$s3, 0		#num_copiadas
	li	$s4, 0		#i 
sc_for1: 
	lw	$t0, num_ciudades
	bge	$s4, $t0 , sc_finfor1
	li	$s5, 1		#copiar 
	li	$s6, 0		#j
sc_for2:
	bge	$s6, $s2, sc_finfor2
	
	add	$t0, $t1, $s0 
	la	$t2, ciudades
	mul	$t3, $s4, 40
	add	$t2, $t2, $t3	#conseguir ciudades[i]
	beq  	$t0, $t2, sc_else1
	li	$s5,0
sc_finfor2: 
	bnez	$s5,sc_else1
	move	$a0,$s4
	move	$a1, $s1
	move	$a2,$s3
	jal	copiar_ciudad
	addiu	$s3, $s3,1
sc_else1: 
	addiu	$s6, $s6,1
	j 	sc_for2
	
sc_finfor1:
	move	$v0, $s3
	
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	sw	$s3, 16($sp)
	sw	$s4, 20($sp)
	sw	$s5, 24($sp) 
	sw	$s6, 28($sp) 
	addiu	$sp, $sp, 32
	jr	$ra

        # Ejercicio 3
actualiza_poblacion:
        # POR HACER
        break

	.globl	main
main:
	addiu	$sp, $sp, -4088
	sw	$ra, 4084($sp)
	sw	$fp, 4080($sp)
	sw	$s7, 4076($sp)
	sw	$s6, 4072($sp)
	sw	$s5, 4068($sp)
	sw	$s4, 4064($sp)
	sw	$s3, 4060($sp)
	sw	$s2, 4056($sp)
	sw	$s1, 4052($sp)
	sw	$s0, 4048($sp)
	jal	clear_screen
	la	$s0, str000
	la	$s1, str001
	lui	$fp, 53248
	la	$t5, str015
	sw	$t5, 40($sp)
	la	$t5, str014
	sw	$t5, 36($sp)
	la	$t5, str002
	sw	$t5, 32($sp)
	la	$t5, str003
	sw	$t5, 28($sp)
	la	$s6, str010
	la	$s3, __const.main.paises
	la	$s7, str011
	addiu	$s5, $sp, 48
	li	$s2, 6
	la	$t5, str012
	sw	$t5, 24($sp)
	la	$t5, str013
	sw	$t5, 20($sp)
	sw	$s0, 44($sp)
	j	B8_2
B8_1:	lw	$a0, 36($sp)
	jal	print_string
	li	$a0, 0
	jal	mips_exit
B8_2:	move	$a0, $s0
	jal	print_string
	jal	read_character
	move	$s4, $v0
	move	$a0, $s1
	jal	print_string
	sll	$t5, $s4, 24
	addu	$t5, $t5, $fp
	srl	$v0, $t5, 24
	sltiu	$t5, $v0, 4
	beqz	$t5, B8_5
	sll	$t5, $v0, 2
	lw	$t5, jump_table000($t5)
	jr	$t5
B8_4:	lw	$a0, 32($sp)
	jal	print_string
	jal	listar_ciudades
	lw	$a0, 28($sp)
	jal	print_string
	jal	ordenar_ciudades_alfabeticamente
	jal	listar_ciudades
	j	B8_2
B8_5:	lw	$a0, 40($sp)
	jal	print_string
	jal	read_character
	j	B8_2
B8_6:	li	$s0, 0
	j	B8_8
B8_7:	li	$a0, 10
	jal	print_character
	addiu	$s0, $s0, 1
	beq	$s0, $s2, B8_13
B8_8:	move	$a0, $s6
	jal	print_string
	sll	$t5, $s0, 2
	addu	$t5, $s3, $t5
	lw	$s4, 0($t5)
	move	$a0, $s4
	jal	print_string
	move	$a0, $s7
	jal	print_string
	move	$a0, $s4
	move	$a1, $s5
	jal	seleccionar_ciudades_por_pais
	blez	$v0, B8_7
	move	$s4, $v0
	move	$fp, $s5
B8_10:	move	$a0, $fp
	jal	print_string
	li	$a0, 32
	jal	print_character
	addiu	$s4, $s4, -1
	addiu	$fp, $fp, 40
	bnez	$s4, B8_10
	j	B8_7
B8_12:	la	$a0, str002
	jal	print_string
	jal	listar_ciudades
	lw	$a0, 24($sp)
	jal	print_string
	li	$a0, 5
	jal	actualiza_poblacion
	move	$s4, $v0
	jal	listar_ciudades
	lw	$a0, 20($sp)
	jal	print_string
	move	$a0, $s4
	jal	print_integer
	j	B8_2
B8_13:	lw	$s0, 44($sp)
	lui	$fp, 53248
	j	B8_2

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
