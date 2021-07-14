# i - x28
# key - x12
# j - x29

.data
arr: .word 27 16 20 49 39 48 38 7 5 19
tamanhoArr: .word 10

.text
main:



InsertionSort:
addi x28, x0, 1 # x28 = i
jal x1, Loop1

Loop1:
slli x30, x28, 2 # x30 = 8
add x31, x10, x30 # posicao da memoria onde quero chegar
lw x5, 0(x31) # x5 = arr[i]
addi x12, x5, 0 # key = arr[i]
addi x29, x28, -1 # j = i − 1
