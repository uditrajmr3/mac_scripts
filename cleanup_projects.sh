#!/bin/zsh

# Base folder — change if needed
PROJECTS_DIR="$HOME/Projects"

echo "Scanning: $PROJECTS_DIR"
echo "--------------------------------------"

# Counters
NODE_MODULES_COUNT=0
VENV_COUNT=0
PY_CACHE_COUNT=0
TEMP_COUNT=0

# Function for safe delete with confirmation
safe_delete() {
  local target="$1"

  if [[ -d "$target" ]]; then
    echo "Found: $target"
    read -q "REPLY?Delete it? (y/n) "
    echo
    if [[ "$REPLY" == "y" ]]; then
      echo "Deleting $target..."
      rm -rf "$target"
    else
      echo "Skipped: $target"
    fi
  fi
}

# Find node_modules
echo "\n🔍 Searching for node_modules..."
find "$PROJECTS_DIR" -type d -name "node_modules" -maxdepth 3 | while read folder; do
  ((NODE_MODULES_COUNT++))
  safe_delete "$folder"
done

# Find python venv
echo "\n🔍 Searching for Python venv folders..."
find "$PROJECTS_DIR" -type d \( -name "venv" -o -name ".venv" \) -maxdepth 3 | while read folder; do
  ((VENV_COUNT++))
  safe_delete "$folder"
done

# Find Python cache
echo "\n🔍 Searching for Python __pycache__ folders..."
find "$PROJECTS_DIR" -type d -name "__pycache__" -maxdepth 5 | while read folder; do
  ((PY_CACHE_COUNT++))
  safe_delete "$folder"
done

# Remove temp build outputs
echo "\n🔍 Searching for build/temp folders..."
find "$PROJECTS_DIR" -type d \( \
  -name "dist" -o \
  -name ".parcel-cache" -o \
  -name ".next" -o \
  -name ".turbo" -o \
  -name "target" \
\) -maxdepth 4 | while read folder; do
  ((TEMP_COUNT++))
  safe_delete "$folder"
done

# Remove .DS_Store and log files
echo "\n🗑 Cleaning miscellaneous files..."
find "$PROJECTS_DIR" -type f -name ".DS_Store" -delete
find "$PROJECTS_DIR" -type f -name "*.log" -delete

echo "\n--------------------------------------"
echo "✅ Cleanup Complete!"
echo "node_modules removed: $NODE_MODULES_COUNT"
echo "Python venv removed: $VENV_COUNT"
echo "__pycache__ removed: $PY_CACHE_COUNT"
echo "Temp build folders removed: $TEMP_COUNT"
echo "--------------------------------------"
