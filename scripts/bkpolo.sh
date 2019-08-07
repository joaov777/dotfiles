#!/bin/bash

main_procedure(){

    n=$(rclone ls coir:/Backups/Firewalls/Polo\ de\ Inovacao/Global | wc -l)
    if ! [ -d ~/bkp ]; then mkdir ~/bkp ; fi

    file="config 00$n - $(date +%d-%m-%y) - $(date +%T).xml"

    scp -P 5555 joao.galvino@200.129.18.2:/cf/conf/config.xml ~/bkp/"$file" > /dev/null
    echo "|> config.xml downloaded!!!"
    rclone copy ~/bkp/"$file" coir:/Backups/Firewalls/Polo\ de\ Inovacao/Global
    echo "|> config.xml uploaded to Google Drive!!!" ;
    rm -rf ~/bkp

}

    echo "|>> Pfsense - config.xml backup <<|"
    main_procedure
    