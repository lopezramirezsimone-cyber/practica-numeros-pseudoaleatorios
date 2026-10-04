import random
import math

generador = random.Random(118)

def exponencial(media):
    return -media * math.log(1 - generador.random())

print("1. VARIABLE DISCRETA: BERNOULLI")
compras = [int(generador.random() < 0.65) for _ in range(12)]
print("Decisiones (1 = compra, 0 = no compra):", compras)
print("Total de compras:", sum(compras))

print("\n2. VARIABLE CONTINUA: UNIFORME")
tiempos = [generador.uniform(2, 8) for _ in range(10)]
print("Tiempos:", [round(t, 2) for t in tiempos])
print("Promedio:", round(sum(tiempos) / 10, 2), "minutos")

print("\n3. TRANSFORMACION INVERSA")
llegadas = [exponencial(4) for _ in range(10)]
print("Tiempos entre llegadas:", [round(t, 2) for t in llegadas])
print("Promedio:", round(sum(llegadas) / 10, 2), "minutos")

print("\n4. CONVOLUCION")
totales = [exponencial(3) + exponencial(3) for _ in range(10)]
print("Tiempos totales:", [round(t, 2) for t in totales])
print("Promedio:", round(sum(totales) / 10, 2), "minutos")

print("\n5. COMPOSICION")
atenciones = []
for _ in range(10):
    rapida = generador.random() < 0.70
    tiempo = generador.uniform(1, 3) if rapida else generador.uniform(5, 9)
    atenciones.append(tiempo)
    print("Rapida" if rapida else "Larga", "-", round(tiempo, 2), "minutos")
print("Promedio:", round(sum(atenciones) / 10, 2), "minutos")

print("\n6. ACEPTACION Y RECHAZO")
aceptados = []
intentos = 0
while len(aceptados) < 10:
    x = generador.random()
    u = generador.random()
    intentos += 1
    if u <= x:
        aceptados.append(x)

print("Valores aceptados:", [round(x, 4) for x in aceptados])
print("Intentos:", intentos)
print("Rechazados:", intentos - len(aceptados))
print("Promedio:", round(sum(aceptados) / 10, 4))

print("\n7. PRUEBA DE UNIFORMIDAD")
frecuencias = [0] * 5
for _ in range(1000):
    intervalo = int(generador.random() * 5)
    frecuencias[intervalo] += 1

chi = sum((f - 200) ** 2 / 200 for f in frecuencias)
print("Frecuencias por intervalo:", frecuencias)
print("Frecuencia esperada:", 200)
print("Chi-cuadrado:", round(chi, 4))
print("Valor critico: 9.4877 (significancia 0.05, 4 grados de libertad)")
if chi > 9.4877:
    print("Se rechaza la hipotesis de uniformidad.")
else:
    print("No se rechaza la hipotesis de uniformidad.")

    
