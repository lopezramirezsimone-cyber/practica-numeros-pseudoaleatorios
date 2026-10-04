set.seed(50)

cantidad_clientes <- 15
llegada <- 0
fin_anterior <- 0

tabla <- data.frame(
  Cliente = integer(),
  Llegada = integer(),
  Servicio = integer(),
  Inicio = integer(),
  Fin = integer(),
  Espera = integer()
)

for (cliente in 1:cantidad_clientes) {
  if (cliente > 1) {
    llegada <- llegada + sample(1:5, 1)
  }
  
  servicio <- sample(2:6, 1)
  inicio <- max(llegada, fin_anterior)
  fin <- inicio + servicio
  espera <- inicio - llegada
  
  tabla <- rbind(
    tabla,
    data.frame(
      Cliente = cliente,
      Llegada = llegada,
      Servicio = servicio,
      Inicio = inicio,
      Fin = fin,
      Espera = espera
    )
  )
  
  fin_anterior <- fin
}

cat("EJERCICIO 3: ATENCION A 15 CLIENTES\n\n")
print(tabla, row.names = FALSE)

cat("\nRESULTADOS\n")
cat("Clientes atendidos:", cantidad_clientes, "\n")
cat("Clientes que esperaron:", sum(tabla$Espera > 0), "\n")

cat(sprintf(
  "Tiempo promedio de espera: %.2f minutos\n",
  mean(tabla$Espera)
))

cat(sprintf(
  "Tiempo promedio de servicio: %.2f minutos\n",
  mean(tabla$Servicio)
))

cat("Espera maxima:", max(tabla$Espera), "minutos\n")
cat("La ultima atencion termina en el minuto:", fin_anterior, "\n")
