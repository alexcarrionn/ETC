int A[10]= {3,7,2,1,9,6,4,5,0,8}; 

int proc(void){ 
	int r=0; 
	for(int i =0; i<10; ++i){
	r=r+A[i]; 
	}
return r; 
} 
.data 
A: 	.word 3,7,2,1,9,6,4,5,0,8	#si lo pones en varias lineas también vale
.text 
proc: 
	li	$v0, 0		#int r=0 podemos ponerlo en v0 ya que no lo cambiamos y es lo que devolvemos 
	li 	$t0, 0
	
for: 	
	bge	$t0, 10, finfor
	la	$t1, A
	mul	$t2, $t0, 4	#i*4
	add	$t3, $t1, $t2
	lw	$t4, 0($t3)	#A[i]
	add	$v0, $v0, $t4	#r=r+A[i]
	addiu	$t0, $t0, 1	#i++
	j 	for

finfor: 
	jr	$ra