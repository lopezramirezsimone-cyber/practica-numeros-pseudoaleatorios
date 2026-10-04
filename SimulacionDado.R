set.seed(30)

cantidad_lanzamientos <- 20
resultados <- sample(1:6, cantidad_lanzamientos, replace = TRUE)

cat("EJERCICIO 1: SIMULACION DE UN DADO\n\n")

for (i in 1:cantidad_lanzamientos) {
  cat("Lanzamiento", i, ": cara", resultados[i], "\n")
}

frecuencias <- tabulate(resultados, nbins = 6)

tabla <- data.frame(
  Cara = 1:6,
  Veces = frecuencias,
  Porcentaje = frecuencias / cantidad_lanzamientos * 100
)

cat("\nFRECUENCIA DE CADA CARA\n")
print(tabla, row.names = FALSE)

cat("\nTotal de lanzamientos:", cantidad_lanzamientos, "\n")
cat(sprintf(
  "Promedio de las caras: %.2f\n",
  mean(resultados)
))
