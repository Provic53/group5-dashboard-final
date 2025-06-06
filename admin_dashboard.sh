#!/bin/bash

# Group 5 - System Admin Dashboard

while true; do
  clear
  echo "===== SYSTEM ADMIN DASHBOARD ====="
  echo "1. System Info"
  echo "2. User Management"
  echo "3. Process Management"
  echo "4. Network Information"
  echo "5. Backup Utility"
  echo "6. System Update"
  echo "7. Exit"

  read -p "Choose an option: " choice

  case $choice in
    1) bash modules/system_info.sh ;;
    2) bash modules/user_mgmt.sh ;;
    3) bash modules/process_mgmt.sh ;;
    4) bash modules/network_info.sh ;;
    5) bash modules/backup.sh ;;
    6) bash modules/update.sh ;;
    7) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option!"; sleep 1 ;;
  esac
done
