# Generación de números pseudoaleatorios
# Método congruencial lineal

semilla = 7
a = 5
c = 3
m = 16

print("Número | X | Resultado entre 0 y 1")
print("----------------------------------")

for numero in range(1, 11):
    semilla = (a * semilla + c) % m
    resultado = semilla / m
    print(numero, "     |", semilla, "|", resultado)
    
