#!/bin/bash

while true; do
  clear
  echo "=== PROCESS MANAGEMENT MODULE ==="
  echo "1. View top CPU processes"
  echo "2. Search for a process"
  echo "3. Kill a process by PID"
  echo "4. Back to Main Menu"
  read -p "Choose an option: " opt

  case $opt in
    1)
      echo "Top 10 processes by CPU usage:"
      ps aux --sort=-%cpu | head -n 11
      read -p "Press Enter to continue..." pause
      ;;
    2)
      read -p "Enter process name to search: " pname
      ps aux | grep -i "$pname" | grep -v "grep"
      read -p "Press Enter to continue..." pause
      ;;
    3)
      read -p "Enter PID to kill: " pid
      if sudo kill "$pid" 2>/dev/null; then
        echo "✅ Process $pid killed."
      else
        echo "❌ Failed to kill process $pid. Try with sudo or check PID."
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
