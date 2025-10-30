.data
    vetor: .word 4, 3, 9, 5, 2, 1
    tamanho: .word 6
    espaco: .asciiz " "
    nova_linha: .asciiz "\n"
    msg_original: .asciiz "Vetor original: "
    msg_ordenado: .asciiz "Vetor ordenado: "

.text
main:

    la $a0, msg_original
    li $v0, 4
    syscall
    
    jal imprimir_vetor
    
    # la $s2, vetor          
    # lw $s3, tamanho       
    # li $t6, 0 
    
    
    jal bubble_sort
        
    # la $s0, vetor          
    # lw $s1, tamanho           
    # li $t0, 0     
    
    la $a0, msg_ordenado
    li $v0, 4
    syscall
    
    jal imprimir_vetor
    
    # Termina programa
    li $v0, 10
    syscall

# FUNÇÃO: Bubble Sort
bubble_sort:
    la $s0, vetor          
    lw $s1, tamanho           
    li $t0, 0              
    
loop_externo:

    sub $t9, $s1, 1       
    bge $t0, $t9, fim_sort    
    li $t1, 0              
    
    sub $t2, $s1, $t0      
    subi $t2, $t2, 1       
    
loop_interno:
    bge $t1, $t2, fim_interno      
    
    sll $t3, $t1, 2        
    add $t3, $s0, $t3     
    
    lw $t4, 0($t3)        
    lw $t5, 4($t3)         
    
    
    ble $t4, $t5, nao_troca     
   
    sw $t5, 0($t3)         
    sw $t4, 4($t3)        
    
nao_troca:
    addi $t1, $t1, 1      
    j loop_interno

fim_interno:
    addi $t0, $t0, 1      
    j loop_externo

fim_sort: 
    jr $ra                 

# FUNÇÃO: Imprimir Vetor
imprimir_vetor:
    la $s2, vetor          
    lw $s3, tamanho       
    li $t6, 0              
    
loop_imprimir:
    bge $t6, $s3, fim_imprimir    
    
    sll $t7, $t6, 2        
    add $t7, $s2, $t7      
    lw $a0, 0($t7)         
    
    li $v0, 1
    syscall
    
    la $a0, espaco
    li $v0, 4
    syscall
    
    addi $t6, $t6, 1
    j loop_imprimir

fim_imprimir:
    # Imprime nova linha
    la $a0, nova_linha
    li $v0, 4
    syscall
    
    jr $ra
