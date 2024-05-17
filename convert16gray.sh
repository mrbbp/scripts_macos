#!/bin/bash

# Vérifier si ImageMagick est installé
if ! command -v convert >/dev/null; then
  echo "ImageMagick n'est pas installé. Veuillez l'installer avant d'exécuter ce script."
  exit 1
fi

# Dossier source contenant les fichiers TIFF
dossier_source="./"

# Vérifier si le dossier source existe
if [ ! -d "$dossier_source" ]; then
  echo "Le dossier source '$dossier_source' n'existe pas."
  exit 1
fi

# Dossier de destination pour les fichiers PNG
dossier_destination="./conv"

# Créer le dossier de destination s'il n'existe pas
mkdir -p "$dossier_destination"

# Convertir chaque fichier TIFF en PNG 16 niveaux de gris
for fichier_tiff in "$dossier_source"/*.tif; do
  nom_fichier_sans_extension="${fichier_tiff%.*}"
  nom_fichier_png="$dossier_destination/${nom_fichier_sans_extension}.png"

  # Convertir le fichier TIFF en PNG 16 niveaux de gris
  convert "$fichier_tiff" +dither -colors 16 PNG8:"$nom_fichier_png"
  # convert image.png +dither -colors 256 -background black -alpha background PNG8:output.png
  echo "convertit $nom_fichier_sans_extension"
done

echo "Conversion terminée. \nLes fichiers PNG 16 coul se trouvent dans le dossier '$dossier_destination'."


#for FILE in *; do echo -e "$FILE\nLoops Rule\!" > $FILE; done
#convert $FILE -colors 16 output.png


