#!/usr/bin/env bash
set -euo pipefail  # Exit on error, unset vars, and pipeline errors

# --- Configuration ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$SCRIPT_DIR/.."
USERNAME="$(whoami)"
LOG_FILE="$PARENT_DIR/install.log"

# --- Error Handling Functions ---
die() {
    echo -e "\033[1;31mERROR: $*\033[0m" >&2
    exit 1
}

check_dependencies() {
    [[ -f "$PARENT_DIR/scripts/menus.sh" && -f "$PARENT_DIR/scripts/functions.sh" ]] ||
        die "Required script files missing"
    
    command -v pacman >/dev/null 2>&1 || die "Must run on an Arch-based system"
}

# --- Package Management Functions ---
install_yay() {
    if ! command -v yay >/dev/null 2>&1; then
        echo "|--> Installing yay helper..."
        "$PARENT_DIR/scripts/install_yay_helper" || die "Failed to install yay"
    else
        echo "|--> Yay already installed"
    fi
}

install_packages() {
    local packages=(
        # Core System
        conf i3 xorg-server xorg-apps xorg-xrandr arandr \
        networkmanager-dmenu-git netctl nm-connection-editor autorandr \
        bind-tools dnsutils net-tools inxi htop ncdu mtr tcpdump nmap \
        arp-scan iw openssh sshfs rdesktop docker docker-compose geoclue \
        nordvpn-bin openvpn

        # Audio & Bluetooth (PipeWire)
        pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber pipewire-audio \
        libldac libfreeaptx libspa-bluetooth alsa-utils alsa-plugins alsa-lib \
        bluez bluez-libs bluez-utils blueman pavucontrol

        # GUI & Desktop
        rofi dmenu polybar i3status py3status trayer nitrogen picom feh \
        xfce4-notifyd xfce4-power-manager lxappearance \
        papirus-icon-theme papirus-folders-git siji-git \
        nerd-fonts-fira-code ttf-font-awesome ttf-font-awesome-5 \
        ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation \
        otf-fira-mono ttf-droid ttf-inconsolata ttf-roboto terminus-font \
        noto-fonts ttf-unifont otf-font-awesome

        # Applications
        thunar ranger vifm flameshot peek tilix xournalpp zathura zathura-pdf-mupdf \
        okular viewnior gparted imagewriter gsimplecal copyq keepassxc \
        telegram-desktop discord spotify-launcher vlc \
        gedit notepadqq visual-studio-code-bin pdfarranger xclip wget tmux fzf tldr exa rclone

        # Utilities
        brightnessctl pacman-contrib acpi dialog pwgen i3lock i3lock-fancy-git \
        ntfs-3g gvfs libsecret gnome-keyring xdg-utils redshift neofetch veracrypt

        # Development
        git vim python python-pip nodejs npm go rust

        # Optional Tools
        qpwgraph helvum python-pywal python-requests libnotify jq
    )

    echo "|--> Installing packages..."
    for pkg in "${packages[@]}"; do
        if ! pacman -Qi "$pkg" &>/dev/null; then
            echo "|--> Installing $pkg..."
            yay -S "$pkg" --noconfirm --needed || echo "|--> Warning: Failed to install $pkg"
        fi
    done
}

# --- Post-Installation Setup ---
configure_system() {
    echo "|--> Configuring Papirus folders..."
    command -v papirus-folders >/dev/null && papirus-folders -C white

    echo "|--> Enabling NordVPN..."
    sudo systemctl enable --now nordvpnd || echo "|--> NordVPN enable failed"

    echo "|--> Configuring Bluetooth..."
    sudo systemctl enable --now bluetooth.service || echo "|--> Bluetooth enable failed"

    echo "|--> Setting up Docker..."
    sudo usermod -aG docker "$USERNAME" || echo "|--> Docker group config failed"

    echo "|--> Updating crontab..."
    (crontab -l 2>/dev/null | grep -v "mount-rclone-remotes";
     echo "@reboot $HOME/dotfiles/scripts/mount-rclone-remotes.sh --mount --all >/dev/null 2>&1") | crontab -
}

# --- Main Execution ---
main() {
    check_dependencies
    source "$PARENT_DIR/scripts/menus.sh"
    source "$PARENT_DIR/scripts/functions.sh"

    exec > >(tee -a "$LOG_FILE") 2>&1  # Log all output

    install_yay
    install_packages
    configure_system

    echo -e "\n\033[1;32mInstallation complete!\033[0m"
    echo "|--> You should reboot to apply all changes"
}

main "$@"
