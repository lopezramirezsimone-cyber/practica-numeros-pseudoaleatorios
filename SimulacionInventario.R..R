set.seed(40)

inventario <- 50
dias <- 7
total_vendido <- 0
total_no_atendido <- 0

tabla <- data.frame(
  Dia = integer(),
  Demanda = integer(),
  Vendidos = integer(),
  No_atendidos = integer(),
  Existencias = integer()
)

for (dia in 1:dias) {
  demanda <- sample(5:12, 1)
  vendidos <- min(demanda, inventario)
  no_atendidos <- demanda - vendidos
  inventario <- inventario - vendidos
  
  total_vendido <- total_vendido + vendidos
  total_no_atendido <- total_no_atendido + no_atendidos
  
  tabla <- rbind(
    tabla,
    data.frame(
      Dia = dia,
      Demanda = demanda,
      Vendidos = vendidos,
      No_atendidos = no_atendidos,
      Existencias = inventario
    )
  )
}

cat("EJERCICIO 2: SIMULACION DE INVENTARIO\n\n")
cat("Inventario inicial: 50 productos\n\n")

print(tabla, row.names = FALSE)

cat("\nTotal vendido:", total_vendido, "\n")
cat("Demanda no atendida:", total_no_atendido, "\n")
cat("Inventario final:", inventario, "\n")
