#arrays de arrays 

int A[5][10]; 
void proc (int x1, y1, x2, y2){ 
int v = A[x1][y1]; 
A[x2][y2] = v + 1 ; 



	.data 
	.align 2	#para asegurarnos que son multiplos de 4
A:	.space 200  	# 5 elementos de 40 bytes cada uno 5*40


	.text
proc:				# x1=$a0, y2=$a1, x2=$a2, y2=$a3
	la	$t0, A
	mul 	$t1, $a0, 40 	# (A+x1*tamaño)
	add	$t2, $t0, $t1	# para obtener el x1 de A 
	mul	$t3, $a1, 4	# y1*4
	add	$t4, $t2, $t3	# ( A + x1* tamaño ) + y1 * 4
	#todo lo anterior es para la direccion de memoria 
	lw 	$t5, 0($t4)	# v = A[x1][y1]
	
	addiu	$t5, $t5,1 	# v + 1 
	
	mul 	$t1, $a2, 40 	# ( A + x2 * tamaño )
	add	$t2, $t0, $t1	# para obtener el x2 de A 
	mul	$t3, $a3, 4	# y2 * 4
	add	$t4, $t2, $t3	# ( A + x2* tamaño ) + y2 * 4
	sw	$t5, 0($t4)	# A[x2][y2] = v + 1
	
	jr 	$ra
	
	
