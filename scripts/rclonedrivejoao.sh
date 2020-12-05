#!/bin/bash

	[ -d /tmp/DRIVEJOAO ] && { 
		pkill rclone && fusermount -u /tmp/DRIVEJOAO 2>1 /dev/null
		rm -rf /tmp/DRIVEJOAO && notify-send "kdbx disabled"
	} || {
		mkdir /tmp/DRIVEJOAO && notify-send "kdbx enabled" && /usr/bin/rclone --vfs-cache-mode writes mount DRIVEJOAO:/ /tmp/DRIVEJOAO 
		pkill rclone && fusermount -u /tmp/DRIVEJOAO 2>1 /dev/null
		rm -rf /tmp/DRIVEJOAO
	}
	

