# x10 - Tensao Eletrica (V)
# x11 - Resistencia Eletrica (R)
# x12 - Corrente Eletrica (I)

#Atribuir as variáveis para teste aqui no label teste
Main:
    addi x10, x0, 0 # V
    addi x11, x0, 10 # R
    addi x12, x0, 5 # I
    jal x1, Ohm
    jal x0, Fim

Ohm:
    beq x10, x0, CalculaTensao
    beq x11, x0, CalculaResistencia
    beq x12, x0, CalculaCorrente

CalculaTensao:      # Calcular V = R * I
    beq x11, x0, RetornaZero
    beq x12, x0, RetornaZero
    mul x10, x11, x12
    jalr x0, 0(x1)

CalculaResistencia: # Calcular R = V / I
    beq x10, x0, RetornaZero
    beq x12, x0, RetornaZero
    div x11, x10, x12
    addi x10, x11, 0
    jalr x0, 0(x1)

CalculaCorrente:    # Calcular I = V / R
    beq x10, x0, RetornaZero
    beq x11, x0, RetornaZero
    div x12, x10, x11
    addi x10, x12, 0
    jalr x0, 0(x1)

RetornaZero:
    addi x10, x0, 0
    jalr x0, 0(x1)

Fim: