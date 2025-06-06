#!/bin/bash

while true; do
  clear
  echo "=== USER MANAGEMENT MODULE ==="
  echo "1. List system users"
  echo "2. Add new user"
  echo "3. Delete user"
  echo "4. Back to Main Menu"
  read -p "Choose an option: " opt

  case $opt in
    1)
      echo "📋 System users:"
      cut -d: -f1 /etc/passwd
      read -p "Press Enter to continue..." pause
      ;;
    2)
      read -p "Enter username to add: " newuser
      sudo adduser "$newuser"
      read -p "Press Enter to continue..." pause
      ;;
    3)
      read -p "Enter username to delete: " deluser
      sudo deluser "$deluser"
      read -p "Press Enter to continue..." pause
      ;;
    4)
      break
      ;;
    *)
      echo "Invalid option"
      sleep 1 ;;
  esac
done
