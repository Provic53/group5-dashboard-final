#!/bin/bash

echo "=== SYSTEM INFORMATION ==="
echo "Hostname: $(hostname)"
echo "OS Version: $(lsb_release -d | cut -f2)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "CPU Info:"
lscpu | grep 'Model name'
echo "RAM Info:"
free -h | grep Mem
echo "---------------------------------"
read -p "Press Enter to return to the menu..."
