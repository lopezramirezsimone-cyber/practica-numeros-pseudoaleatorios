semilla <- 7
a <- 5
c <- 3
m <- 16

cat("Número | X | Resultado entre 0 y 1\n")
cat("----------------------------------\n")

for (numero in 1:10) {
  semilla <- (a * semilla + c) %% m
  resultado <- semilla / m
  cat(numero, "|", semilla, "|", resultado, "\n")
}

