#!/bin/bash

# Define the log file path
log_file="system_monitor.log"

monitor_system() {
    echo "Monitoring system CPU and memory usage..."
    echo "Timestamp            CPU (%)    Memory (MB)" >> "$log_file"
    
    # Infinite loop to monitor every 5 seconds
    while true; do
        # Get current timestamp
        timestamp=$(date +"%Y-%m-%d %H:%M:%S")

        # Get CPU usage (percentage)
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

        # Get memory usage (in MB)
        memory_usage=$(free -m | awk '/Mem/{print $3}')

        # Write to log file
        echo "$timestamp        $cpu_usage%        $memory_usage MB" >> "$log_file"

        # Wait for 5 seconds
        sleep 5
    done
}

# Call the main function
monitor_system
