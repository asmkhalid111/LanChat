#!/usr/bin/env python3

import socket
import threading
import time
import os

HOST = '0.0.0.0'
PORT = 12345
clients = {}
online_users = {}
chat_history = []

def load_history():
    if os.path.exists('data/chat_history.txt'):
        with open('data/chat_history.txt', 'r') as f:
            for line in f:
                chat_history.append(line.strip())

def save_history():
    with open('data/chat_history.txt', 'w') as f:
        for msg in chat_history:
            f.write(msg + '\n')

def broadcast(message, sender=None):
    chat_history.append(message)
    save_history()
    for client, user in clients.items():
        if user != sender:
            try:
                client.sendall((message + '\n').encode())
            except:
                pass

def handle_client(client_socket, addr):
    user = None
    try:
        # Receive username
        user = client_socket.recv(1024).decode().strip()
        if user in online_users:
            client_socket.sendall(b"Username already in use.\n")
            client_socket.close()
            return
        clients[client_socket] = user
        online_users[user] = client_socket
        print(f"{user} connected from {addr}")
        # Send online users
        users_list = ','.join(online_users.keys())
        client_socket.sendall(f"ONLINE:{users_list}\n".encode())
        # Send history
        for msg in chat_history[-10:]:  # last 10
            client_socket.sendall((msg + '\n').encode())
        broadcast(f"{user} joined the chat.")
        while True:
            data = client_socket.recv(1024)
            if not data:
                break
            message = data.decode().strip()
            broadcast(f"{user}: {message}")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        if user:
            del clients[client_socket]
            del online_users[user]
            broadcast(f"{user} left the chat.")
        client_socket.close()

def main():
    load_history()
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((HOST, PORT))
    server.listen(5)
    print(f"Chat server listening on {HOST}:{PORT}")
    while True:
        client_socket, addr = server.accept()
        thread = threading.Thread(target=handle_client, args=(client_socket, addr))
        thread.start()

if __name__ == "__main__":
    main()