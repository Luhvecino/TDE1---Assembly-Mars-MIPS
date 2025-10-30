.data
    resultado: .word 0    # Variável para armazenar o resultado
    msg: .asciiz "1998 + 2025 = "

.text
main:    
    li $t0, 1998          
    li $t1, 2025          
    
    add $t2, $t0, $t1    
    
    li $v0, 4
    la $a0, msg
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 10
    syscall