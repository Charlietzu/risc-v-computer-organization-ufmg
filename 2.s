# x10 - n
# x11 - d
# Variavel de retorno = x10
Primo:
    addi x29, x0, 1
    addi x10, x0, 2 #Atribuir valor da varíavel n aqui
    bge x29, x10, RetornaFalso
    addi x11, x0, 2 
    jal Loop

Loop:
    bge x11, x10, RetornaVerdadeiro
    rem x28, x10, x11
    beq x28, x0, RetornaFalso
    addi x11, x11, 1
    jal Loop

RetornaFalso:
    addi x10, x0, 0
    jal Fim

RetornaVerdadeiro:
    addi x10, x0, 1
    jal Fim

Fim: