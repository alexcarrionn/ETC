#int A[10]= {3,7,2,1,9,6,4,5,0,8}; 
#int B[10] 

void proc(int i, int j){ 
	int tmp = A[i]; 
	A[i]= B[j]; 
	B[j]= tmp; 
} 

.data 
A: 	.word 3,7,2,1,9,6,4,5,0,8	#si lo pones en varias lineas también vale
	.align 2			#dejamos para que el space este en multiplo de 4
B:	.space 40			#dejamos un espacio para los 10 valores de B

.text 
proc:	# i = $a0;  j = $a1
	la 	$t0, A			#mete en $t0, la direccion de memoria del primer valor de A
	mul	$t1, $a0, 4		# i * 4		el 4 es pq es un array de enteros 
	add	$t2, $t0, $t1		# A + i * 4 
	lw	$t3, 0($t2)		#leer el valir A[i] en tmp
	
	la 	$t4, B			#mete en $t0, la direccion de memoria del primer valor de B
	mul	$t5, $a1, 4		# j * 4		el 4 es pq es un array de enteros 
	add	$t6, $t4, $t5		# B + j * 4 
	lw	$t7, 0($t6)		#leer el valir B[j]
	
	sw	$t7, 0($t2) 		#A[i]= B[j]
	
	sw	$t3, 0($t6)		#B[j]= tmp
	
	jr	$ra 
	
#tambien se puede hacer de esta forma pero la anterior es la que tenemos que entender 
proc:	# i = $a0;  j = $a1
	sll	$t1, $a0, 2		# i * 4	
	lw	$t3, A($t1)		#A[i]
	
	sll	$t5, $a1, 2		# j * 4	
	lw	$t7, A($t5)		#B[j]
	
	sw	$t7, A($t2) 		#A[i]= B[j]
	
	sw	$t3, B($t6)		#B[j]= tmp
	
	jr	$ra 
	
	
	