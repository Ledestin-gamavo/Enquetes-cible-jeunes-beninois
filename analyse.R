# ANALYSE DESCRIPTIVE

load("donnees_finales.RData")

n_accepte <- sum(donnees$accepte)
taux <- round(n_accepte / nrow(donnees) * 100, 1)

cat("Repondants : ", nrow(donnees), "\n")
cat("Acceptation : ", n_accepte, "(", taux, "%)\n")
