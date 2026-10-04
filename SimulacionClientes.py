import random

random.seed(25)

cantidad_clientes = 10
llegada = 0
fin_anterior = 0
total_espera = 0
total_servicio = 0
clientes_que_esperaron = 0

print("SIMULACION DE ATENCION A CLIENTES")
print("Todos los tiempos estan en minutos.\n")

print(
    f"{'Cliente':<9}{'Llegada':<10}{'Servicio':<10}"
    f"{'Inicio':<10}{'Fin':<10}{'Espera':<10}"
)
print("-" * 59)

for cliente in range(1, cantidad_clientes + 1):
    # El primer cliente llega en el minuto cero.
    if cliente > 1:
        llegada += random.randint(1, 5)

    servicio = random.randint(2, 6)

    # La atencion comienza cuando el cliente llega
    # y la persona que atiende esta disponible.
    inicio = max(llegada, fin_anterior)
    fin = inicio + servicio
    espera = inicio - llegada

    total_espera += espera
    total_servicio += servicio

    if espera > 0:
        clientes_que_esperaron += 1

    print(
        f"{cliente:<9}{llegada:<10}{servicio:<10}"
        f"{inicio:<10}{fin:<10}{espera:<10}"
    )

    fin_anterior = fin

print("\nRESULTADOS")
print(f"Clientes atendidos: {cantidad_clientes}")
print(f"Clientes que esperaron: {clientes_que_esperaron}")
print(
    f"Tiempo promedio de espera: "
    f"{total_espera / cantidad_clientes:.2f} minutos"
)
print(
    f"Tiempo promedio de servicio: "
    f"{total_servicio / cantidad_clientes:.2f} minutos"
)
print(f"La ultima atencion termina en el minuto: {fin_anterior}")
