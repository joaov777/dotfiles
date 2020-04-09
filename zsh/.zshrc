# Path to your oh-my-zsh installation.	
  export ZSH="/home/$USER/.oh-my-zsh"	
 
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes	
#ZSH_THEME="robbyrussell"	
ZSH_THEME="pi"	

export VISUAL="/usr/bin/vim"	
export EDITOR="$VISUAL"	

# Uncomment the following line to display red dots whilst waiting for completion.	
 COMPLETION_WAITING_DOTS="true"

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
  sdn(){sudo /sbin/shutdown -r now}	
  crd(){ssh -C $1@$2 -p $3 ncdu -o- / | ncdu -f-} #check remote disk	

  alias neofetch="neofetch --ascii_colors 15 15 5 8 9 0 --colors 15 8 15 15 15 8" 	
  alias pgpg="ping 8.8.8.8"	
  alias zshconfig="sudo vim ~/.zshrc"	
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

  alias wiki="~/wiki/wiki.sh"	
  alias env="sudo redshift -O 3000" #enabling night view	
  alias dnv="sudo redshift -x" #disabling night view	
  alias fkw="sudo rm ~/.config/KeeWeb/runtime-data.json"	
  alias wanwan="curl https://ipinfo.io/ip"	
  alias rn="sudo systemctl restart NetworkManager.service"	
  alias keyus="setxkbmap us intl"	
  alias keybr="setxkbmap -layout br -model abnt2"	
  alias sw="nmcli dev wifi list"	
  alias systeminfo="inxi -Fxz"	
  alias nicpon="sudo ip link set $1 promisc on" #enabling promiscuous mode (insert interface for parameter)	
  alias nicpoff="sudo ip link set $1 promisc off" #disabling promiscuous mode (insert interface for parameter) 	
  alias nicp="sudo ip link show $1" #checking promiscuous enabled or disabled (insert interface for parameter)	
  alias l="ls -liar"	
  ppp(){python3 $PWD/$1}	

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
  rclr(){rclone listremotes}	
  rcmo(){mkdir ~/Desktop/$1 ; xdg-open ~/Desktop/$1 ; rclone mount $1:/ ~/Desktop/$1 ; fusermount -uz $1 >/dev/null 2>&1 ; rm -rf ~/Desktop/$1}	

# NORD RELATED	
  nc(){nordvpn connect}	
  ncus(){nordvpn connect United_States}	
  nd(){nordvpn disconnect}	
  ns(){nordvpn status}	

# SCRIPTS	
  #alias dp="~/mainconf/scripts/downloadPackage.sh"	
  run(){$PWD/$1}	
  lesser(){less -N -I $1} #better alternative for cat 	
  dp(){trizen -S $1 --noconfirm}	
  rp(){sudo pacman -Rcnsu $1 --noconfirm} #Removing a package and its dependencies	
  ru(){sudo pacman -R $(pacman -Qdtq) --noconfirm} #Removing unnecessary dependencies	
  mkcd(){mkdir -pv "$1"; cd "$1"} #Creating folder (including parents) and entering the fresly created folder	
  sf(){sudo rsync -avz --progress "$1" "$2"} #syncfolder - syncs folder path 1 to folder path 2	
  alias sp="~/mainconf/scripts/searchPackage.sh"	
  hs(){history | grep $1} #search commands in history	
  ii(){pacman -Q $1} #checking whether a package is installed	
  ft(){timedatectl set-ntp true}	
  gitssh(){git remote set-url origin git@github.com:joaov777/$1} #set git remote for ssh	
  alias clip='xclip -selection clipboard'	
  alias sl="du -sh ./*"	
  alias ml="watch -n 1 'du -h --max-depth=0 ./*' --time"	
  alias sk="~/mainconf/scripts/sendSshKeysToServer.sh"	
  generatekeys(){ssh-keygen -t rsa -b 4096}	
  alias sg="~/mainconf/scripts/sudoGedit.sh"	
  alias md="~/mainconf/scripts/monitorDirectory.sh"	
  alias gitconfig="~/mainconf/scripts/gitGlobalConfig.sh"	
  alias ur="~/mainconf/scripts/updateRepository.sh"	
  alias cdmc="cd ~/mainconf"	
  alias mainconf="~/mainconf/mainconf.sh"	
  findip(){echo " -- IP FOUND: "$(sudo arp-scan $1 | grep $2 | cut -f 1)}	
  findmac(){echo "-- MAC FOUND: "$(sudo arp-scan $1 | sed -n '3p' | cut -f 2,3)}	
  zshzsh(){exec zsh}	
  cl(){clear}	
  alias brltousd="/home/joao/mainconf/scripts/brltousd.sh"	
  alias usdtobrl="/home/joao/mainconf/scripts/usdtobrl.sh"	
  alias dr="~/mainconf/scripts/dollarrate.sh"	

# UPDATES	
  alias um="sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu --noconfirm"	
  alias upup="sudo pacman -Syy --noconfirm && sudo pacman -Syu --noconfirm && sudo pacman -Syyu --noconfirm"	

# IFCE RELATED	
  alias sshlistas="ssh operador@listas.ifce.edu.br"	
  alias sshns1="ssh operador@ns1.ifce.edu.br"	
  alias sshnas="ssh nassuporte@nassuporte.ifce.edu.br"	
  alias sshnas2="ssh nassuporte2@nassuporte2.ifce.edu.br"	
  alias gcds="rdesktop -u 'adproducao.ifce.edu.br\Administrator' -g 1024x768 200.17.33.66"	
  alias rdprdp="~/mainconf/scripts/rdprdp.sh"	
  alias sshcentral="ssh root@10.4.5.10"	
  alias sshbaculadir="ssh operador@bacula-dir.ifce.edu.br"	
  alias sshvpn="ssh operador@200.17.33.43"
