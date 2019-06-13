# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/joao/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases 
# alias ohmyzsh="mate ~/.oh-my-zsh"
  
# SYSTEM GENERAL COMMANDS
  alias rbn="sudo reboot now"
  alias sdn="sudo shutdown now"
  alias pgpg="ping 8.8.8.8"
  alias zshconfig="sudo vim ~/.zshrc"
  alias rf="sudo rm -r $1" #remove folder
  alias lsc="exa --long --tree --all $1"
  alias lst="exa --long --tree $1"
  alias lsb="exa --long --all $1"
  alias ds="youtube-dl --extract-audio --audio-format mp3 $1"
  alias sshdstart="sudo systemctl start sshd"
  alias sshdstop="sudo systemctl stop sshd"
  alias sshdstatus="sudo systemctl status sshd"
  alias sshdrestart="sudo systemctl restart sshd"
  alias env="sudo redshift -O 3000" #enabling night view
  alias dnv="sudo redshift -x" #disabling night view
  alias fkw="sudo rm ~/.config/KeeWeb/runtime-data.json"
  alias wanwan="curl https://ipinfo.io/ip"
  alias rn="sudo systemctl restart NetworkManager.service"
  alias keyus="sudo kbctl -l us"
  alias keybr="sudo kbctl -l br"
  alias sw="nmcli dev wifi list"
  alias systeminfo="inxi -Fxz"

  alias .="cd .."
  alias ..="cd ../../"
  alias ...="cd ../../../"
  alias ....="cd ../../../../"
  alias .....="cd ../../../../../"

# APP SETTINGS

# SCRIPTS
  alias dp="~/mainconf/scripts/downloadPackage.sh"
  alias rp="sudo pacman -Rsu $1 --noconfirm" #Removing a package and its dependencies
  alias ru="sudo pacman -R $(pacman -Qdtq) --noconfirm" #Removing unnecessary dependencies
  alias sp="~/mainconf/scripts/searchPackage.sh"
  alias gk="~/mainconf/scripts/generateSshKeys.sh"
  alias sk="~/mainconf/scripts/sendSshKeysToServer.sh"
  alias sg="~/mainconf/scripts/sudoGedit.sh"
  alias sv="~/mainconf/scripts/sudoVim.sh"
  alias md="~/mainconf/scripts/monitorDirectory.sh"
  alias gitconfig="~/mainconf/scripts/gitGlobalConfig.sh"
  alias ur="~/mainconf/scripts/updateRepository.sh"
  alias svms="sudo vim ~/mainconf/mainconf.sh"
  alias msms="~/mainconf/mainconf.sh"
  alias findip="~/mainconf/scripts/findip.sh"
  alias findmac="~/mainconf/scripts/findmac.sh"
  alias hothot="~/mainconf/scripts/createhotspot.sh"

# UPDATES
  alias um="sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu --noconfirm"
  alias upup="sudo pacman -Syy --noconfirm && sudo pacman -Syu --noconfirm && sudo pacman -Syyu --noconfirm"

# IFCE RELATED
  alias sshlistas="ssh operador@listas.ifce.edu.br"
  alias sshnas="ssh nassuporte@nassuporte.ifce.edu.br"
  alias sshnas2="ssh nassuporte2@nassuporte2.ifce.edu.br"
  alias gcds="rdesktop -u 'adproducao.ifce.edu.br\Administrator' -g 1024x768 200.17.33.66"
  alias rdprdp="~/mainconf/scripts/rdprdp.sh"

  
