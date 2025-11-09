#!/bin/zsh

print() {
  echo "\n-------------------------------------------"
  echo "$1"
  echo "-------------------------------------------"
}

# Time Machine snapshots
print "Deleting Time Machine local snapshots..."
sudo tmutil thinlocalsnapshots / 5000000000 4

# Xcode garbage
print "Deleting Xcode DerivedData & Archives..."
rm -rf ~/Library/Developer/Xcode/DerivedData/*
rm -rf ~/Library/Developer/Xcode/Archives/*
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/*

# Old iOS backups
print "Deleting old iOS backups..."
rm -rf ~/Library/Application\ Support/MobileSync/Backup/*

# System logs
print "Cleaning logs..."
sudo rm -rf /private/var/log/*
sudo rm -rf /private/var/log/asl/*

# App caches (but NOT fonts or system caches)
print "Cleaning app caches safely..."
rm -rf ~/Library/Caches/com.apple.Safari/*
rm -rf ~/Library/Caches/com.apple.mail/*
rm -rf ~/Library/Caches/com.microsoft.VSCode/*
rm -rf ~/Library/Caches/com.google.Chrome/*

# Remove update cache
print "Cleaning macOS update cache..."
sudo rm -rf /Library/Updates/*

print "✅ Safe system cleanup complete!"
