#!/bin/bash

# REQUIREMENTS FOR BETTER USAGE
# - Local account SSH keys properly set up in the target firewall (ssh-copy-id)
# - rclone target drive properly set up       

declare -A campus_keys
campus_keys['192.168.0.111']='ubuntu111'
campus_keys['192.168.0.106']='ubuntu106'

campus_list=(

    192.168.0.111 \
    192.168.0.106 \

)

main_procedure(){
    
for pkg in "${campus_list[@]}"; do
	clear
	echo "|==============|> PFSENSE XML BACKUP <|==============|"
    echo "|=====> Campus ${campus_keys["$pkg"]}"
    if ! [ -d ~/bkp ]; then mkdir ~/bkp ; fi

    mkdir ~/bkp/"${campus_keys["$pkg"]}"

    #checking campus remote folder existence
    if [[ $(rclone tree joaov777:/Variados/teste | grep ${campus_keys["$pkg"]}) = "" ]]; 
        then rclone mkdir joaov777:/Variados/teste/"${campus_keys["$pkg"]}"/Global
    fi

    n=$(rclone ls joaov777:/Variados/teste/"${campus_keys["$pkg"]}"/Global/ | wc -l)
    file="config - ${campus_keys["$pkg"]} - 00$n - $(date +%d-%m-%y) - $(date +%T).xml"

    scp joao@$pkg:/home/joao/config.txt ~/bkp/"${campus_keys["$pkg"]}"/"$file" > /dev/null
    echo "|===> config.xml downloaded!!!"
    rclone copy ~/bkp/"${campus_keys["$pkg"]}"/"$file" joaov777:/Variados/teste/"${campus_keys["$pkg"]}"/Global
    echo "|===> config.xml uploaded to Google Drive!!!" ; sleep 2;
    

    done
    rm -rf ~/bkp
}
    main_procedure
    
    