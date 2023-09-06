#       ___      __ 
#      | \ \    / /   Joao Victor (joaov777)
#      | |\ \  / /    https://github.com/joaov777
#  _   | | \ \/ /     https://gitlab.com/joaov777
# | |__| |  \  /    
#  \____/    \/     
#
#  ZSHRC Config file 2                  

#==========================> BEGINNING OF FILE

# Jv dotfiles home folder
PROJECT_HOME="$HOME/dotfiles"
WALLPAPER_DIR="$HOME/repos/wallpapers/FULL HD/"
DOTFILES_SCRIPTS="$PROJECT_HOME/scripts"
SCRIPTS="$HOME/repos/scripts"

# Path to your oh-my-zsh installation.	
export ZSH="$HOME/.oh-my-zsh"	

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes	
#ZSH_THEME="robbyrussell"	
ZSH_THEME="pi"	
export VISUAL="/usr/bin/vim"	
export EDITOR="$VISUAL"	

# Would you like to use another custom folder than $ZSH/custom?	
# ZSH_CUSTOM=/path/to/new-custom-folder	

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*	
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/	
# Example format: plugins=(rails git textmate ruby lighthouse)	
plugins=( git zsh-syntax-highlighting zsh-autosuggestions zsh-completions )	
source $ZSH/oh-my-zsh.sh	

########### ALIASES AND FUNCTIONS ###########

#> Dotfiles
alias cddf="cd $PROJECT_HOME"
dotfiles(){$PROJECT_HOME/dotfiles.sh}

#> System
rbn(){sudo /sbin/reboot}	
sdn(){sudo /sbin/shutdown -h now}		

#> VMs with virtualbox
vmlist(){VBoxManage list vms}
vmon(){VBoxManage startvm $1 --type headless}
vmoff(){VBoxManage controlvm $1 poweroff}
vmlistsnap(){VBoxManage snapshot $1 list}
vmres(){VBoxManage snapshot $1 restore $2}
vmrescurrent(){VBoxManage snapshot $1 restorecurrent}
vmliston(){VBoxManage list runningvms}
vmtakesnap(){VBoxManage snapshot $1 take $2}
vmdelsnap(){VBoxManage snapshot $1 delete $2}

# SUAP
suaprestoredb(){$SCRIPTS/suap/useful-scripts/restoredb.sh} # database_name and dump file location
suaplistdb(){docker exec -it suapdb psql -U postgres -c "\l" }
suapcheckdb(){docker exec -it suap grep "'NAME': os.environ.get('DATABASE_NAME'," /suap/suap/settings.py} 
suapdeletedb(){docker exec -i suapdb psql --username postgres --dbname=postgres -c "DROP DATABASE IF EXISTS "$1" WITH (FORCE);"}
suapsetpasswordsto123(){$SCRIPTS/suap/useful-scripts/settings.sh "$1" && docker exec -i suap python /suap/manage.py set_passwords_to_123}
suapsetsettings(){$SCRIPTS/suap/useful-scripts/settings.sh "$1"}
suaphelp(){grep suap $HOME/.zshrc}

#> Misc
alias env="sudo redshift -P -O $1" #enabling night view	
alias dnv="sudo redshift -x" #disabling night view	
alias fkw="sudo rm ~/.config/KeeWeb/runtime-data.json"
alias ds="youtube-dl --extract-audio --audio-format mp3 $1 -o '~/Music/%(title)s.%(ext)s'"	
alias btu="$PROJECT_HOME/scripts/scripts/brltousd.sh"
alias utb="$PROJECT_HOME/scripts/scripts/usdtobrl.sh"	
dr(){echo "DR: $(curl -s https://www.x-rates.com/table/\?from\=USD\&amount\=1 | grep \";to=BRL\" | awk '{print $3}' | cut -c59-62)"} #check current dollar rate
sb(){sudo feh --bg-fill --randomize $WALLPAPER_DIR} # switch background randomly
cb(){feh $WALLPAPER_DIR} # choose background interactively
ft(){timedatectl set-ntp true} #fix time

#> System services
sk(){ssh-copy-id -i $1 $2} #send ssh keys to remote
ck(){ssh-keygen -t rsa -b 4096} #create ssh keys locally
pk(){cat ~/.ssh/id_rsa.pub}

#> Keyboard layout
alias keyus="setxkbmap us intl"	
alias keybr="setxkbmap -layout br -model abnt2"	

#> Networking and System settings
alias systeminfo="inxi -Fxz"	
alias gwl="/sbin/ip route | awk '/default/ { print $3 }'" #gateway lan
alias gww="curl https://ipinfo.io/ip"	#gateway wan
alias crd="ssh -C $1@$2 -p $3 ncdu -o- / | ncdu -f-" #check remote disk
sf(){sudo rsync -avz --progress "$1" "$2"} #syncfolder - syncs folder path 1 to folder path 2	
mp(){watch -n 1 inxi -t cm10} #monitoring 10 most active processes
mn(){watch -n 1 inxi -Nni} #monitoring NICs
mm(){watch -n 1 inxi -t m} #monitoring RAM
alias rdprdp="rdesktop -u $1 -p $2 -g 800x600 $3" #user, password and machine
alias sl="du -sh ./*" #local folder and files sizes
alias ml="watch -n 1 'du -h --max-depth=0 ./*' --time" #local monitoring

#> Navigation 
alias bl="acpi -V" #check battery info  
alias tt="$PROJECT_HOME/scripts/tilixthemechooser.sh"
alias .="cd .."	
alias ..="cd ../../"	
alias ...="cd ../../../"	
alias ....="cd ../../../../"	
alias .....="cd ../../../../../"
alias l="ls -liar"
alias lsc="exa --long --header --inode --git --group --created --modified --accessed" # complete
alias ls="exa -lg" # normal listing
alias l.="exa -a --color=always --group-directories-first" # hidden files and folders
alias ld='exa -lg --no-filesize --color=always --group-directories-first' # directories  
alias lt='exa -aT --color=always --group-directories-first' # listing trees 
lesser(){less -N -I $1} #better alternative for cat 	
mkcd(){mkdir -pv "$1"; cd "$1"} #Creating folder (including parents) and entering the freshly created folder
hs(){print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')} #search commands in history	
alias se='vim -o "$(rg --files | fzf -e)"' #fuzzy search for files
alias seh='vim -o "$(rg --files --hidden | fzf -e)"' #fuzzy search for hidden files
alias="clear"	

#> Tmux	
tns(){tmux new -s $1 -d}	
tas(){tmux attach -t $1}	
tls(){tmux ls}	
tks(){tmux kill-session -t $1}	

#> Rclone
rcl(){rclone listremotes}	
alias rc="$PROJECT_HOME/scripts/rclone.sh $1 $2"

# Git Github Gitlab
alias grs="git remote set-url --add origin git@github.com:$1/$2.git" #set git remote for ssh	
alias grh="git remote set-url --add origin https://github.com/$1/$2.git" #set git remote for http.
gus(){git config --global user.name "$1" && git config --global user.email "$2" && git config --global core.editor vim}

# VPN
nc(){nordvpn connect}	
ncus(){nordvpn connect United_States}	
nd(){nordvpn disconnect}	
ns(){nordvpn status}

#> Package managers
alias um="sudo pacman-mirrors -g" # update mirrors	
alias upman="sudo pacman -Syyuu" # overall pacman update
alias upyay="yay -Qua | xargs yay -Syu --aur" # overall yay AUR helper update
alias uk="sudo pacman -S manjaro-keyring" # update keyring
rpp(){sudo pacman -Rcnsu $1 --noconfirm} # removing a package and its dependencies	 via pacman
rup(){sudo pacman -R $(pacman -Qdtq) --noconfirm} # removing unnecessary dependencies	
ii(){pacman -Q $1} # checking whether a package is installed	