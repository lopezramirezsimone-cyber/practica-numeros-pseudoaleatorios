set.seed(129)

exponencial <- function(n, media) {
  -media * log(1 - runif(n))
}

cat("1. VARIABLE DISCRETA: BERNOULLI\n")
compras <- as.integer(runif(12) < 0.65)
print(compras)
cat("Total de compras:", sum(compras), "\n")

cat("\n2. VARIABLE CONTINUA: UNIFORME\n")
tiempos <- runif(10, min = 2, max = 8)
print(round(tiempos, 2))
cat("Promedio:", round(mean(tiempos), 2), "minutos\n")

cat("\n3. TRANSFORMACION INVERSA\n")
llegadas <- exponencial(10, 4)
print(round(llegadas, 2))
cat("Promedio:", round(mean(llegadas), 2), "minutos\n")

cat("\n4. CONVOLUCION\n")
totales <- exponencial(10, 3) + exponencial(10, 3)
print(round(totales, 2))
cat("Promedio:", round(mean(totales), 2), "minutos\n")

cat("\n5. COMPOSICION\n")
atenciones <- numeric(10)

for (i in 1:10) {
  rapida <- runif(1) < 0.70
  tipo <- if (rapida) "Rapida" else "Larga"
  tiempo <- if (rapida) runif(1, 1, 3) else runif(1, 5, 9)
  
  atenciones[i] <- tiempo
  cat("Cliente", i, "-", tipo, "-", round(tiempo, 2), "minutos\n")
}

cat("Promedio:", round(mean(atenciones), 2), "minutos\n")

cat("\n6. ACEPTACION Y RECHAZO\n")
aceptados <- numeric(0)
intentos <- 0

while (length(aceptados) < 10) {
  x <- runif(1)
  u <- runif(1)
  intentos <- intentos + 1
  
  if (u <= x) {
    aceptados <- c(aceptados, x)
  }
}

print(round(aceptados, 4))
cat("Intentos:", intentos, "\n")
cat("Rechazados:", intentos - length(aceptados), "\n")
cat("Promedio:", round(mean(aceptados), 4), "\n")

cat("\n7. PRUEBA DE UNIFORMIDAD\n")
numeros <- runif(1000)
limites <- seq(0, 1, by = 0.2)
grupos <- cut(numeros, breaks = limites, include.lowest = TRUE)
frecuencias <- table(grupos)

print(frecuencias)
cat("Frecuencia esperada por intervalo: 200\n")

resultado <- chisq.test(as.vector(frecuencias), p = rep(0.2, 5))
print(resultado)

if (resultado$p.value < 0.05) {
  cat("Se rechaza la hipotesis de uniformidad.\n")
} else {
  cat("No se rechaza la hipotesis de uniformidad.\n")
}

hist(numeros, breaks = limites,
     main = "Distribucion de numeros pseudoaleatorios",
     xlab = "Intervalos", ylab = "Frecuencia",
     col = "lightblue", border = "white")

