#!/bin/bash

# This script mounts/umounts rclone remotes 
# mount-rclone-remotes.sh --mount --all
# mount-rclone-remotes.sh --umount --all
# mount-rclone-remotes.sh --mount <remote>
# mount-rclone-remotes.sh --umount <remote>

# variables
RCLONE_PATH=$(which rclone)
MANAGED_DIR="/tmp"
LIST_RCLONE="$RCLONE_PATH listremotes"

# list of remotes
REMOTES=("ifce" "ifceshared" "joao")


show_usage_missing_mount_name() {
	echo "Error! Missing mount name."
    echo "Usage: $0 --mount/--umount <mount_name> or $0 --mount/--umount --all"
    exit 1
}

case "$1" in
	"--list")
		echo "Available remotes:"
		eval "$LIST_RCLONE" 
		exit 0
	;;
    "--mount") 
        if [ "$2" == "--all" ]; then
            for remote in "${REMOTES[@]}"; do
				mkdir -p "$MANAGED_DIR/$remote"
                ($RCLONE_PATH mount $remote: "$MANAGED_DIR/$remote" --daemon >/dev/null 2>&1 &)
                sleep 1
                echo "Mounted remote $remote."
            done
        else
            [ -z "$2" ] && {
                show_usage_missing_mount_name && exit 1
            }
            [ ! -d "$MANAGED_DIR/$2" ] && mkdir -p "$MANAGED_DIR/$2"
            nohup $RCLONE_PATH mount $2: $MANAGED_DIR/$2 --daemon >/dev/null 2>&1 &
            echo "Mounted remote $2."
        fi
        ;; 
    "--umount") 
        if [ "$2" == "--all" ]; then
			for remote in "${REMOTES[@]}"; do
				fusermount -u "$MANAGED_DIR"/$remote && rm -rf "$MANAGED_DIR"/$remote 
				sleep 1
			done
			[ $? -eq 0 ] && echo "--> Success! Unmounted all remotes" || echo "--> Error! Not all remotes unmounted"
        else
            [ -z "$2" ] && {
                show_usage_missing_mount_name && exit 1
            }
            fusermount -u $MANAGED_DIR/$2 >/dev/null 2>&1 && rm -rf "$MANAGED_DIR/$2" >/dev/null 2>&1
            echo "Unmounted remote $2."
        fi
        ;; 
    *) 
        echo "-- Invalid option! Use 'mount', 'umount' or 'list'" 
        ;;
esac




