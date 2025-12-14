#!/bin/bash

# Lab-OS Main Script

# Source modules
source ./modules/login.sh
source ./modules/chat.sh
source ./modules/todo.sh
source ./modules/notes.sh
source ./modules/monitor.sh
source ./modules/announcement.sh

# Call login
login

# Main Menu
while true; do
    echo
    echo "Lab-OS Main Menu"
    echo "1. Announcement Board"
    echo "2. To Do's lab tasks"
    echo "3. Code & Notes Vault"
    echo "4. Talk to friends"
    echo "5. User Manual and Command Helper"
    echo "6. Exit"
    read -p "Choose an option: " choice

    case $choice in
        1) announcement_menu ;;
        2) todo_menu ;;
        3) notes_menu ;;
        4) chat_menu ;;
        5) helper_menu ;;
        6) echo "Exiting Lab-OS. Goodbye!"; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done