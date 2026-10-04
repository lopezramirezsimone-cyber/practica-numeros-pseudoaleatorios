set.seed(25)

cantidad_clientes <- 10
llegada <- 0
fin_anterior <- 0

resultados <- data.frame(
  Cliente = integer(cantidad_clientes),
  Llegada = integer(cantidad_clientes),
  Servicio = integer(cantidad_clientes),
  Inicio = integer(cantidad_clientes),
  Fin = integer(cantidad_clientes),
  Espera = integer(cantidad_clientes)
)

for (cliente in 1:cantidad_clientes) {
  
  # El primer cliente llega en el minuto cero.
  if (cliente > 1) {
    llegada <- llegada + sample(1:5, 1)
  }
  
  servicio <- sample(2:6, 1)
  
  # La atencion comienza cuando el cliente llega
  # y la persona encargada esta disponible.
  inicio <- max(llegada, fin_anterior)
  fin <- inicio + servicio
  espera <- inicio - llegada
  
  resultados[cliente, ] <- c(
    cliente, llegada, servicio, inicio, fin, espera
  )
  
  fin_anterior <- fin
}

cat("SIMULACION DE ATENCION A CLIENTES\n")
cat("Todos los tiempos estan en minutos.\n\n")

print(resultados, row.names = FALSE)

cat("\nRESULTADOS\n")
cat("Clientes atendidos:", cantidad_clientes, "\n")
cat(
  "Clientes que esperaron:",
  sum(resultados$Espera > 0), "\n"
)
cat(sprintf(
  "Tiempo promedio de espera: %.2f minutos\n",
  mean(resultados$Espera)
))
cat(sprintf(
  "Tiempo promedio de servicio: %.2f minutos\n",
  mean(resultados$Servicio)
))
cat(
  "La ultima atencion termina en el minuto:",
  fin_anterior, "\n"
)
