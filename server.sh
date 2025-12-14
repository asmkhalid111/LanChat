#!/bin/bash

# Lab-OS Chat Server Launcher

# Get the local IP address (works on macOS and Linux)
IP=$(ifconfig | grep -E 'inet ' | grep -v 127.0.0.1 | head -1 | awk '{print $2}')
PORT=12345

echo "Starting Lab-OS Chat Server..."
echo "Server IP: $IP"
echo "Server Port: $PORT"
echo "Clients can connect using IP: $IP and Port: $PORT"
python3 server/chat_server.py