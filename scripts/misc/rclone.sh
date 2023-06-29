#!/bin/bash

MANAGED_DIR="/tmp"
MOUNT_RCLONE="$(nohup rclone mount $1: /tmp/$1 --daemon >/dev/null 2>&1 &)"
UMOUNT_RCLONE="$(fusermount -u /tmp/$1)"
LIST_RCLONE="$(rclone listremotes)"

[ ! -d "$MANAGED_DIR"/$1 ] && mkdir "$MANAGED_DIR"/$1

case "$2" in 
	"mount") $MOUNT_RCLONE ;;
	"umount") $UMOUNT_RCLONE ;;
	*) echo "-- Invalid option! Use 'mount' or 'umount'" ;;
esac
