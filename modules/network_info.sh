#!/bin/bash

while true; do
  clear
  echo "=== NETWORK INFORMATION MODULE ==="
  echo "1. Show IP configuration"
  echo "2. Display routing table"
  echo "3. Show open ports and active connections"
  echo "4. Ping a host"
  echo "5. Show DNS settings"
  echo "6. Back to Main Menu"
  read -p "Choose an option: " opt

  case $opt in
    1)
      ip addr show
      read -p "Press Enter to continue..." pause
      ;;
    2)
      ip route show
      read -p "Press Enter to continue..." pause
      ;;
    3)
      ss -tuln
      read -p "Press Enter to continue..." pause
      ;;
    4)
      read -p "Enter host to ping (e.g. google.com): " host
      ping -c 4 "$host"
      read -p "Press Enter to continue..." pause
      ;;
    5)
      cat /etc/resolv.conf
      read -p "Press Enter to continue..." pause
      ;;
    6)
      break
      ;;
    *)
      echo "Invalid option"; sleep 1 ;;
  esac
done
