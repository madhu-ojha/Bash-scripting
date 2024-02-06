#!/bin/bash

# defining log file to analyze
LOG_FILE="/var/log/auth.log"
#LOG_FILE="$0"
# Function to display failed login attempts
failed_logins() {
    echo "Failed Login Attempts:"
    grep "authentication failure" "$LOG_FILE" | awk '{print $1, $2, $3, $9}'
}

# Function to display successful logins
successful_logins() {
    echo "Successful Logins:"
    grep "session opened" "$LOG_FILE" | awk '{print $1, $2, $3, $11}'
}

# Function to display user activity summary
user_activity_summary() {
    echo "User Activity Summary:"
    grep "session opened" "$LOG_FILE" | awk '{print $11}' | sort | uniq -c
}

# Function to display activity for a specific user
user_activity() {
    echo "Activity for User: $USERNAME"
    grep "session opened" "$LOG_FILE" | grep "$USERNAME" | awk '{print $1, $2, $3}'
}

# Parse command-line options
while getopts ":hf:sul:" opt; do
    case ${opt} in
        h)
            echo "Usage: $0 [-h] [-f] [-s] [-u] [-l <username>]"
            echo "Options:"
            echo "  -h  Display this help message"
            echo "  -f  Display failed login attempts"
            echo "  -s  Display successful logins"
            echo "  -u  Display user activity summary"
            echo "  -l  Display activity for a specific user"
            exit 0
            ;;
        f)
            failed_logins
            ;;
        s)
            successful_logins
            ;;
        u)
            user_activity_summary
            ;;
        l)
            USERNAME=$OPTARG
            user_activity
            ;;
        \?)
            echo "Invalid option: $OPTARG" 1>&2
            exit 1
            ;;
    esac
done
