char str1[]= esto es una cadena; 
char str2[100]; 

void proc(void){ 
 int i; 
  for (int i =0; stri[i] != '\0'; i++){
     char c = str1[i]; 
        if ( c>='a' && c<= 'z'){
 	 c = c ('a'-'A'); 
 	}
      str2[i]=c; 
     }
   str2[i]= '\0'; 
  } 
 

	.data
str1: 	.asciiz "esto es una cadena"
#tambien se pude definir asi 
str1: 	.byte 'E', 's', 't', ...., 0 

str2:	.space 100
	.text 
proc:	
	li	$t0, 0		#i
for: 
	la	$t1, str1
	mul	$t2, $t0, 1	#i*1
	add	$t3, $t1, $t2
	lb	$t4, 0($t3) 	# c = str1[i]
	#hay varias formas de hacer el fin for 
	beq	$t4, '\0', finfor
	beq	$t4, 0, finfor
	beq	$t4, $0, finfor
	beqz	$t4, finfor 
	#seguimos
	#el $t4 es la c que nosotros queremos 
	blt	$t4, 'a', finif
	bgt	$t4,'z', finif
	addi	$t4, $t4, -32	#c = c ('a'-'A')
finif: 	
	#las mismas instrucciones de antes para calcular el str2 [i]
	la	$t5, str2
	mul	$t6, $t0, 1
	add	$t7, $t5, $t6
	sb	$t5, 0($t7)
	addiu	$t0, $t0, 1
	j 	for 
finfor: 
	la	$t5, str2
	mul	$t6, $t0, 1
	add	$t7, $t5, $t6
	sb	$zero, 0($t7)	# str2[i]= '\0'
	jr	$ra 
	
	.globl main
main: 
	jal 	proc 
	
	la	$a0, str2
	li	$v0, 4
	syscall 
	
	
	
	