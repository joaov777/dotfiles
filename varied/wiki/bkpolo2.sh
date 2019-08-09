#!/bin/bash

# REQUIREMENTS FOR BETTER USAGE
# - Local account SSH keys properly set up in the target firewall (ssh-copy-id)
# - rclone target drive properly set up       

declare -A campus_keys
campus_keys['200.129.18.2']='Polo de Inovacao'
campus_keys['200.129.16.1']='reitoria'
campus_keys['200.129.25.144']='horizonte'

campus_list=(

    200.129.18.2 
    #200.129.16.1 \
    #200.129.25.144 

)

main_procedure(){

for pkg in "${campus_list[@]}"; do
	clear
	echo "|==============|> PFSENSE XML BACKUP <|==============|"
    if ! [ -d ~/bkp ]; then mkdir ~/bkp ; fi

    n=$(rclone ls coir:/Backups/Firewalls/"${campus_keys["$pkg"]}"/Global/ | wc -l)
    file="config 00$n - $(date +%d-%m-%y) - $(date +%T).xml"

    scp -P 5555 backup@$pkg:/cf/conf/config.xml ~/bkp/"$file" > /dev/null
    echo "|> config.xml downloaded!!!"
    rclone copy ~/bkp/"$file" coir:/Backups/Firewalls/"${campus_keys["$pkg"]}"/Global
    echo "|> config.xml uploaded to Google Drive!!!" 
    rm -rf ~/bkp

    done
}
    main_procedure
    