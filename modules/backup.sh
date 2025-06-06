#!/bin/bash

BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

while true; do
  clear
  echo "=== BACKUP UTILITY MODULE ==="
  echo "1. Create Backup"
  echo "2. Restore Backup"
  echo "3. List Available Backups"
  echo "4. Back to Main Menu"
  read -p "Choose an option: " choice

  case $choice in
    1)
      read -p "Enter directory to back up: " target_dir
      if [ -d "$target_dir" ]; then
        backup_name=$(basename "$target_dir")_$(date +%Y%m%d_%H%M%S).tar.gz
        tar -czf "$BACKUP_DIR/$backup_name" "$target_dir"
        echo "✅ Backup saved as $BACKUP_DIR/$backup_name"
      else
        echo "❌ Directory does not exist!"
      fi
      read -p "Press Enter to continue..." pause
      ;;
    2)
      read -p "Enter name of backup file to restore: " backup_file
      if [ -f "$BACKUP_DIR/$backup_file" ]; then
        read -p "Enter destination directory to extract to: " restore_dir
        mkdir -p "$restore_dir"
        tar -xzf "$BACKUP_DIR/$backup_file" -C "$restore_dir"
        echo "✅ Backup restored to $restore_dir"
      else
        echo "❌ Backup file not found!"
      fi
      read -p "Press Enter to continue..." pause
      ;;
    3)
      echo "📂 Available backups:"
      ls "$BACKUP_DIR"
      read -p "Press Enter to continue..." pause
      ;;
    4)
      break
      ;;
    *)
      echo "Invalid option"; sleep 1 ;;
  esac
done
