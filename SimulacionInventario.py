import random

random.seed(40)

inventario = 50
total_vendido = 0
total_no_atendido = 0

print("EJERCICIO 2: SIMULACION DE INVENTARIO")
print("Inventario inicial: 50 productos")
print("Periodo: 7 dias sin reabastecimiento\n")

print(f"{'Dia':<6}{'Demanda':<10}{'Vendidos':<10}"
      f"{'No atendidos':<14}{'Existencias':<12}")

for dia in range(1, 8):
    demanda = random.randint(5, 12)
    vendidos = min(demanda, inventario)
    no_atendidos = demanda - vendidos
    inventario -= vendidos

    total_vendido += vendidos
    total_no_atendido += no_atendidos

    print(f"{dia:<6}{demanda:<10}{vendidos:<10}"
          f"{no_atendidos:<14}{inventario:<12}")

print("\nRESULTADOS")
print(f"Total de productos vendidos: {total_vendido}")
print(f"Demanda no atendida: {total_no_atendido}")
print(f"Inventario final: {inventario}")
