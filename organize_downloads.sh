#!/bin/bash

# Get the current script path
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

# Change to Downloads directory
cd ~/Downloads

# Create main folders if they don't exist (including scripts)
mkdir -p docs ss wallpaper secure videos code packages audio images scripts

# Create subfolders for images if they don't exist
mkdir -p images/jpeg images/png images/gif images/svg images/heic images/other

# FIRST: Move all shell scripts to scripts folder (including this one after execution)
find . -maxdepth 1 -type f -name "*.sh" -exec mv {} scripts/ \; 2>/dev/null

# Move secure files (expanded keywords)
find . -maxdepth 1 -type f \( -iname "*password*" -o -iname "*key*" -o -iname "*secret*" -o -iname "*secure*" -o -iname "*backup*" -o -iname "*confidential*" -o -iname "*private*" \) -exec mv {} secure/ \; 2>/dev/null

# Move screenshots
find . -maxdepth 1 -type f \( -iname "*screenshot*" -o -iname "*screen shot*" \) -exec mv {} ss/ \; 2>/dev/null

# Move actual wallpaper files (only if "wallpaper" in name)
find . -maxdepth 1 -type f \( -iname "*wallpaper*" -o -iname "*background*" -o -iname "*wall paper*" \) -exec mv {} wallpaper/ \; 2>/dev/null

# Move 3D and design files
find . -maxdepth 1 -type f \( -iname "*.glb" -o -iname "*.gltf" -o -iname "*.obj" -o -iname "*.fbx" -o -iname "*.stl" -o -iname "*.blend" -o -iname "*.splinecode" -o -iname "*.fig" -o -iname "*.sketch" \) -exec mv {} code/ \; 2>/dev/null

# Move environment/config files
find . -maxdepth 1 -type f \( -iname "*.env" -o -iname ".env.*" -o -iname "*.config" -o -iname "*.properties" \) -exec mv {} code/ \; 2>/dev/null

# Move documents
find . -maxdepth 1 -type f \( -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.txt" -o -iname "*.rtf" -o -iname "*.pages" -o -iname "*.odt" -o -iname "*.xls" -o -iname "*.xlsx" -o -iname "*.xlsm" -o -iname "*.ppt" -o -iname "*.pptx" -o -iname "*.csv" -o -iname "*.json" -o -iname "*.xml" -o -iname "*.epub" -o -iname "*.mobi" \) -exec mv {} docs/ \; 2>/dev/null

# Move code files (EXCLUDING .sh files since we already moved them)
find . -maxdepth 1 -type f \( -iname "*.html" -o -iname "*.htm" -o -iname "*.css" -o -iname "*.js" -o -iname "*.py" -o -iname "*.java" -o -iname "*.cpp" -o -iname "*.c" -o -iname "*.h" -o -iname "*.php" -o -iname "*.rb" -o -iname "*.go" -o -iname "*.rs" -o -iname "*.ts" -o -iname "*.pl" -o -iname "*.swift" -o -iname "*.kt" -o -iname "*.md" -o -iname "*.yaml" -o -iname "*.yml" -o -iname "*.toml" -o -iname "*.ini" -o -iname "*.cfg" -o -iname "*.conf" -o -iname "*.sql" -o -iname "*.r" -o -iname "*.m" \) -exec mv {} code/ \; 2>/dev/null

# Move videos
find . -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv" -o -iname "*.wmv" -o -iname "*.flv" -o -iname "*.webm" -o -iname "*.m4v" -o -iname "*.3gp" -o -iname "*.mpg" -o -iname "*.mpeg" \) -exec mv {} videos/ \; 2>/dev/null

# Move audio files
find . -maxdepth 1 -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.flac" -o -iname "*.aac" -o -iname "*.ogg" -o -iname "*.m4a" -o -iname "*.wma" -o -iname "*.aiff" \) -exec mv {} audio/ \; 2>/dev/null

# Move packages/executables
find . -maxdepth 1 -type f \( -iname "*.dmg" -o -iname "*.pkg" -o -iname "*.exe" -o -iname "*.msi" -o -iname "*.deb" -o -iname "*.rpm" -o -iname "*.apk" -o -iname "*.appimage" \) -exec mv {} packages/ \; 2>/dev/null

# Move archives
find . -maxdepth 1 -type f \( -iname "*.zip" -o -iname "*.tar" -o -iname "*.gz" -o -iname "*.7z" -o -iname "*.rar" -o -iname "*.bz2" -o -iname "*.xz" \) -exec mv {} packages/ \; 2>/dev/null

# Sort images into subfolders by format
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec mv {} images/jpeg/ \; 2>/dev/null
find . -maxdepth 1 -type f -iname "*.png" -exec mv {} images/png/ \; 2>/dev/null
find . -maxdepth 1 -type f -iname "*.gif" -exec mv {} images/gif/ \; 2>/dev/null
find . -maxdepth 1 -type f -iname "*.svg" -exec mv {} images/svg/ \; 2>/dev/null
find . -maxdepth 1 -type f -iname "*.heic" -exec mv {} images/heic/ \; 2>/dev/null

# Move other image formats to images/other
find . -maxdepth 1 -type f \( -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.tif" -o -iname "*.webp" -o -iname "*.ico" -o -iname "*.icns" -o -iname "*.eps" -o -iname "*.ai" -o -iname "*.psd" \) -exec mv {} images/other/ \; 2>/dev/null

echo "Downloads folder organized successfully!"
echo "Files moved to: docs, ss, wallpaper, secure, videos, code, packages, audio, images, scripts"
echo "Images sorted into: jpeg, png, gif, svg, heic, other"

# Show summary
echo ""
echo "Organization complete! Summary:"
for folder in docs ss wallpaper secure videos code packages audio images scripts; do
    if [ -d "$folder" ]; then
        count=$(find "$folder" -maxdepth 1 -type f | wc -l)
        echo "  $folder: $count files"
    fi
done

# Final message about script location
echo ""
echo "Note: This script has been moved to ~/Downloads/scripts/"
echo "Run 'organize' from anywhere to use this script in the future"