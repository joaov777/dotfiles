#!/bin/bash

main_procedure(){

        scp -P 5555 joao.galvino@200.129.18.2:/cf/conf/config.xml ~/bkp/config$n-$(date +%d-%m-%y).xml
        echo "config.xml downloaded!!!"
        rclone copy ~/bkp/config$n-$(date +%d-%m-%y).xml coir:/Backups/Firewalls/Polo\ de\ Inovacao/Global
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
    