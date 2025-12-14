#!/bin/bash

# Lab-OS To-Do Manager

TASK_FILE="data/tasks_$LOGGED_USER.txt"

todo_menu() {
    while true; do
        echo
        echo "To-Do / Task Manager"
        echo "1. Add Task"
        echo "2. View Tasks"
        echo "3. Delete Task"
        echo "4. Mark Task Complete"
        echo "5. Back to Main Menu"
        read -p "Choose an option: " choice

        case $choice in
            1) add_task ;;
            2) view_tasks ;;
            3) delete_task ;;
            4) mark_complete ;;
            5) return ;;
            *) echo "Invalid option." ;;
        esac
    done
}

add_task() {
    read -p "Enter task description: " task
    read -p "Enter deadline (YYYY-MM-DD): " deadline
    if [ ! -f "$TASK_FILE" ]; then
        touch "$TASK_FILE"
    fi
    id=$(($(wc -l < "$TASK_FILE") + 1))
    echo "$id:$task:$deadline:0" >> "$TASK_FILE"
    echo "Task added."
}

view_tasks() {
    if [ ! -f "$TASK_FILE" ] || [ ! -s "$TASK_FILE" ]; then
        echo "No tasks found."
        return
    fi
    echo "ID | Task | Deadline | Completed"
    while IFS=: read -r id task deadline comp; do
        status="No"
        if [ "$comp" -eq 1 ]; then
            status="Yes"
        fi
        echo "$id | $task | $deadline | $status"
    done < "$TASK_FILE"
}

delete_task() {
    view_tasks
    read -p "Enter task ID to delete: " id
    if grep -q "^$id:" "$TASK_FILE"; then
        sed -i "/^$id:/d" "$TASK_FILE"
        echo "Task deleted."
    else
        echo "Task not found."
    fi
}

mark_complete() {
    view_tasks
    read -p "Enter task ID to mark complete: " id
    if grep -q "^$id:" "$TASK_FILE"; then
        sed -i "s/^$id:\([^:]*\):\([^:]*\):0$/$id:\1:\2:1/" "$TASK_FILE"
        echo "Task marked complete."
    else
        echo "Task not found."
    fi
}