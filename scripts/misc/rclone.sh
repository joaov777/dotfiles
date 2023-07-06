#!/bin/bash

MANAGED_DIR="/tmp"
MOUNT_RCLONE="nohup rclone mount $2: /tmp/$2 --daemon >/dev/null 2>&1 &"
UMOUNT_RCLONE="fusermount -u $MANAGED_DIR/$2"
LIST_RCLONE="rclone listremotes"

[ "$1" == "list" ] && eval $LIST_RCLONE && exit 0

[ -z "$2" ] && {
	echo "Error! Missing mount name."
	echo "Usage: ./rclone.sh mount/umount <mount_name>"
	exit 1
}

[ ! -d "$MANAGED_DIR"/$2 ] && mkdir "$MANAGED_DIR"/$2

case "$1" in 
	"mount") eval $MOUNT_RCLONE && ln -sf /tmp/"$2" /home/"$USER"/"$2";;
	"umount") eval $UMOUNT_RCLONE && unlink /home/"$USER"/"$2" ;;
	*) echo "-- Invalid option! Use 'mount' or 'umount'" ;;
esac
