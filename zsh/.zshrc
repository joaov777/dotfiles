#       ___      __ 
#      | \ \    / /   Joao Victor (joaov777)
#      | |\ \  / /    https://github.com/joaov777
#  _   | | \ \/ /   
# | |__| |  \  /    
#  \____/    \/     
#
#  ZSHRC Config file                  

#==========================> BEGINNING OF FILE

# Path to your oh-my-zsh installation.	
export ZSH="/home/$USER/.oh-my-zsh"	
 
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes	
#ZSH_THEME="robbyrussell"	
ZSH_THEME="pi"	
#ZSH_THEME="lambda"
#ZSH_THEME="sorin"
export VISUAL="/usr/bin/vim"	
export EDITOR="$VISUAL"	

# Would you like to use another custom folder than $ZSH/custom?	
# ZSH_CUSTOM=/path/to/new-custom-folder	

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*	
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/	
# Example format: plugins=(rails git textmate ruby lighthouse)	
plugins=(	git	zsh-autosuggestions	)	
source $ZSH/oh-my-zsh.sh	

# ALIASES AND FUNCTIONS
# SYSTEM GENERAL COMMANDS	
  rbn(){sudo /sbin/reboot}	
  sdn(){sudo /sbin/shutdown -h now}	
  crd(){ssh -C $1@$2 -p $3 ncdu -o- / | ncdu -f-} #check remote disk	

  alias pgpg="ping 8.8.8.8"	
  alias zc="vim ~/.zshrc"
  alias sz="source ~/.zshrc"
  alias rf="sudo rm -rf" #remove folder	
  alias ds="youtube-dl --extract-audio --audio-format mp3 $1 -o '~/Music/%(title)s.%(ext)s'"	
  alias sshdstart="sudo systemctl start sshd"	
  alias sshdenable="sudo systemctl enable sshd --now"	
  alias sshdstop="sudo systemctl stop sshd"	
  alias sshdstatus="sudo systemctl status sshd"	
  alias sshdrestart="sudo systemctl restart sshd"	
  alias sstart="sudo systemctl start $1"	
  alias sstop="sudo systemctl stop $1"	
  alias sstatus="sudo systemctl status $1"	
  alias srestart="sudo systemctl restart $1"	

  alias env="sudo redshift -O 3000" #enabling night view	
  alias dnv="sudo redshift -x" #disabling night view	
  alias fkw="sudo rm ~/.config/KeeWeb/runtime-data.json"
  alias gwl="/sbin/ip route | awk '/default/ { print $3 }'" #gateway lan
  alias gww="curl https://ipinfo.io/ip"	#gateway wan
  alias rn="sudo systemctl restart NetworkManager.service"	
  alias keyus="setxkbmap us intl"	
  alias keybr="setxkbmap -layout br -model abnt2"	
  alias sw="nmcli dev wifi list"
  alias cw="sudo wifi-menu"  
  alias systeminfo="inxi -Fxz"	
  alias l="ls -liar"
  alias bl="acpi -V" #check battery info  
  alias tt="~/mainconf/scripts/tilixthemechooser.sh"
  alias xp="~/mainconf/scripts/panel.sh" #xfce4 panel enable/disable

  alias .="cd .."	
  alias ..="cd ../../"	
  alias ...="cd ../../../"	
  alias ....="cd ../../../../"	
  alias .....="cd ../../../../../"	

# TMUX RELATED	
  tns(){tmux new -s $1 -d}	
  tas(){tmux attach -t $1}	
  tls(){tmux ls}	
  tks(){tmux kill-session -t $1}	

# RCLONE RELATED	
  rcl(){rclone listremotes}	
  rcm(){mkdir ~/Desktop/$1 ; xdg-open ~/Desktop/$1 ; rclone mount $1:/ ~/Desktop/$1 ; fusermount -uz $1 >/dev/null 2>&1 ; rm -rf ~/Desktop/$1}	

#EXA RELATED
  alias ls='exa -al --color=always --group-directories-first'
  alias la='exa -a --color=always --group-directories-first'  
  alias ll='exa -l --color=always --group-directories-first'  
  alias lt='exa -aT --color=always --group-directories-first'
  alias l.='exa -a | egrep "^\."'

# GIT RELATED
  alias grs="git remote set-url --add origin git@github.com:$1/$2.git" #set git remote for ssh	
  alias grh="git remote set-url --add origin https://github.com/$1/$2.git" #set git remote for http.
  alias gsr="git remote -v"
  alias gaa="git add ."
  alias ga="git add"
  alias gdf="git diff"
  alias gst="git status"
  alias gc="git commit -m $1"
  alias gpl="git pull"
  alias gps="git push origin master"
  gus(){git config --global user.name "$1" && git config --global user.email "$2" && git config --global core.editor vim}
  gpsm(){cd ~/mainconf && git add . && git commit -m "$1" && git push origin master && cd -} #git push mainconf
  gplm(){cd ~/mainconf && git pull && cd -} #git pull mainconf

# VPN RELATED	
  nc(){nordvpn connect}	
  ncus(){nordvpn connect United_States}	
  nd(){nordvpn disconnect}	
  ns(){nordvpn status}
  ifc(){/home/$USER/mainconf/scripts/ifc.sh $1}  

# FUNCTIONS 
  ppp(){python3 $PWD/$1}	
  run(){$PWD/$1} #run local script without ./	
  lesser(){less -N -I $1} #better alternative for cat 	
  dpt(){trizen -S $1 --noconfirm} #download package via trizen
  spt(){[[ $2 = "" ]] && trizen -Ss $1 || trizen -Ss $1 | grep $2} #search package	
  rpt(){trizen -R $1 --noconfirm} #remove package via trizen
  dpp(){sudo pacman -S $1} #download package via pacman
  spp(){sudo pacman -Ss $1}
  rpp(){sudo pacman -Rcnsu $1 --noconfirm} #Removing a package and its dependencies	 via pacman
  rup(){sudo pacman -R $(pacman -Qdtq) --noconfirm} #Removing unnecessary dependencies	
  mkcd(){mkdir -pv "$1"; cd "$1"} #Creating folder (including parents) and entering the freshly created folder	
  sf(){sudo rsync -avz --progress "$1" "$2"} #syncfolder - syncs folder path 1 to folder path 2	
  hs(){print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')} #search commands in history	
  ii(){pacman -Q $1} #checking whether a package is installed	
  ft(){timedatectl set-ntp true} #fix time
  sl(){du -sh ./*} #local folder and files sizes
  ml(){watch -n 1 'du -h --max-depth=0 ./*' --time} #local monitoring
  sk(){ssh-copy-id -i $1 $2} #send ssh keys to remote
  ck(){ssh-keygen -t rsa -b 4096} #create ssh keys locally
  pk(){cat ~/.ssh/id_rsa.pub}
  mf(){[ $1 != "" ] && watch --interval 1 du -sh $1 || watch --interval 1 du -sh $PWD/} #monitor remote or local folder
  mcpush(){cd ~/mainconf && git add . && git commit -m "$1" && git push origin master && cd -} ##pushing mainconf to git
  mcpull(){cd ~/mainconf && git pull && cd -}
  mp(){watch -n 1 inxi -t cm10} #monitoring 10 most active processes
  mn(){watch -n 1 inxi -Nni} #monitoring NICs
  mm(){watch -n 1 inxi -t m} #monitoring RAM
  sdp(){xrandr -q | grep " connected" | cut -d ' ' -f1} #show available displays
   
  alias cdmc="cd ~/mainconf"
  alias rdprdp="rdesktop -u $1 -p $2 -g 800x600 $3" #user, password and machine
  alias -g cc="| xclip -selection c" #copying whatever command output to the clipboard
  alias se='vim -o "$(rg --files | fzf -e)"' #fuzzy search for files
  alias seh='vim -o "$(rg --files --hidden | fzf -e)"' #fuzzy search for hidden files
  alias mainconf="~/mainconf/mainconf.sh"
  findip(){echo " -- IP FOUND: $(sudo arp-scan $1 | grep $2 | cut -f 1)"}	
  findmac(){echo "-- MAC FOUND: $(sudo arp-scan $1 | sed -n '3p' | cut -f 2,3)"}		
  cl(){clear}	
  alias btu="~/mainconf/scripts/brltousd.sh"
  alias setuptilda="~/mainconf/scripts/setuptilda.sh"
  alias utb="~/mainconf/scripts/usdtobrl.sh"	
  dr(){echo "DR: $(curl -s https://www.x-rates.com/table/\?from\=USD\&amount\=1 | grep ";to=BRL" | awk '{print $3}' | cut -c59-62)"} #check current dollar rate

# UPDATES	
  alias um="sudo pacman-mirrors -g"	
  alias upup="sudo pacman -Syyuu"	
  alias uk="sudo pacman -S manjaro-keyring"

  #uncomment below to enable starship
  #eval "$(starship init zsh)"





