#!/bin/bash

# Change to Downloads directory
cd ~/Downloads

# Create folders if they don't exist
mkdir -p docs ss wallpaper secure videos code packages audio

# Move secure files (expanded keywords)
find . -maxdepth 1 -type f \( -iname "*password*" -o -iname "*key*" -o -iname "*secret*" -o -iname "*secure*" -o -iname "*backup*" -o -iname "*confidential*" -o -iname "*private*" \) -exec mv {} secure/ \; 2>/dev/null

# Move screenshots
find . -maxdepth 1 -type f \( -iname "*screenshot*" -o -iname "*screen shot*" \) -exec mv {} ss/ \; 2>/dev/null

# Move documents
find . -maxdepth 1 -type f \( -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.txt" -o -iname "*.rtf" -o -iname "*.pages" -o -iname "*.odt" -o -iname "*.xls" -o -iname "*.xlsx" -o -iname "*.xlsm" -o -iname "*.ppt" -o -iname "*.pptx" -o -iname "*.csv" -o -iname "*.json" -o -iname "*.xml" -o -iname "*.epub" -o -iname "*.mobi" \) -exec mv {} docs/ \; 2>/dev/null

# Move code files
find . -maxdepth 1 -type f \( -iname "*.html" -o -iname "*.htm" -o -iname "*.css" -o -iname "*.js" -o -iname "*.py" -o -iname "*.java" -o -iname "*.cpp" -o -iname "*.c" -o -iname "*.h" -o -iname "*.php" -o -iname "*.rb" -o -iname "*.go" -o -iname "*.rs" -o -iname "*.ts" -o -iname "*.sh" -o -iname "*.pl" -o -iname "*.swift" -o -iname "*.kt" -o -iname "*.md" -o -iname "*.yaml" -o -iname "*.yml" -o -iname "*.toml" -o -iname "*.ini" -o -iname "*.cfg" -o -iname "*.conf" -o -iname "*.sql" -o -iname "*.r" -o -iname "*.m" \) -exec mv {} code/ \; 2>/dev/null

# Move images to wallpaper folder
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.tif" -o -iname "*.webp" -o -iname "*.heic" -o -iname "*.ico" -o -iname "*.icns" -o -iname "*.svg" -o -iname "*.eps" -o -iname "*.ai" -o -iname "*.psd" \) -exec mv {} wallpaper/ \; 2>/dev/null

# Move videos
find . -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv" -o -iname "*.wmv" -o -iname "*.flv" -o -iname "*.webm" -o -iname "*.m4v" -o -iname "*.3gp" -o -iname "*.mpg" -o -iname "*.mpeg" \) -exec mv {} videos/ \; 2>/dev/null

# Move audio files
find . -maxdepth 1 -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.flac" -o -iname "*.aac" -o -iname "*.ogg" -o -iname "*.m4a" -o -iname "*.wma" -o -iname "*.aiff" \) -exec mv {} audio/ \; 2>/dev/null

# Move packages/executables
find . -maxdepth 1 -type f \( -iname "*.dmg" -o -iname "*.pkg" -o -iname "*.exe" -o -iname "*.msi" -o -iname "*.deb" -o -iname "*.rpm" -o -iname "*.apk" -o -iname "*.appimage" \) -exec mv {} packages/ \; 2>/dev/null

# Move archives
find . -maxdepth 1 -type f \( -iname "*.zip" -o -iname "*.tar" -o -iname "*.gz" -o -iname "*.7z" -o -iname "*.rar" -o -iname "*.bz2" -o -iname "*.xz" \) -exec mv {} packages/ \; 2>/dev/null

echo "Downloads folder organized successfully!"
echo "Files moved to: docs, ss, wallpaper, secure, videos, code, packages, audio"