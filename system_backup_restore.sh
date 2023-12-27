#!/bin/bash
# Script to automate Kali Linux system maintenance tasks
# Perform system backup (adjust destination directory as needed)
backup_directory=/home/kali/Desktop
backup_filename="backup_$(date +"%Y%m%d_%H%M%S").tar.gz"
echo "Performing system backup..."
tar czf "$backup_directory/$backup_filename" --directory=/ --exclude=proc --exclude=sys --exclude=dev/pts --exclude=backups .

# Restore system from backup (uncomment and modify as needed)
echo "Restoring system from backup..."
tar xzf "$backup_directory/$backup_filename" -C /
echo "System maintenance completed."