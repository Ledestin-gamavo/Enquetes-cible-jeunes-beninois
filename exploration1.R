# EXPLORATION 1 : VALEURS MANQUANTES ET DOUBLONS


# Chargement

load("donnees_n2.RData")

# Lignes entierement identiques

doublons_lignes <- sum(duplicated(donnees_brutes))
cat("- Nombre de lignes entierement dupliquees : ", doublons_lignes, "\n")

# Verification des valeurs manquantes

na_count <- colSums(is.na(donnees_brutes))
na_percent <- round(na_count / nrow(donnees_brutes) * 100, 2)

# Affichage du tableau recapitulatif

resultat_na <- data.frame(Colonne = names(na_count),
                          NA_count = na_count,
                          NA_percent = na_percent)

print(resultat_na)
