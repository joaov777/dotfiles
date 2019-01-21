
#!/bin/bash

  echo '### SEND SSH KEY TO REMOTE SERVER ###'
  echo '#(Keys are saved by default in stored in ~/.ssh/):'
  sleep 4 ; keyName=$(zenity --file-selection)
    read -p "Remote User: " remoteUser
    read -p "Remote Machine: " remoteMachine

  echo '#### OVERVIEW ####'
  echo "# Key Path: $keyName"
  echo "# Remote User: $remoteUser"
  echo "# Remote Machine: $remoteMachine"
  echo '##################'
  echo "PRESS ENTER TO CONTINUE"
    read -n 1 -s

  ssh-copy-id -i $keyName $remoteUser@$remoteMachine
