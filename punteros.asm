#punteros 
struct pnto { 
 int x ;
 int y;
 }; 
 
 struct punto puntos[100]; 
 
 //Desplaza el punto dado como parámetro una unidad tanto en coordenadas x como en y 
 
 void proc (struct Punto * p){ 
  p->x = p->x + 1; 
  p->y = p->y + 1; 
 } 
 
	.data 
	.align 2
puntos: 
	.space 800		#100 elemtnros de 8 bytes cada uno
	 
	.text 
proc: 				# p: $a0 y es un puntero 
	lw	$t0, 0($a0)	# leyendo p->x 
	add	$t0, $t0, 1	# p->x + 1
	sw	$t0, 0($a0) 	# p->x = p->x + 1
	
	lw	$t1, 4($a0) 	# leyendo p->y  	
	add	$t1, $t1, 1 	# p->y + 1
	sw	$t1, 0($a0) 	# p->y = p->y + 1
	
#otro ejemplo 

int A[10]={3,7,2,1,9,6,4,5,0,8}; 
//devuelve las suma de todos 
int proc(void){ 
 int r=0; 
 for(int * p = &A[0]; p< &A[10]; ++p){ 
  r = r + *p; 
 } 
 return r; 
 } 
 
	.data 
A:	.word 3,7,2,1,9,6,4,5,0,8
	.text 
proc: 
	li	$v0, 0		# r=0
	la	$t0, A		# *p = &A[0]
for: 
	addiu	$t1, $t0, 40	#para calcular &A[10] ya que es 10 * el numero que ocupa como son enteros 4
	bge	$t0, $t1, finfor
	lw	$t2, 0($t0)	#leer el valor que tengo en *p 
	add	$v0, $v0, $t2
	addiu	$t0, $t0, 4	#esto es p++, como p va de 4 bytes en 4 bytes pues se suma 4 y no uno como es normal 
fonfor: 
	jr	$ra
	
 


	
	