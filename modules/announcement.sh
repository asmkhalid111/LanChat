#!/bin/bash

# Lab-OS Shared Announcement Board

ANNOUNCEMENT_FILE="data/announcements.txt"

announcement_menu() {
    while true; do
        echo
        echo "Shared Announcement Board"
        echo "1. View Announcements"
        echo "2. Add Announcement"
        echo "3. Back to Main Menu"
        read -p "Choose an option: " choice

        case $choice in
            1) view_announcements ;;
            2) add_announcement ;;
            3) return ;;
            *) echo "Invalid option." ;;
        esac
    done
}

view_announcements() {
    if [ ! -f "$ANNOUNCEMENT_FILE" ] || [ ! -s "$ANNOUNCEMENT_FILE" ]; then
        echo "No announcements."
        return
    fi
    cat "$ANNOUNCEMENT_FILE"
}

add_announcement() {
    echo "Enter announcement (end with Ctrl+D):"
    content=$(cat)
    if [ ! -f "$ANNOUNCEMENT_FILE" ]; then
        touch "$ANNOUNCEMENT_FILE"
    fi
    echo "$(date): $LOGGED_NAME: $content" >> "$ANNOUNCEMENT_FILE"
    echo "Announcement added."
}