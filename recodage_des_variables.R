# RECODAGE DES VARIABLES

# Charger les bibliothèques
library(dplyr)

# Charger les données nettoyées
load("donnees_n3.RData")

# Renommer l'objet pour avoir un nom plus simple
donnees <- donnees_brutes

# Supprimer l'ancien objet pour libérer la mémoire
rm(donnees_brutes)

# Recodage de l'âge (enlever "ans")
donnees$age <- as.numeric(gsub(" ans", "", donnees$age))

# Variable cible (acceptation)
donnees$accepte <- ifelse(
  donnees$acceptation 
  %in% c("Oui, certainement", "Oui, probablement"), 
  1, 
  0)

cat("Taux d'acceptation :", round(mean(donnees$accepte) * 100, 1), "%\n")

# Recodage du revenu
donnees$revenu_num <- case_when(
  donnees$revenu == "Moins de 25 000 FCFA" ~ 1,
  donnees$revenu == "25 000 - 49 999 FCFA" ~ 2,
  donnees$revenu == "50 000 - 74 999 FCFA" ~ 3,
  donnees$revenu == "75 000 - 99 999 FCFA" ~ 4,
  donnees$revenu == "100 000 - 199 999 FCFA" ~ 5,
  donnees$revenu == "200 000  FCFA ou plus" ~ 6,
  TRUE ~ NA_real_
)

# Recodage de l'épargne
donnees$epargne_num <- case_when(
  donnees$epargne == "Je n'épargne pas" ~ 0,
  donnees$epargne == "Moins de 5 000 FCFA" ~ 1,
  donnees$epargne == "5 000 - 9 999 FCFA" ~ 2,
  donnees$epargne == "10 000 - 29 999 FCFA" ~ 3,
  donnees$epargne == "30 000 - 49 999 FCFA" ~ 4,
  donnees$epargne == "50 000 FCFA ou plus" ~ 5,
  TRUE ~ NA_real_
)

# Recodage de la tolérance au risque
donnees$risque_num <- case_when(
  donnees$tolerance_risque == "Éviter toute perte (très prudent)" ~ 1,
  donnees$tolerance_risque == "Accepter de petites variations (prudent)" ~ 2,
  donnees$tolerance_risque == "Accepter des variations modérées pour un meilleur gain" ~ 3,
  donnees$tolerance_risque == "Accepter des variations fortes pour un très haut gain" ~ 4,
  TRUE ~ NA_real_
)

# Recodage de la patience financière
donnees$patience_num <- case_when(
  donnees$patience_financiere == "70 000 FCFA dans 6 mois" ~ 1,
  donnees$patience_financiere == "50 000 FCFA tout de suite" ~ 0,
  TRUE ~ NA_real_
)

# Recodage de l'intérêt pour la finance
donnees$interet_num <- case_when(
  donnees$interet_finance == "Oui, beaucoup" ~ 3,
  donnees$interet_finance == "Oui, un peu" ~ 2,
  donnees$interet_finance == "Non, pas vraiment" ~ 1,
  donnees$interet_finance == "Non, pas du tout" ~ 0,
  TRUE ~ NA_real_
)

# Afficher les résultats
cat("\n RÉSULTATS DU RECODAGE\n")
cat("Âge min :", min(donnees$age, na.rm = TRUE), "\n")
cat("Âge max :", max(donnees$age, na.rm = TRUE), "\n")
cat("Nombre total :", nrow(donnees), "répondants\n")

# Sauvegarde finale
save(donnees, file = "donnees_finales.RData")

write.csv(donnees, "donnees_finales.csv", 
          row.names = FALSE, 
          fileEncoding = "UTF-8")

