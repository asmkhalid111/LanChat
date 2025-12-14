#!/bin/bash

# Lab-OS Deployment Script
# Run this on the admin PC to deploy to all lab PCs

# List of lab PC IPs/hostnames (update this list)
LAB_PCS=(
    "192.168.1.101"
    "192.168.1.102"
    # Add more IPs
)

ADMIN_USER="admin"  # SSH username
PROJECT_DIR="/Users/tarequejosh/Downloads/OS Project"  # Local project path
REMOTE_DIR="/home/$ADMIN_USER/Lab-OS"  # Remote path

# Function to deploy to a single PC
deploy_to_pc() {
    local pc=$1
    echo "Deploying to $pc..."

    # Copy project
    scp -r "$PROJECT_DIR" "$ADMIN_USER@$pc:$REMOTE_DIR"

    # Make scripts executable
    ssh "$ADMIN_USER@$pc" "cd '$REMOTE_DIR' && find . -name '*.sh' -exec chmod +x {} \;"

    # Install dependencies
    ssh "$ADMIN_USER@$pc" "sudo apt update && sudo apt install -y python3 net-tools wireless-tools alsa-utils upower"

    echo "Deployed to $pc"
}

# Deploy to all PCs
for pc in "${LAB_PCS[@]}"; do
    deploy_to_pc "$pc" &
done
wait

echo "Deployment complete."

# To start on all PCs (run separately)
# Choose one PC as server, e.g., 192.168.1.100
# SERVER_PC="192.168.1.100"
# ssh "$ADMIN_USER@$SERVER_PC" "cd '$REMOTE_DIR' && ./server.sh &"
# For each client PC:
# for pc in "${LAB_PCS[@]}"; do
#     if [ "$pc" != "$SERVER_PC" ]; then
#         ssh "$ADMIN_USER@$pc" "cd '$REMOTE_DIR' && ./labos.sh" &
#     fi
# done