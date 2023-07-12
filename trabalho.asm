.data
	array1:
	 	.align 2       # Declaro 12 bytes para armazenar 3 inteiros
	 	.space 40
	leitura: .asciiz "Informe o valor do elemento "   # Cria Label
	n: .asciiz "\n"
	valor: .asciiz "Digite o valor a ser buscado no vetor\n"
	positivo: .asciiz "O valor foi encontrado na posição: "
	negativo: .asciiz "Nenhum numero com o valor digitado foi encontrado"
	
.text
	li,$t5, 10 #num iteracoes
	
	li,$t0, 0 #iterador
	li,$t2, 0 #iterador vetor
	
	Loop: 
		#while i < 10
		beq $t5, $t0, Exit # caso i seja igual a 10 termina o loop
		addi $t0, $t0, 1   # aumenta o valor do iterador em 1
		
		#printf digite o valor x
		li $v0,4           # Carrega o servico 
		la $a0,leitura     # Carrega o endereco da label 
		syscall            # Chamada do sistema
		li $v0,1           # Carrega o servico
		move $a0, $t0     # imprime a posicao do numero a ser lido
		syscall            # Chamada do sistema
		li $v0,4           # Carrega o servico 
		la $a0, n 	   # Carrega o endereco da label 
		syscall            # Chamada do sistema
		
		#scanf x
		li $v0,5           # Ler o numero inteiro
		syscall            # Chamada do sistema
		
		#vetor[i] = x
		sw $v0, array1($t2)      # Atribuo o valor lido para o array com offset $t2
		addi $t2, $t2, 4         # Incrementa a posicao do offset em 4 
		
		j Loop
	Exit:
	
	#printf digite o valor y
	li $v0,4           # Carrega o servico 
	la $a0,valor     # Carrega o endereco da label 
	syscall            # Chamada do sistema
	
	#scanf y
	li $v0,5           # Ler o numero inteiro
	syscall            # Chamada do sistema
	move $t3, $v0 #armazena o valor lido no registrador $t3
	
	li,$t0, 0 #iterador
	li,$t2, 0 #iterador vetor
	Loop2: 
		#while i < 10
		beq $t5, $t0, Negativo # caso i seja igual a 10 termina o loop
		addi $t0, $t0, 1   # aumenta o valor do iterador em 1
		lw $v0, array1($t2)      # Carrega o valor do vetor com offset = $t2
		addi $t2, $t2, 4         # Incrementa a posicao do offset em 4 
		#if y == vetor i
		beq $t3, $v0, Positivo
		
	j Loop2
	Positivo:
		li $v0,4           # Carrega o servico 
		la $a0,positivo     # Carrega o endereco da label 
		syscall            # Chamada do sistema
		li $v0,1          # Carrega o servico
		move $a0, $t0      # imprime o valor do iterador no momento que o numero foi encontrado     
		syscall            # Chamada do sistema
		j End
	Negativo:
		li $v0,4           # Carrega o serviço 
		la $a0,negativo     # Carrega o endereco da label 
		syscall            # Chamada do sistema
	
	
	End:
		
