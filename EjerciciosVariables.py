import random
import math

# 1. VARIABLE DISCRETA: LANZAMIENTO DE UN DADO
random.seed(150)

print("\n1. VARIABLE DISCRETA: LANZAMIENTO DE UN DADO")

dado = [random.randint(1, 6) for _ in range(12)]

print("Resultados de los 12 lanzamientos:")
print(dado)
print("Promedio:", round(sum(dado) / len(dado), 2))

print("Cantidad de veces que aparece cada cara:")
for cara in range(1, 7):
    print("Cara", cara, ":", dado.count(cara))


# 2. VARIABLE CONTINUA: TIEMPO DE ENTREGA
random.seed(160)

print("\n2. VARIABLE CONTINUA: TIEMPO DE ENTREGA")

entregas = [random.uniform(10, 20) for _ in range(8)]

print("Tiempos de entrega en minutos:")
print([round(tiempo, 2) for tiempo in entregas])

promedio = sum(entregas) / len(entregas)
print("Tiempo promedio:", round(promedio, 2), "minutos")


# 3. TRANSFORMACION INVERSA: TIEMPO DE ESPERA
random.seed(170)

print("\n3. TRANSFORMACION INVERSA: TIEMPO DE ESPERA")

esperas = [
    -5 * math.log(1 - random.random())
    for _ in range(10)
]

print("Tiempos de espera en minutos:")
print([round(tiempo, 2) for tiempo in esperas])

promedio = sum(esperas) / len(esperas)
print("Tiempo promedio:", round(promedio, 2), "minutos")


# 4. CONVOLUCION: APROXIMACION A UNA NORMAL
random.seed(180)

print("\n4. METODO DE CONVOLUCION")

valores = [
    sum(random.random() for _ in range(12)) - 6
    for _ in range(10)
]

print("Valores que aproximan una distribucion normal:")
print([round(valor, 2) for valor in valores])

print("Promedio:", round(sum(valores) / len(valores), 2))


# 5. METODO DE COMPOSICION
random.seed(190)

print("\n5. METODO DE COMPOSICION")
print("Cliente | Tipo | Minutos")

servicios = []

for cliente in range(1, 11):
    if random.random() < 0.6:
        tipo = "Exponencial"
        tiempo = -3 * math.log(1 - random.random())
    else:
        tipo = "Uniforme"
        tiempo = random.uniform(4, 8)

    servicios.append(tiempo)
    print(f"{cliente:2} | {tipo:11} | {tiempo:.2f}")

promedio = sum(servicios) / len(servicios)
print("Tiempo promedio:", round(promedio, 2), "minutos")


# 6. METODO DE ACEPTACION Y RECHAZO
random.seed(200)

print("\n6. METODO DE ACEPTACION Y RECHAZO")

aceptados = []
intentos = 0

while len(aceptados) < 10:
    x = random.random()
    u = random.random()
    intentos += 1

    if u <= 1 - x:
        aceptados.append(x)

print("Valores aceptados:")
print([round(valor, 4) for valor in aceptados])

print("Intentos:", intentos)
print("Rechazados:", intentos - 10)
print("Promedio:", round(sum(aceptados) / len(aceptados), 4))


# 7. PRUEBA DE UNIFORMIDAD CON CHI-CUADRADA
random.seed(210)

print("\n7. PRUEBA DE UNIFORMIDAD")

numeros = [random.random() for _ in range(1000)]
frecuencias = [0] * 5

for numero in numeros:
    indice = int(numero * 5)
    frecuencias[indice] += 1

print("Intervalo | Frecuencia")

for i in range(5):
    inferior = i / 5
    superior = (i + 1) / 5
    print(f"[{inferior:.1f}, {superior:.1f}) | {frecuencias[i]}")

esperada = len(numeros) / 5

chi_cuadrada = sum(
    (frecuencia - esperada) ** 2 / esperada
    for frecuencia in frecuencias
)

# Valor p para chi-cuadrada con 4 grados de libertad.
valor_p = math.exp(-chi_cuadrada / 2) * (1 + chi_cuadrada / 2)

print("Frecuencia esperada por intervalo:", esperada)


print("Chi-cuadrada:", round(chi_cuadrada, 4))
print("Grados de libertad: 4")
print("Valor p:", round(valor_p, 4))

if valor_p > 0.05:
    print("No se rechaza la uniformidad al nivel del 5%.")
else:
    print("Se rechaza la uniformidad al nivel del 5%.")
