#!/bin/bash

# Lab-OS Chat Module

chat_menu() {
    while true; do
        echo
        echo "Talk to Friends"
        echo "1. Join Group Chat"
        echo "2. View Chat History"
        echo "3. Back to Main Menu"
        read -p "Choose an option: " choice

        case $choice in
            1) join_group_chat ;;
            2) view_chat_history ;;
            3) return ;;
            *) echo "Invalid option." ;;
        esac
    done
}

join_group_chat() {
    read -p "Enter chat server IP (e.g., 192.168.1.100): " server_ip
    read -p "Enter chat server port (default 12345): " server_port
    server_port=${server_port:-12345}  # Default to 12345 if empty

    echo "Connecting to chat server at $server_ip:$server_port..."
    exec 3<>/dev/tcp/$server_ip/$server_port
    if [ $? -ne 0 ]; then
        echo "Failed to connect to chat server at $server_ip:$server_port."
        return
    fi
    echo "$LOGGED_USER" >&3
    # Background receive
    {
        while read -r line <&3; do
            echo "$line"
        done
    } &
    bg_pid=$!
    echo "Joined group chat. Online users will be shown. Type messages. Type 'exit' to leave."
    while true; do
        read -p "> " msg
        if [[ "$msg" == "exit" ]]; then
            break
        fi
        echo "$msg" >&3
    done
    kill $bg_pid 2>/dev/null
    exec 3>&-
    exec 3<&-
}

view_chat_history() {
    if [ -f data/chat_history.txt ]; then
        tail -20 data/chat_history.txt
    else
        echo "No chat history found."
    fi
}