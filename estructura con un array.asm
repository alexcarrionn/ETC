#Estructura con array 
struct Vector { 
 int items [100]; 
 int usados; 
 }; 
 
 struct vector v = { 
 .items = {5,7,5,2,3}, 
 .usados= 5 
 }; 
 
 //añade el valor x al vector v
 
 void proc(int x){ 
 v.item[v.usados]=x; 
 v.usados = v.usados +1; 
} 

	.data 
v:	.word	5
	.word	7
	.word	5
	.word	2
	.word	3
	.space	380		#95 elementos que me quedan hasta 100 * 4
	.word	5		#usados 
	.text 
proc: 
	la	$t0, v		#v = v . items 
	lw	$t1,400($t0) 	#para leer v.usados 
	
	mul	$t2, $t1, 4	# multiplicar v.usados * 4 (el 4 es el tamñao) 
	add	$t3, $t0, $t2	# clacular v + .usados * 4
	sw	$a0, 0($t3)	# v.item[v.usados]=x
	add	$t1, $t1, 1	# v.usados +1
	sw	$t1, 400($t0) 
	jr	$ra