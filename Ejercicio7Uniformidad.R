# 1. VARIABLE DISCRETA: LANZAMIENTO DE UN DADO
set.seed(150)
cat("\n1. LANZAMIENTO DE UN DADO\n")

dado <- sample(1:6, size = 12, replace = TRUE)
print(dado)
cat("Promedio:", round(mean(dado), 2), "\n")
print(table(factor(dado, levels = 1:6)))


# 2. VARIABLE CONTINUA: TIEMPO DE ENTREGA
set.seed(160)
cat("\n2. TIEMPO DE ENTREGA\n")

entregas <- runif(8, min = 10, max = 20)
print(round(entregas, 2))
cat("Tiempo promedio:",
    round(mean(entregas), 2), "minutos\n")


# 3. TRANSFORMACION INVERSA: TIEMPO DE ESPERA
set.seed(170)
cat("\n3. TRANSFORMACION INVERSA\n")

u <- runif(10)
esperas <- -5 * log(1 - u)
print(round(esperas, 2))
cat("Tiempo promedio:",
    round(mean(esperas), 2), "minutos\n")


# 4. METODO DE CONVOLUCION
set.seed(180)
cat("\n4. METODO DE CONVOLUCION\n")

valores <- numeric(10)

for (i in 1:10) {
  valores[i] <- sum(runif(12)) - 6
}

print(round(valores, 2))
cat("Promedio:", round(mean(valores), 2), "\n")


# 5. METODO DE COMPOSICION
set.seed(190)
cat("\n5. METODO DE COMPOSICION\n")

servicios <- numeric(10)
tipos <- character(10)

for (i in 1:10) {
  if (runif(1) < 0.6) {
    tipos[i] <- "Exponencial"
    servicios[i] <- -3 * log(1 - runif(1))
  } else {
    tipos[i] <- "Uniforme"
    servicios[i] <- runif(1, min = 4, max = 8)
  }
}

print(data.frame(
  Cliente = 1:10,
  Tipo = tipos,
  Minutos = round(servicios, 2)
))

cat("Tiempo promedio:",
    round(mean(servicios), 2), "minutos\n")


# 6. METODO DE ACEPTACION Y RECHAZO
set.seed(200)
cat("\n6. ACEPTACION Y RECHAZO\n")

aceptados <- numeric(0)
intentos <- 0

while (length(aceptados) < 10) {
  x <- runif(1)
  u <- runif(1)
  intentos <- intentos + 1
  
  if (u <= 1 - x) {
    aceptados <- c(aceptados, x)
  }
}

print(round(aceptados, 4))
cat("Intentos:", intentos, "\n")
cat("Rechazados:", intentos - 10, "\n")
cat("Promedio:", round(mean(aceptados), 4), "\n")


# 7. PRUEBA DE UNIFORMIDAD
set.seed(210)
cat("\n7. PRUEBA DE UNIFORMIDAD\n")

numeros <- runif(1000)

grupos <- cut(
  numeros,
  breaks = seq(0, 1, by = 0.2),
  include.lowest = TRUE
)

frecuencias <- table(grupos)
print(frecuencias)

resultado <- chisq.test(
  frecuencias,
  p = rep(0.2, 5)
)

print(resultado)

if (resultado$p.value > 0.05) {
  cat("No se rechaza la uniformidad al nivel del 5%.\n")
} else {
  cat("Se rechaza la uniformidad al nivel del 5%.\n")
}