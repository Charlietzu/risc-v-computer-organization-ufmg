
# Seção de declaração da região de memória
.data
arr: .word 27 16 20 49 39 48 38 7 5 19

# Seção de código de instrução
    # x28 = i
    # x12 = key
    # x29 = j
.text
Main:
    addi x11, x0, 10 # Tamanho do array (n) = 10 
    la x10, arr # Lendo endereço do arr
    jal InsertionSort

InsertionSort:
    addi x28, x0, 1 # x28 = i
    jal Loop1

Loop1:
    slli x30, x28, 2    # endereço de arr[i]
    add x31, x10, x30   # posição da memória onde quero chegar
    lw x5, 0(x31)       # x5 = arr[i]
    addi x12, x5, 0     # key = arr[i]
    sub x29, x28, 1     # j = i − 1
    bgt x11, x28, Loop2 # n > i
    jal Fim

Loop2:
    slli x30, x29, 2    # endereco de arr[j]
    add x31, x10, x30   # posição da memória onde quero chegar
	lw x5, 0(x31)       # x5 = arr[j]
    bge x12, x5, CondicaoSaidaLoop2
    blt x29, x0, CondicaoSaidaLoop2
    sw x5, 4(x31)       # arr[j + 1] = arr[j]
    sub x29, x29, 1     # j = j - 1
    jal Loop2

CondicaoSaidaLoop2:
    sw x12, 4(x31)      # arr[j + 1] = key
    jal Loop1


Fim: