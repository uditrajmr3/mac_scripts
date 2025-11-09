#!/bin/zsh

PROJECTS_DIR="$HOME/Projects"

echo "🚀 Starting fast cleanup in: $PROJECTS_DIR"
echo "-------------------------------------------"

# Counters
node_count=0
venv_count=0
py_cache_count=0
temp_count=0

# Delete node_modules
echo "🧹 Removing node_modules..."
find "$PROJECTS_DIR" -type d -name "node_modules" -maxdepth 3 -prune | while read folder; do
  rm -rf "$folder"
  ((node_count++))
done

# Delete Python venvs
echo "🧹 Removing Python venv folders..."
find "$PROJECTS_DIR" -type d \( -name "venv" -o -name ".venv" \) -maxdepth 3 -prune | while read folder; do
  rm -rf "$folder"
  ((venv_count++))
done

# Delete __pycache__
echo "🧹 Removing __pycache__..."
find "$PROJECTS_DIR" -type d -name "__pycache__" -maxdepth 5 -prune | while read folder; do
  rm -rf "$folder"
  ((py_cache_count++))
done

# Delete build/temp folders
echo "🧹 Removing temp build folders..."
find "$PROJECTS_DIR" -type d \( \
  -name "dist" -o \
  -name ".parcel-cache" -o \
  -name ".next" -o \
  -name ".turbo" -o \
  -name "target" \
\) -maxdepth 4 -prune | while read folder; do
  rm -rf "$folder"
  ((temp_count++))
done

# Remove log files + .DS_Store
echo "🧹 Cleaning logs & .DS_Store…"
find "$PROJECTS_DIR" -type f -name "*.log" -delete
find "$PROJECTS_DIR" -type f -name ".DS_Store" -delete

echo "-------------------------------------------"
echo "✅ Cleanup Finished!"
echo "Removed node_modules: $node_count"
echo "Removed venv folders: $venv_count"
echo "Removed __pycache__: $py_cache_count"
echo "Removed temp build folders: $temp_count"
echo "-------------------------------------------"
