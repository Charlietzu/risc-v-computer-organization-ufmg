# x11 = Tamanho do array (n)
# x10 = Endereco da primeira posicao do array
# x5-x7 e x28 Auxiliares para preencher e percorrer o array
# x12 = i
# x13 = j
# x14 = key
# x29 = Auxiliar para receber 1
# x15 = Auxiliar para receber arr[j]

Main:
    li x11, 10 # n = Número de elementos no array  
    li x5, 0
    li x29, 1
    jal x1, PreencheArr

PreencheArr:
	li x28, 27
    jal x1, PercorreArr
    
    li x28, 16
    jal x1, PercorreArr
    
    li x28, 20
    jal x1, PercorreArr
    
    li x28, 49
    jal x1, PercorreArr
    
    li x28, 39
    jal x1, PercorreArr
    
    li x28, 48
    jal x1, PercorreArr

    li x28, 38
    jal x1, PercorreArr
    
    li x28, 7
    jal x1, PercorreArr
    
    li x28, 5
    jal x1, PercorreArr
    
    li x28, 19
    jal x1, PercorreArr
    
    jal InsertionSort

PercorreArr:
    slli x6, x5, 2
    add x7, x10, x6
    sh x28, 0(x7)
    
    addi x5, x5, 1

    jalr x0, 0(x1)
    
InsertionSort:
	li x12, 0 # i = 0
    li x13, 0 # j = 0
    li x14, 0 # key = 0
    
    jal Loop1
    
Loop1:
	addi x12, x12, 1 # i++
	slli x6, x12, 2
    add x7, x10, x6
    lh x14, 0(x7) # key = arr[i]
    sub x13, x12, x29 # j = i - 1
    bgt x11, x12, Loop2 # se (n > i) vai para o loop interno (Loop2)
    jal Fim
    
Loop2:
	slli x6, x13, 2
    add x7, x10, x6
    lh x15, 0(x7) # x15 = arr[j]
    # Após receber arr[j] verificar validade do loop interno (Loop2)
    bge x14, x15, VoltaLoop1 # se (key >= arr[j]) realiza operações abaixo do Loop2, no Loop1
    blt x13, x0, VoltaLoop1 # se (j < 0) realiza operações abaixo do Loop2, no Loop1
    sh x15, 4(x7) # arr[j + 1] = arr[j]
    sub x13, x13, x29 # j--
    jal Loop2
    
VoltaLoop1:
	sh x14, 4(x7) # arr[j + 1] = key
    jal Loop1

Fim: