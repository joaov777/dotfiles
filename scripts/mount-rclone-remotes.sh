#!/bin/bash

# This script mounts rclone remotes automatically 
# mount-rclone-remotes.sh mount --all
#

# # Define the list of remotes
# REMOTES=("remote1" "remote2" "remote3")

# # Mount each remote
# for remote in "${REMOTES[@]}"; do
#     $RCLONE_PATH mount $remote: /path/to/mount/point/$remote &
# done

RCLONE_PATH=$(which rclone)
MANAGED_DIR="/tmp"
LIST_RCLONE="$RCLONE_PATH listremotes"

# Save the list of remotes as an array
REMOTES=("ifce" "ifceshared" "joao")


[ "$1" == "list" ] && { 
    echo "Available remotes:"
    eval "$LIST_RCLONE" 
    exit 0
}

case "$1" in
    "mount") 
        if [ "$2" == "--all" ]; then
            for remote in "${REMOTES[@]}"; do
				mkdir -p "$MANAGED_DIR/$remote"
                ($RCLONE_PATH mount $remote: "$MANAGED_DIR/$remote" --daemon >/dev/null 2>&1 &)
                sleep 1
                echo "Mounted remote $remote."
            done
        else
            [ -z "$2" ] && {
                echo "Error! Missing mount name."
                echo "Usage: $0 mount/umount <mount_name> or $0 mount --all"
                exit 1
            }
            [ ! -d "$MANAGED_DIR/$2" ] && mkdir -p "$MANAGED_DIR/$2"
            nohup $RCLONE_PATH mount $2: $MANAGED_DIR/$2 --daemon >/dev/null 2>&1 &
            echo "Mounted remote $2."
        fi
        ;; 
    "umount") 
        if [ "$2" == "--all" ]; then
			for remote in "${REMOTES[@]}"; do
				fusermount -u "$MANAGED_DIR"/$remote && rm -rf "$MANAGED_DIR"/$remote
            	echo "Unmounted all remotes."
			done
        else
            [ -z "$2" ] && {
                echo "Error! Missing mount name."
                echo "Usage: $0 mount/umount <mount_name> or $0 umount --all"
                exit 1
            }
            fusermount -u $MANAGED_DIR/$2 && rm -rf "$MANAGED_DIR/$2"
            echo "Unmounted remote $2."
        fi
        ;; 
    *) 
        echo "-- Invalid option! Use 'mount' or 'umount'" 
        ;;
esac




