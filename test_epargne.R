# TEST KHI-DEUX : ACCEPTATION et PATIENCE

load("donnees_finales.RData")

table_accept_patience <- table(donnees$accepte, donnees$patience_num)
test <- chisq.test(table_accept_patience, simulate.p.value = TRUE, B = 2000)

print(test)
