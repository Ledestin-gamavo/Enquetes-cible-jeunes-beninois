# Chargement du fichier de collecte des donnees


# Bibliotheque pour le chargement
library(readxl)

donnees_brutes <- read_excel("collection_answers.xlsx")

# Sauvegarde du fichier de chargement des donnees
save(donnees_brutes, file = "donnees_brutes.RData")

head(donnees_brutes)