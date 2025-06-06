#!/bin/bash

while true; do
  clear
  echo "=== SYSTEM UPDATE MODULE ==="
  echo "1. Check for available updates"
  echo "2. Show update history"
  echo "3. Apply updates"
  echo "4. Back to Main Menu"
  read -p "Choose an option: " choice

  case $choice in
    1)
      echo "📦 Checking for updates..."
      sudo apt update
      read -p "Press Enter to continue..." pause
      ;;
    2)
      echo "📜 Recent package installs:"
      grep "install " /var/log/dpkg.log 2>/dev/null | tail -n 10
      read -p "Press Enter to continue..." pause
      ;;
    3)
      read -p "Are you sure you want to apply all updates? (y/n): " confirm
      if [[ $confirm == "y" || $confirm == "Y" ]]; then
        sudo apt upgrade -y
        echo "✅ Updates applied."
      else
        echo "❌ Update cancelled."
      fi
      read -p "Press Enter to continue..." pause
      ;;
    4)
      break
      ;;
    *)
      echo "Invalid option"; sleep 1 ;;
  esac
done
