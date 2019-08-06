#!/bin/bash

main_procedure(){

       file="config 00$n - $(date +%d-%m-%y) - $(date +%T).xml"

        scp -P 5555 joao.galvino@200.129.18.2:/cf/conf/config.xml ~/bkp/"$file"
        echo "config.xml downloaded!!!"
        rclone copy ~/bkp/"$file" coir:/Backups/Firewalls/Polo\ de\ Inovacao/Global
        echo "config.xml uploaded to Google Drive!!!"

}
   
    n=$(rclone ls coir:/Backups/Firewalls/Polo\ de\ Inovacao/Global | wc -l)
    if [ -d ~/bkp ]
    then
        main_procedure
    else
        mkdir ~/bkp
        main_procedure

        #scp -P 5555 joao.galvino@200.129.18.2:/cf/conf/config.xml ~/Documents/firewalls/polo/config$(ls -1 | wc -l).xml
    fi
    rm -rf ~/bkp
    