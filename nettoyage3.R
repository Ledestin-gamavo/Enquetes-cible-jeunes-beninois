# Nettoyage 3 : SUPPRESSION DES VALEURS MANQUANTES SUR BENINOIS puis du doublon

# Suppression des valeurs manquantes
donnees_brutes <- donnees_brutes[!is.na(donnees_brutes$beninois), ]

# Verification
cat("Verification apres suppression\n")
cat("Valeurs manquantes sur 'beninois' : ", sum(is.na(donnees_brutes$beninois)), "\n")

#Suppression du doublon
donnees <- donnees_brutes[!duplicated(donnees_brutes),]

# Verification
cat("Verification apres suppression des doublons\n")
cat("Nombre de lignes restantes : ", nrow(donnees), "\n")

# Sauvegarde
save(donnees_brutes, file = "donnees_n3.RData")

