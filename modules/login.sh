#!/bin/bash

# Lab-OS Login Module
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

login() {
    echo "Welcome to Lab-OS"
    read -p "Enter your Student ID (last 4 digits): " user
    read -s -p "Enter Password: " pass
    echo

    login_success=0
    fullname=""

    for u in "${users[@]}"; do
        IFS=":" read -r username password name <<< "$u"
        if [[ "$user" == "$username" && "$pass" == "$password" ]]; then
            login_success=1
            fullname="$name"
            break
        fi
    done

    if [[ $login_success -eq 0 ]]; then
        echo "Invalid credentials. Exiting..."
        exit 1
    fi

    echo "Login successful! Welcome $fullname"
    export LOGGED_USER="$user"
    export LOGGED_NAME="$fullname"
}