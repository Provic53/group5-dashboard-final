#!/bin/bash

echo "🔧 Running install script..."

# Make module scripts executable
chmod +x modules/*.sh

# Make main dashboard executable
chmod +x admin_dashboard.sh

# Create backup folder if it doesn't exist
mkdir -p ~/backups

echo "✅ Installation complete. Run the dashboard using:"
echo "./admin_dashboard.sh"
