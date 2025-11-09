#!/bin/zsh

# ===========================================
# macOS Cleanup Script (ZSH Compatible)
# ===========================================

print_section() {
    echo
    echo "==========================================="
    echo "$1"
    echo "==========================================="
}

ask_user() {
    local response
    while true; do
        read "response?$1 [y/n/a]: "
        case "$response" in
            y|n|a) echo "$response"; return ;;
            *) echo "Invalid input. Use y/n/a." ;;
        esac
    done
}

safe_delete() {
    local target="$1"
    echo "Deleting (safe): $target"
    rm -rf "$target" 2>/dev/null
}

safe_sudo_delete() {
    local target="$1"
    echo "Deleting (sudo, safe): $target"
    sudo rm -rf "$target" 2>/dev/null
}

# ===========================================
# SAFE CLEANUP
# ===========================================
print_section "Executing SAFE Cleanup"

# User caches
echo "Clearing user caches..."
safe_delete ~/Library/Caches/*

# System caches (not SIP)
echo "Clearing system caches (non-SIP)..."
safe_sudo_delete /Library/Caches/*

# Logs
echo "Cleaning logs..."
safe_sudo_delete /private/var/log/*

# Xcode Derived Data
echo "Cleaning Xcode DerivedData..."
safe_delete ~/Library/Developer/Xcode/DerivedData/*

# Time machine snapshots (non-asr volumes)
echo "Deleting Time Machine local snapshots..."
sudo tmutil listlocalsnapshots / 2>/dev/null | awk -F. '{print $2}' | while read snap; do
    sudo tmutil deletelocalsnapshots "$snap" 2>/dev/null
done

echo "✅ Safe cleanup complete"

# ===========================================
# INTERACTIVE (UNSAFE) CLEANUP
# ===========================================
print_section "⚠️ Interactive Cleanup (Potentially Unsafe Items)"

unsafe_items=(
    "$HOME/Library/Application Support/MobileSync/Backup"
    "$HOME/Library/Application Support"
    "$HOME/Library/Developer/Xcode/Archives"
)

unsafe_names=(
    "Old iOS Backups"
    "Application Support (may break apps)"
    "Xcode Archives"
)

index=1

for item in "${unsafe_items[@]}"; do
    name="${unsafe_names[$index]}"

    if [ ! -d "$item" ]; then
        index=$((index+1))
        continue
    fi

    echo
    echo "-------------------------------------------"
    echo "Category: $name"
    echo "Path: $item"
    echo "WARNING: ⚠️ These files may break apps."
    echo "-------------------------------------------"

    # List contents
    files=("$item"/*)
    [[ -z "${files[1]}" ]] && echo "Empty, skipping..." && index=$((index+1)) && continue

    for f in "${files[@]}"; do
        echo " - $f"
    done

    response=$(ask_user "Delete these items?")

    if [[ "$response" == "n" ]]; then
        echo "Skipping $name"
    elif [[ "$response" == "a" ]]; then
        echo "Deleting ALL items in $name"
        for f in "${files[@]}"; do
            safe_sudo_delete "$f"
        done
    else
        for f in "${files[@]}"; do
            echo
            per_item=$(ask_user "Delete $f?")
            [[ "$per_item" == "y" ]] && safe_sudo_delete "$f"
        done
    fi

    index=$((index+1))
done

print_section "✅ Cleanup Script Finished Successfully"
