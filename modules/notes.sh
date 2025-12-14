#!/bin/bash

# Lab-OS Code & Notes Vault (including File Sharing)

# Credentials stored in Bash array
# Format: username:last4digits:full name:email

users=(
"1412:1412:Asma Azmi Priya:priya22205101412@diu.edu.bd"
"1011:1011:Nusrat Jahan Borsha:borsha23105101011@diu.edu.bd"
"1012:1012:Mst.Jannatul Ferdus:ferdus23105101012@diu.edu.bd"
"1031:1031:Md. Mujakkir Hasan Tuhin:tuhin23105101031@diu.edu.bd"
"1065:1065:Zobayer Amin:amin23105101065@diu.edu.bd"
"1210:1210:Al Mahmud:mahmud23105101210@diu.edu.bd"
"1218:1218:Md. Wazid Hasan Likhon:Likhon23105101218@diu.edu.bd"
"1240:1240:Md. Reyad Hossain:hossain23105101240@diu.edu.bd"
"1319:1319:Md. Talim Afrid Tomal:tomal23105101319@diu.edu.bd"
"1329:1329:Jayed Mhamud:jayed23105101329@diu.edu.bd"
"1506:1506:Ashrafuzzaman Khalid:khalid23105101506@diu.edu.bd"
"1507:1507:Md. Rayhan Akanda:akanda23105101507@diu.edu.bd"
"1687:1687:Asiqul Islam:islam2305101687@diu.edu.bd"
"1824:1824:Afhia Jahin:jahin2305101824@diu.edu.bd"
"1825:1825:Jonayed Hasan Noyan:noyan2305101825@diu.edu.bd"
"1845:1845:Nishat Tasnim:tasnim2305101845@diu.edu.bd"
"1887:1887:Ummay Jubaiya Moushi:moushi2305101887@diu.edu.bd"
"1895:1895:Kazi Amir Hamza:hamza2305101895@diu.edu.bd"
"1917:1917:Jannat Akter Duli:duli2305101917@diu.edu.bd"
"1918:1918:MD. Minhazur Rahman:mim2305101918@diu.edu.bd"
"1923:1923:Sadia Khatun:sadia2305101923@diu.edu.bd"
"1924:1924:Md Rafiul Hasan Sazib:sazib2305101924@diu.edu.bd"
"1928:1928:Resad Chowdhury:chowdhury2305101928@diu.edu.bd"
"1930:1930:Nafish Imtiaz Imti:imti2305101930@diu.edu.bd"
"1933:1933:Md Tareque Jamil Josh:tarequecs@gmail.com"
"1030:1030:Zarin Tasnim:tasnim23105101030@diu.edu.bd"
"1097:1097:Tanjidul Islam Hridoy:Hridoy23105101097@diu.edu.bd"
"1115:1115:Md. Ashik Sorkar:sorkar23105101115@diu.edu.bd"
"1169:1169:Mita Debnath:debnath23105101169@diu.edu.bd"
"1304:1304:Sabiha Sarmin Ridi:ridi23105101304@diu.edu.bd"
"1324:1324:Dipjoy Datta:datta23105101324@diu.edu.bd"
"1339:1339:MD. AMIR AL ISLAM APON:apon23105101339@diu.edu.bd"
"1340:1340:Md.Mustafizur Rahman Ashik:ashik23105101340@diu.edu.bd"
"1355:1355:Nakibul Islam Fahim:fahim23105101355@diu.edu.bd"
"1424:1424:Anik Rahman:rahman23105101424@diu.edu.bd"
"1490:1490:MIRAZ AHMED:ahmed2305101490@diu.edu.bd"
"1521:1521:MD NAYEM BIN NEWAS:newas23105101521@diu.edu.bd"
"1522:1522:Maria Sultana Niha:Niha23105101522@diu.edu.bd"
"1523:1523:Nusrat Jahan Nisha:Nisha23105101523@diu.edu.bd"
"1563:1563:Md. Rafiul Alam:alam23105101563@diu.edu.bd"
"1579:1579:Md Sajid Islam:islam2305101579@diu.edu.bd"
"1594:1594:Sheikh Mostakim Ahmed:ahmed2305101594@diu.edu.bd"
"1633:1633:Md.Neamat Ullah:neamat2305101633@diu.edu.bd"
"1647:1647:MD. SHARIAR ZAMAN:zaman2305101647@diu.edu.bd"
"1710:1710:Washema Anjum Ahona:ahona2305101710@diu.edu.bd"
"1760:1760:Md.Rashedul Islam Himel:himel2305101760@diu.edu.bd"
"1805:1805:Md Habibur Rahman:habib2305101805@diu.edu.bd"
"1855:1855:Zakia Sultana Zitu:zitu2305101855@diu.edu.bd"
"1889:1889:Md.Shakhawat Hossen:hossen2305101889@diu.edu.bd"
"1971:1971:Jannatul Mawa:mawa2305101971@diu.edu.bd"
)

NOTES_FILE="data/notes_$LOGGED_USER.txt"
SHARED_DIR="data/shared"

NOTES_FILE="data/notes_$LOGGED_USER.txt"
SHARED_DIR="data/shared"

notes_menu() {
    mkdir -p "$SHARED_DIR"
    while true; do
        echo
        echo "Code & Notes Vault"
        echo "1. Add Note/Snippet"
        echo "2. View Notes"
        echo "3. Search Notes"
        echo "4. Delete Note"
        echo "5. Upload Shared File"
        echo "6. Download Shared File"
        echo "7. List Shared Files"
        echo "8. Email Note/File"
        echo "9. Back to Main Menu"
        read -p "Choose an option: " choice

        case $choice in
            1) add_note ;;
            2) view_notes ;;
            3) search_notes ;;
            4) delete_note ;;
            5) upload_file ;;
            6) download_file ;;
            7) list_files ;;
            8) email_menu ;;
            9) return ;;
            *) echo "Invalid option." ;;
        esac
    done
}

add_note() {
    read -p "Enter title: " title
    echo "Enter content (end with Ctrl+D):"
    content=$(cat)
    if [ ! -f "$NOTES_FILE" ]; then
        touch "$NOTES_FILE"
    fi
    id=$(($(wc -l < "$NOTES_FILE") + 1))
    echo "$id:$title:$content" >> "$NOTES_FILE"
    echo "Note added."
}

view_notes() {
    if [ ! -f "$NOTES_FILE" ] || [ ! -s "$NOTES_FILE" ]; then
        echo "No notes found."
        return
    fi
    while IFS=: read -r id title content; do
        echo "ID: $id"
        echo "Title: $title"
        echo "Content: $content"
        echo "---"
    done < "$NOTES_FILE"
}

search_notes() {
    read -p "Enter search term: " term
    if [ ! -f "$NOTES_FILE" ]; then
        echo "No notes found."
        return
    fi
    grep -i "$term" "$NOTES_FILE" | while IFS=: read -r id title content; do
        echo "ID: $id | Title: $title"
        echo "Content: $content"
        echo "---"
    done
}

delete_note() {
    view_notes
    read -p "Enter note ID to delete: " id
    if grep -q "^$id:" "$NOTES_FILE"; then
        sed -i "/^$id:/d" "$NOTES_FILE"
        echo "Note deleted."
    else
        echo "Note not found."
    fi
}

upload_file() {
    read -p "Enter file path to upload: " file
    if [ -f "$file" ]; then
        cp "$file" "$SHARED_DIR/"
        echo "File uploaded."
    else
        echo "File not found."
    fi
}

download_file() {
    list_files
    read -p "Enter filename to download: " filename
    if [ -f "$SHARED_DIR/$filename" ]; then
        read -p "Enter destination path: " dest
        cp "$SHARED_DIR/$filename" "$dest"
        echo "File downloaded."
    else
        echo "File not found."
    fi
}

list_files() {
    ls -la "$SHARED_DIR"
}

email_menu() {
    while true; do
        echo
        echo "Email Menu"
        echo "1. Email to Student"
        echo "2. Email to Teacher"
        echo "3. Back to Notes Menu"
        read -p "Choose an option: " choice

        case $choice in
            1) email_to_student ;;
            2) email_to_teacher ;;
            3) return ;;
            *) echo "Invalid option." ;;
        esac
    done
}

email_to_student() {
    read -p "Enter recipient's last 4 digits of student ID: " recipient_id
    # Find name and email from users array
    recipient_name=""
    recipient_email=""
    for u in "${users[@]}"; do
        IFS=":" read -r id pass name email <<< "$u"
        if [[ "$id" == "$recipient_id" ]]; then
            recipient_name="$name"
            recipient_email="$email"
            break
        fi
    done
    if [[ -z "$recipient_name" ]]; then
        echo "Student ID not found."
        return
    fi
    send_email "$recipient_email" "$recipient_name"
}

email_to_teacher() {
    recipient_email="taufik.cse@diu.edu.bd"
    recipient_name="Course Teacher"
    send_email "$recipient_email" "$recipient_name"
}

send_email() {
    local recipient_email="$1"
    local recipient_name="$2"
    local sender_email="${LOGGED_USER}@diu.edu.bd"
    
    read -s -p "Enter your email password (for $sender_email): " password
    echo  # New line after password input
    
    echo "What to send?"
    echo "1. A Note"
    echo "2. A File"
    read -p "Choose: " type
    if [[ "$type" == "1" ]]; then
        view_notes
        read -p "Enter note ID to email: " id
        if grep -q "^$id:" "$NOTES_FILE"; then
            IFS=":" read -r _ title content <<< "$(grep "^$id:" "$NOTES_FILE")"
            subject="Lab-OS Note: $title"
            body="Note from $LOGGED_NAME ($LOGGED_USER):\n\n$content"
            if python3 send_email.py "$sender_email" "$password" "$recipient_email" "$subject" "$body"; then
                echo "Note emailed to $recipient_name ($recipient_email)."
            else
                echo "Failed to send email."
            fi
        else
            echo "Note not found."
        fi
    elif [[ "$type" == "2" ]]; then
        read -p "Enter file path to email: " file
        if [[ -f "$file" ]]; then
            subject="Lab-OS File from $LOGGED_NAME ($LOGGED_USER)"
            body="File attached from $LOGGED_NAME."
            if python3 send_email.py "$sender_email" "$password" "$recipient_email" "$subject" "$body" "$file"; then
                echo "File emailed to $recipient_name ($recipient_email)."
            else
                echo "Failed to send email."
            fi
        else
            echo "File not found."
        fi
    else
        echo "Invalid choice."
    fi
}