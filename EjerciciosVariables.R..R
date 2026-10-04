set.seed(210)

cat("\n7. PRUEBA DE UNIFORMIDAD\n")

numeros <- runif(1000)

grupos <- cut(
  numeros,
  breaks = seq(0, 1, by = 0.2),
  include.lowest = TRUE
)

frecuencias <- table(grupos)

cat("Cantidad de numeros por intervalo:\n")
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

