#!/bin/bash

# Change to Downloads directory
cd ~/Downloads

# Move documents (common document extensions)
find . -maxdepth 1 -type f \( -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.txt" -o -iname "*.rtf" -o -iname "*.pages" -o -iname "*.xls" -o -iname "*.xlsx" -o -iname "*.ppt" -o -iname "*.pptx" -o -iname "*.odt" \) -exec mv {} docs/ \; 2>/dev/null

# Move screenshots (files containing "screenshot" in name, case insensitive)
find . -maxdepth 1 -type f -iname "*screenshot*" -exec mv {} ss/ \; 2>/dev/null

# Move secure files (files containing "password" or "key" in name, case insensitive)
find . -maxdepth 1 -type f \( -iname "*password*" -o -iname "*key*" \) -exec mv {} secure/ \; 2>/dev/null

# Move other images to wallpaper folder (common image extensions)
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.webp" -o -iname "*.heic" \) -exec mv {} wallpaper/ \; 2>/dev/null

echo "Downloads folder organized successfully!"