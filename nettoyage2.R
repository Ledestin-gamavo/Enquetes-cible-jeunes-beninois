# Nettoyage 2 : RENOMMAGE DES VARIABLES

load("donnees_n1.RData")

# Les noms actuels

cat("NOMS ACTUELS DES COLONNES\n")
print(names(donnees_brutes))


# Renommer les colonnes

colnames(donnees_brutes)[1] <- "timestamp"
colnames(donnees_brutes)[2] <- "age"
colnames(donnees_brutes)[3] <- "genre"
colnames(donnees_brutes)[4] <- "localisation"
colnames(donnees_brutes)[5] <- "revenu"
colnames(donnees_brutes)[6] <- "epargne"
colnames(donnees_brutes)[7] <- "profession"
colnames(donnees_brutes)[8] <- "interet_finance"
colnames(donnees_brutes)[9] <- "frequence_infos"
colnames(donnees_brutes)[10] <- "tolerance_risque"
colnames(donnees_brutes)[11] <- "patience_financiere"
colnames(donnees_brutes)[12] <- "acceptation"
colnames(donnees_brutes)[13] <- "justification"
colnames(donnees_brutes)[14] <- "beninois"


# Verifier les nouveaux noms

cat("NOUVEAUX NOMS\n")
print(names(donnees_brutes))

donnees_brutes <- donnees_brutes[donnees_brutes$beninois == "Oui", ]


# Squvegarde

save(donnees_brutes, file = "donnees_n2.RData")

