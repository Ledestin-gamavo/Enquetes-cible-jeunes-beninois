# Nettoyage 1 : SUPPRESSION DE LA COLONNE D'ERREUR


cat("AVANT SUPPRESSION\n")
cat("Nombre de colonnes :", ncol(donnees_brutes), "\n")
cat("Noms des colonnes : \n")
print(names(donnees_brutes))


# SUPPRESSION DE LA DERNIERE COLONNE

donnees_brutes <- donnees_brutes[, -ncol(donnees_brutes)]


# VERIFICATION

cat("AVANT SUPPRESSION\n")
cat("Nombre de colonnes :", ncol(donnees_brutes), "\n")
cat("Noms des colonnes : \n")
print(names(donnees_brutes))


# SAUVEGARDE

save(donnees_brutes, file = "donnees_n1.RData")
