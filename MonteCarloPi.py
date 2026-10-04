import random

generador = random.Random(31)
total = 10000
dentro = 0

for _ in range(total):
    x = generador.random()
    y = generador.random()

    if x**2 + y**2 <= 1:
        dentro += 1

pi_aproximado = 4 * dentro / total

print("Total de puntos:", total)
print("Puntos dentro del cuarto de círculo:", dentro)
print("Valor aproximado de pi:", pi_aproximado)
