# Convertisseur d'Images en TIFF 300 DPI

Un script bash simple pour convertir automatiquement vos photos (JPG, JPEG, PNG, HEIC) en format TIFF 300 DPI.

## 📋 Prérequis

Ce script nécessite **ImageMagick** pour fonctionner. Voici comment l'installer selon votre système d'exploitation :

### 🍎 macOS

#### Option 1 : Avec Homebrew (recommandé)
```bash
# Installer Homebrew si vous ne l'avez pas
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installer ImageMagick
brew install imagemagick
```

#### Option 2 : Avec MacPorts
```bash
sudo port install ImageMagick
```

### 🐧 Linux

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install imagemagick
```

#### Fedora/RHEL/CentOS
```bash
sudo dnf install ImageMagick
```

#### Arch Linux
```bash
sudo pacman -S imagemagick
```

### 🪟 Windows

#### Option 1 : Téléchargement direct
1. Allez sur https://imagemagick.org/script/download.php
2. Téléchargez l'installateur Windows
3. Exécutez l'installateur et suivez les instructions

#### Option 2 : Avec Chocolatey
```bash
choco install imagemagick
```

## 🚀 Utilisation

### 1. Préparer vos images
Placez toutes vos images (JPG, JPEG, PNG, ou HEIC) dans le dossier `Input/`.

### 2. Rendre le script exécutable (première fois seulement)
```bash
chmod +x convert_to_tiff.sh
```

### 3. Exécuter le script
```bash
./convert_to_tiff.sh
```

### 4. Récupérer vos images
Les images converties en TIFF 300 DPI se trouvent dans le dossier `output/`.

## 📁 Structure du projet

```
jeanettif/
├── Input/              # Placez vos images ici (JPG, JPEG, PNG, HEIC)
├── output/             # Les fichiers TIFF convertis apparaîtront ici
├── convert_to_tiff.sh  # Le script de conversion
└── README.md           # Ce fichier
```

## 🎯 Formats supportés

- **JPG** / **JPEG** : Format standard de photos
- **PNG** : Format avec transparence
- **HEIC** : Format iPhone (nécessite des bibliothèques supplémentaires)

> **Note pour HEIC :** Si vous avez des problèmes avec les fichiers HEIC, installez également :
> - macOS : `brew install libheif`
> - Ubuntu/Debian : `sudo apt install libheif-dev`

## ⚙️ Caractéristiques techniques

- **Résolution** : 300 DPI (dots per inch)
- **Format de sortie** : TIFF
- **Compression** : LZW (sans perte)
- **Unités** : Pixels par pouce

## 🐛 Résolution de problèmes

### Le script dit "ImageMagick is not installed"
Vous devez installer ImageMagick (voir section Prérequis ci-dessus).

### Aucune image n'est trouvée
- Vérifiez que vos images sont bien dans le dossier `Input/`
- Vérifiez que les extensions sont bien `.jpg`, `.jpeg`, `.png`, ou `.heic`

### Erreur de permission
Rendez le script exécutable avec :
```bash
chmod +x convert_to_tiff.sh
```

### Les fichiers HEIC ne se convertissent pas
Installez le support HEIC pour ImageMagick :
```bash
# macOS
brew install libheif

# Ubuntu/Debian
sudo apt install libheif-dev
```

Puis réinstallez ImageMagick :
```bash
# macOS
brew reinstall imagemagick
```

## 📝 License

Ce projet est open-source et libre d'utilisation.

## 🤝 Contribution

N'hésitez pas à proposer des améliorations ou signaler des bugs !

