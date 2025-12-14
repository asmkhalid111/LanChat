#!/bin/bash

# Lab-OS Quick Command Helper

helper_menu() {
    while true; do
        echo
        echo "Quick Command Helper & User Manual"
        echo "1. Command Help"
        echo "2. User Manual"
        echo "3. Back to Main Menu"
        read -p "Choose an option: " choice

        case $choice in
            1) command_help ;;
            2) user_manual ;;
            3) return ;;
            *) echo "Invalid option." ;;
        esac
    done
}

command_help() {
    echo "Common OS Lab Commands:"
    echo "1. ls - List files"
    echo "2. cd - Change directory"
    echo "3. mkdir - Make directory"
    echo "4. rm - Remove file/directory"
    echo "5. cp - Copy file"
    echo "6. mv - Move/rename file"
    echo "7. grep - Search text"
    echo "8. find - Find files"
    echo "9. ps - Process status"
    echo "10. kill - Kill process"
    echo "11. chmod - Change permissions"
    echo "12. chown - Change owner"
    echo "13. df - Disk free"
    echo "14. du - Disk usage"
    echo "15. top - Task manager"
    echo "16. ping - Test network"
    echo "17. ifconfig - Network interfaces"
    echo "18. ssh - Secure shell"
    echo "19. scp - Secure copy"
    echo "20. tar - Archive files"
    echo "21. Back to Command Help"
    read -p "Enter command number for details or 21 to go back: " choice

    case $choice in
        1) echo "ls [options] [file]: List directory contents. Options: -l (long), -a (all), -h (human readable)." ;;
        2) echo "cd [directory]: Change the current directory." ;;
        3) echo "mkdir [directory]: Create a new directory." ;;
        4) echo "rm [options] file: Remove files. Options: -r (recursive), -f (force)." ;;
        5) echo "cp [options] source dest: Copy files. Options: -r (recursive)." ;;
        6) echo "mv source dest: Move or rename files." ;;
        7) echo "grep [options] pattern file: Search for pattern in file. Options: -i (ignore case), -r (recursive)." ;;
        8) echo "find path -name pattern: Find files by name." ;;
        9) echo "ps [options]: Report process status. Options: aux (all processes)." ;;
        10) echo "kill [signal] pid: Send signal to process." ;;
        11) echo "chmod permissions file: Change file permissions." ;;
        12) echo "chown user file: Change file owner." ;;
        13) echo "df [options]: Report file system disk space. Options: -h (human readable)." ;;
        14) echo "du [options] path: Estimate file space usage. Options: -h (human), -s (summary)." ;;
        15) echo "top: Display Linux tasks." ;;
        16) echo "ping [options] host: Send ICMP echo requests. Options: -c count." ;;
        17) echo "ifconfig: Configure network interfaces." ;;
        18) echo "ssh user@host: Connect to host via SSH." ;;
        19) echo "scp source dest: Securely copy files." ;;
        20) echo "tar [options] file: Archive files. Options: -c (create), -x (extract), -f (file), -z (gzip)." ;;
        21) return ;;
        *) echo "Invalid option." ;;
    esac
    echo "Press Enter to continue."
    read
}

user_manual() {
    echo "Lab-OS User Manual"
    echo "=================="
    echo "For detailed user manual, refer to README.md in the project directory."
    echo ""
    echo "Quick Overview:"
    echo "- Login with last 4 digits of student ID."
    echo "- Use menu numbers to navigate."
    echo "- Chat requires server running."
    echo "- Data saved in data/ folder."
    echo ""
    echo "Features:"
    echo "1. Announcement Board: View/post notices."
    echo "2. To Do's Lab Tasks: Manage tasks."
    echo "3. Code & Notes Vault: Store/search notes and share files."
    echo "4. Talk to Friends: Group chat."
    echo "5. User Manual & Command Helper: This menu."
    echo ""
    echo "Troubleshooting: Check README.md for details."
    echo ""
    echo "Press Enter to continue."
    read
}