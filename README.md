# Lab-OS

A terminal-based mini Operating System for university lab using Bash scripts and Python for networking.

## Project Structure

- `labos.sh`: Main script
- `modules/`: Modular scripts
  - `login.sh`: User login system
  - `chat.sh`: Terminal chat client
  - `todo.sh`: Task manager
  - `notes.sh`: Code and notes vault with file sharing
  - `monitor.sh`: User manual and command helper
  - `announcement.sh`: Shared announcement board
- `server/`: Networking server
  - `chat_server.py`: Chat server
- `data/`: Data storage
- `logs/`: Logs

## Prerequisites

- Bash
- Python 3 (for chat server and email)
- Ubuntu/Linux environment
- Install required tools: `sudo apt update && sudo apt install python3 net-tools wireless-tools alsa-utils upower`
- Configure email: DIU uses Google Workspace (@diu.edu.bd). App passwords may be disabled by admin. Contact DIU IT Support to enable SMTP access or use webmail for email functionality. The system attempts Gmail SMTP but may require admin configuration.

## Running Lab-OS

### Single PC
1. Start the chat server in background:
   ```
   ./server.sh &
   ```
   (It will display the server IP and port for clients to use.)

2. Run the main OS:
   ```
   ./labos.sh
   ```

3. Login with last 4 digits of student ID as username and password.

### Manual Deployment with USB
1. Copy the entire Lab-OS folder to a USB drive.
2. On each lab PC:
   - Insert USB and copy Lab-OS to a directory (e.g., `~/Lab-OS`).
   - Install dependencies: `sudo apt update && sudo apt install python3 net-tools wireless-tools alsa-utils upower`
   - Make scripts executable: `cd Lab-OS && find . -name '*.sh' -exec chmod +x {} \;`
3. On the designated server PC: `cd Lab-OS && ./server.sh &`
4. On each client PC: `cd Lab-OS && ./labos.sh`

**Notes**: When joining chat, users will be prompted for the server IP and port. Shared data (announcements, files, chat history) is local per PC. For true sharing, use a network share (e.g., NFS) for the `data/` folder. Chat works across PCs if network allows.

## Features

- **Announcement Board**: View and post shared notices.
- **To Do's Lab Tasks**: Manage tasks with deadlines and completion tracking.
- **Code & Notes Vault**: Store, search, and share notes/snippets and files; email notes/files to students or teacher.
- **Talk to Friends**: Group chat with online users list and history.
- **User Manual and Command Helper**: Built-in help for OS commands and program usage guide.

## User Manual

### Introduction
Lab-OS is a terminal-based mini operating system designed for university computer labs. It provides essential tools for students to manage tasks, share notes and files, communicate, and access help. The system is simple, user-friendly, and optimized for lab environments with up to 50 users on a local network.

### System Requirements
- Ubuntu/Linux-based PCs
- Bash shell
- Python 3 (for chat server)
- Network connectivity (for chat and file sharing)
- Dependencies: `python3`, `net-tools`, `wireless-tools`, `alsa-utils`, `upower`

### Installation and Setup
1. **Single PC Setup**:
   - Ensure dependencies are installed: `sudo apt update && sudo apt install python3 net-tools wireless-tools alsa-utils upower`
   - Navigate to the project directory: `cd Lab-OS`
   - Make scripts executable: `find . -name '*.sh' -exec chmod +x {} \;`

2. **Multi-PC Lab Setup**:
   - Update `deploy.sh` with lab PC IPs and admin credentials.
   - Run `./deploy.sh` to copy files and install dependencies on all PCs.
   - On one PC (server), start the chat server: `./server.sh &`
   - On each client PC, run `./labos.sh`

### Getting Started
1. **Login**:
   - Run `./labos.sh`
   - Enter your Student ID's last 4 digits as username and password (e.g., 1412 for Asma Azmi Priya).
   - On success, you'll see your full name and enter the main menu.

2. **Main Menu Navigation**:
   - Use numbers to select options.
   - Enter your choice and press Enter.
   - Type the required inputs when prompted.

### Features Guide

#### 1. Announcement Board
- **Purpose**: View and post shared notices from instructors or admins.
- **How to Use**:
  - Select "1. Announcement Board".
  - Choose "1. View Announcements" to read existing notices (shows date, poster, and content).
  - Choose "2. Add Announcement" to post a new notice (enter content, ends with Ctrl+D).
- **Notes**: All users can post; use for important lab updates.

#### 2. To Do's Lab Tasks
- **Purpose**: Manage personal tasks with deadlines and track completion.
- **How to Use**:
  - Select "2. To Do's lab tasks".
  - **Add Task**: Enter description and deadline (YYYY-MM-DD).
  - **View Tasks**: Lists all tasks with ID, description, deadline, and status.
  - **Delete Task**: View tasks, enter ID to remove.
  - **Mark Complete**: View tasks, enter ID to mark as done.
- **Notes**: Tasks are saved per user; deadlines help prioritize lab work.

#### 3. Code & Notes Vault
- **Purpose**: Store, search, and share code snippets, notes, and files; email them to others.
- **How to Use**:
  - Select "3. Code & Notes Vault".
  - **Add Note/Snippet**: Enter title and content (ends with Ctrl+D).
  - **View Notes**: Displays all notes with ID, title, and content.
  - **Search Notes**: Enter a term to find matching notes (searches title/content).
  - **Delete Note**: View notes, enter ID to remove.
  - **Upload Shared File**: Enter file path to upload to shared directory.
  - **Download Shared File**: List files, enter filename and destination path.
  - **List Shared Files**: Shows files in the shared directory.
  - **Email Note/File**: Choose to email to a student (enter last 4 digits) or teacher; select note by ID or file by path. Enter your email password when prompted.
- **Notes**: Code & notes vault with file sharing. Email functionality uses @diu.edu.bd domain; may require DIU IT admin approval for SMTP access. Contact IT support if email sending fails.

#### 4. Talk to Friends
- **Purpose**: Group chat with other lab users, view online users, and chat history.
- **How to Use**:
  - Select "4. Talk to friends".
  - **Join Group Chat**: Enter the server PC's IP and port (default 12345), connects, shows online users, type messages (type 'exit' to leave).
  - **View Chat History**: Shows last 20 messages from saved history.
- **Notes**: Requires chat server running; messages are broadcast to all online users.

#### 5. User Manual and Command Helper
- **Purpose**: Access help for the program and common OS commands.
- **How to Use**:
  - Select "5. User Manual and Command Helper".
  - **Command Help**: Choose a command number for details (1-20).
  - **User Manual**: Read this guide.
- **Notes**: Useful for learning OS commands relevant to lab work.

#### 6. Exit
- Select "6. Exit" to logout and close Lab-OS.

### Data Storage
- User data (tasks, notes) is stored in `data/` directory, per user.
- Shared data (announcements, files, chat history) in `data/`.
- Logs in `logs/`.

### Troubleshooting
- **Login Fails**: Check credentials (last 4 digits of student ID).
- **Chat Won't Connect**: Ensure server is running on designated PC; check network and entered IP/port.
- **File Upload/Download Issues**: Verify file paths and permissions.
- **Email Not Sending**: DIU uses Google Workspace, but app passwords may be disabled by admin. Contact DIU IT Support (itsupport@daffodilvarsity.edu.bd or Ext-156) to enable app passwords or get SMTP relay settings. For now, email functionality requires admin approval. Alternative: Use webmail interface for sending emails.
- **Server Errors**: Restart server; check port 12345 availability.
- **General**: Data files are text-based; edit manually if needed. Contact admin for network issues.

### Best Practices
- Save work regularly.
- Use meaningful titles for notes/tasks.
- Keep chat appropriate for lab environment.
- Logout after use.

### Support
For issues, check this manual or contact your lab instructor. The system is designed for simplicity and reliability in educational settings.

## Example Commands

- Login: Enter 1412 as user and pass for Asma Azmi Priya.
- Add task: In To Do's lab tasks, add "Finish assignment" with deadline 2025-12-31.
- Chat: Join group chat, enter server IP (e.g., 192.168.1.100) and port (12345), type messages; online users shown on join.
- Add note: In Code & Notes Vault, add a note with title and content.
- Upload file: In Code & Notes Vault, upload a file to shared directory.
- Email note: In Code & Notes Vault > Email Note/File > Email to Student, enter 1011, select note ID, enter your Gmail app password.

## Notes

- Chat history saved in `data/chat_history.txt`.
- User data stored in scripts.
- Modular design for easy extension.