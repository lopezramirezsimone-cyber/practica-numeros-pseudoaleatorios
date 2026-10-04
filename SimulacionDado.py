import random

random.seed(30)

cantidad_lanzamientos = 20
frecuencias = [0] * 6
resultados = []

print("EJERCICIO 1: SIMULACION DE UN DADO\n")

for lanzamiento in range(1, cantidad_lanzamientos + 1):
    cara = random.randint(1, 6)
    resultados.append(cara)
    frecuencias[cara - 1] += 1

    print(f"Lanzamiento {lanzamiento:2}: cara {cara}")

print("\nFRECUENCIA DE CADA CARA")
print("Cara    Veces    Porcentaje")

for cara in range(1, 7):
    veces = frecuencias[cara - 1]
    porcentaje = veces / cantidad_lanzamientos * 100

    print(f"{cara:<8}{veces:<9}{porcentaje:.1f}%")

print(f"\nTotal de lanzamientos: {cantidad_lanzamientos}")
print(f"Promedio de las caras: {sum(resultados) / cantidad_lanzamientos:.2f}")
