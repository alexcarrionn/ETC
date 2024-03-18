 #array con estructura 
 struct StructEjA {
 int a ;
 int bb ;
 char c ;
 char d ;
 };
 
 struct structEjA s[10]; 
 
 void proc(int i) { 
  int x=s[i].a + s[i].b ; 
  if (s[i].c != 'a') { 
  s[i].a = x; 
  s[i].d = 'b'; 
  }
 }

	.data 
	.align 2
s: 	.space 120 		# 10 elementos de 12 bytes 
	.text 
proc: 				# i=$a0
	la	$t0, s
	mul	$t1, $a0, 12 	# i * 12 
	add	$t2, $t0, $t1	# s + i * 12, es decir donde comienxa la estructura 
	lw	$t3,0($t2)	# s[i].a 
	lw	$t4,4($t2)	# s[i].b
	add	$t5, $t3, $t4	# x= s[i].a + s[i].b 
if: 
	lb	$t6, 8($t2)	# ponemos sb ya que es .c es un char y estoy leyendo s[i].c
	beq	$t6, 'a', finif
	sw	$t5, 0($t2) 	# s[i].a = x
	li	$t7, 'b'
	sb	$t7, 9($t2)	#s[i].d = 'b'
finif: 
	jr	$ra
