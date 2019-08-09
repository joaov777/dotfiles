#!/bin/bash

# REQUIREMENTS FOR BETTER USAGE
# - Local account SSH keys properly set up in the target firewall (ssh-copy-id)
# - rclone target drive properly set up       

declare -A campus_keys
campus_keys['200.129.18.2']='Polo de Inovacao'
campus_keys['200.129.16.1']='Reitoria'

campus_list=(

    200.129.18.2 \
    200.129.16.1 \

)

main_procedure(){
    
for pkg in "${campus_list[@]}"; do
	clear
	echo "|==============|> PFSENSE XML BACKUP <|==============|"
    echo "|=====> Campus ${campus_keys["$pkg"]}"
    if ! [ -d ~/bkp ]; then mkdir ~/bkp ; fi

    mkdir ~/bkp/"${campus_keys["$pkg"]}"

    #checking campus remote folder existence
    if [[ $(rclone tree coir:/Backups/Firewalls | grep ${campus_keys["$pkg"]}) = "" ]]; 
        then rclone mkdir coir:/Backups/Firewalls/"${campus_keys["$pkg"]}"/Global
    fi

    n=$(rclone ls coir:/Backups/Firewalls/"${campus_keys["$pkg"]}"/Global/ | wc -l)
    file="config - ${campus_keys["$pkg"]} - 00$n - $(date +%d-%m-%y) - $(date +%T).xml"

    scp backup@$pkg:/cf/conf/config.xml ~/bkp/"${campus_keys["$pkg"]}"/"$file" > /dev/null
    echo "|===> config.xml downloaded!!!"
    rclone copy ~/bkp/"${campus_keys["$pkg"]}"/"$file" coir:/Backups/Firewalls/"${campus_keys["$pkg"]}"/Global
    echo "|===> config.xml uploaded to Google Drive!!!" ; sleep 2;
    

    done
    rm -rf ~/bkp
}
    main_procedure
    
    