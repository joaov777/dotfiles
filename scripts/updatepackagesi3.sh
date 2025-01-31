#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# --- Configuration ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
USERNAME=${SUDO_USER:-$(whoami)}
LOG_DIR="/var/log/dotfiles"
LOG_DATE="$(date +'%Y.%m.%d')"
LOG_FILE="${LOG_DIR}/${LOG_DATE}-${USERNAME}.log"

# --- Color Definitions ---
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

# --- Error Handling ---
die() {
    echo -e "${RED}ERROR: $*${NC}" >&2
    exit 1
}

# --- Log Directory Setup ---
setup_logging() {
    echo -e "${BLUE}|--> Setting up system logging...${NC}"
    sudo mkdir -p "$LOG_DIR" || die "Failed to create log directory"
    sudo chmod 755 "$LOG_DIR"
    sudo touch "$LOG_FILE"
    sudo chmod 644 "$LOG_FILE"
}

# --- Dependency Checks ---
check_dependencies() {
    local required_commands=(pacman sudo git)
    local missing=()

    for cmd in "${required_commands[@]}"; do
        command -v "$cmd" >/dev/null 2>&1 || missing+=("$cmd")
    done

    ((${#missing[@]})) && die "Missing required commands: ${missing[*]}"
    
    # Corrected path check (no extra "scripts" subdirectory needed)
    [[ -f "$SCRIPT_DIR/menus.sh" && -f "$SCRIPT_DIR/functions.sh" ]] ||
        die "Required script files missing from $SCRIPT_DIR"
}

# --- Package Installation ---
install_yay() {
    if ! command -v yay >/dev/null 2>&1; then
        echo -e "${BLUE}|--> Installing yay helper...${NC}"
        sudo -u "$USERNAME" git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
        (cd /tmp/yay-bin && sudo -u "$USERNAME" makepkg -si --noconfirm --needed) || die "Failed to install yay"
        rm -rf /tmp/yay-bin
    else
        echo -e "${GREEN}|--> Yay already installed${NC}"
    fi
}

install_packages() {
    local packages=(
        # Core System
        base-devel linux-headers iwd networkmanager
        xorg-server xorg-xrandr xorg-xinit arandr
        docker docker-compose geoclue openssh

        # PipeWire Audio Stack
        pipewire pipewire-alsa pipewire-pulse pipewire-jack
        wireplumber pipewire-audio libldac libfreeaptx
        alsa-utils alsa-plugins pavucontrol

        # Bluetooth
        bluez bluez-utils blueman libspa-bluetooth

        # i3 Essentials
        i3-gaps i3status i3lock i3lock-fancy-git
        rofi dmenu polybar py3status picom feh
        nitrogen xfce4-notifyd xfce4-power-manager

        # Applications
        thunar ranger vifm flameshot tilix
        zathura zathura-pdf-mupdb okular viewnior
        telegram-desktop discord spotify-launcher
        visual-studio-code-bin neovim firefox

        # Utilities
        brightnessctl pacman-contrib acpi dialog
        ntfs-3g gvfs libsecret gnome-keyring
        redshift neofetch exa fzf rclone

        # Fonts & Themes
        ttf-fira-code ttf-font-awesome ttf-nerd-fonts-symbols
        papirus-icon-theme papirus-folders-git
        noto-fonts ttf-dejavu ttf-liberation
    )

    echo -e "${BLUE}|--> Installing packages...${NC}"
    for pkg in "${packages[@]}"; do
        if ! pacman -Qi "$pkg" &>/dev/null; then
            echo -e "${YELLOW}|--> Installing $pkg...${NC}"
            yay -S "$pkg" --noconfirm --needed || echo -e "${RED}|--> Warning: Failed to install $pkg${NC}"
        else
            echo -e "${GREEN}|--> $pkg already installed${NC}"
        fi
    done
}

# --- Post-Install Setup ---
configure_services() {
    local services=(
        NetworkManager
        bluetooth
        docker
    )

    echo -e "${BLUE}|--> Configuring services...${NC}"
    for service in "${services[@]}"; do
        if ! sudo systemctl is-enabled "$service" &>/dev/null; then
            sudo systemctl enable "$service" --now || echo -e "${RED}|--> Failed to enable $service${NC}"
        else
            echo -e "${GREEN}|--> $service already enabled${NC}"
        fi
    done

    # Configure PipeWire user services
    if [[ ! -d "$HOME/.config/systemd/user" ]]; then
        mkdir -p "$HOME/.config/systemd/user"
    fi
    systemctl --user enable pipewire pipewire-pulse wireplumber --now
}

configure_user() {
    echo -e "${BLUE}|--> Configuring user environment...${NC}"
    sudo usermod -aG docker,input,video "$USERNAME"
    
    # Font configuration
    if [[ ! -f /etc/fonts/conf.d/70-no-bitmaps.conf ]]; then
        sudo ln -sf /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
        sudo fc-cache -fv
    fi

    # Papirus folders theme
    if command -v papirus-folders >/dev/null; then
        papirus-folders -C blue --theme Papirus-Dark
    fi
}

# --- Main Execution ---
main() {
    setup_logging
    check_dependencies
    source "$SCRIPT_DIR/menus.sh"
    source "$SCRIPT_DIR/functions.sh"

    # Start logging with system-wide permissions
    exec > >(sudo tee -a "$LOG_FILE") 2>&1

    echo -e "${GREEN}\n=== Starting System Setup ===${NC}"
    install_yay
    install_packages
    configure_services
    configure_user

    echo -e "${GREEN}\n=== Audio Configuration ===${NC}"
    echo -e "${YELLOW}1. Remove PulseAudio (recommended):"
    echo -e "   sudo pacman -Rns pulseaudio pulseaudio-{alsa,bluetooth}"
    echo -e "2. Verify audio stack:"
    echo -e "   pactl info | grep 'Server Name'${NC}"

    echo -e "${GREEN}\n=== Installation Complete! ===${NC}"
    echo -e "Reboot your system to apply all changes\n"
    echo -e "Log file location: ${BLUE}$LOG_FILE${NC}"
}

main "$@"