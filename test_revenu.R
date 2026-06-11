# TEST KHI-DEUX : ACCEPTATION et REVENU mensuel

load("donnees_finales.RData")

table_accept_revenu <- table(donnees$accepte, donnees$revenu_num)
test <- chisq.test(table_accept_revenu, simulate.p.value = TRUE, B = 2000)


print(test)