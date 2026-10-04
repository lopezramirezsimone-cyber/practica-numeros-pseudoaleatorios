set.seed(31)
numeros <- runif(1000)

limites <- seq(0, 1, by = 0.2)
grupos <- cut(numeros, breaks = limites, include.lowest = TRUE)
frecuencias <- table(grupos)

print("Cantidad de números por intervalo:")
print(frecuencias)

resultado <- chisq.test(as.vector(frecuencias),
                        p = rep(0.2, 5))
print(resultado)

hist(numeros, breaks = limites,
     main = "Distribución de números pseudoaleatorios",
     xlab = "Intervalos", ylab = "Frecuencia",
     col = "lightblue", border = "white")

