#!/bin/bash
clear
set -e
# Games
gaming_menu() {
    clear
    echo "----- Games -----"
    echo "1) Install Heroic Games Launcher"
    echo "2) Install Wine + Proton-GE"
    echo "3) Install Steam"
    echo "4) Install Lutris"
    echo "5) Install PlayOnLinux"
    echo "6) Install RetroArch"
    echo "0) Back to Main Menu"
    echo "-------------------------"
    read -rp "Choose an option: " gaming_choice

    case "$gaming_choice" in
        1) install_heroic ;;
        2) install_wine_proton ;;
        3) install_steam ;;
        4) install_lutris ;;
        5) install_playonlinux ;;
        6) install_retroarch ;;
        0) return ;;
        *) echo "[!] Invalid option." ;;
    esac
}

# Music 
music_menu() {
    clear
    echo "----- Music -----"
    echo "1) Install Spotify"
    echo "2) Install SoundCloud"
    echo "3) Install YouTube Music"
    echo "4) Install Clementine"
    echo "5) Install Rhythmbox"
    echo "0) Back to Main Menu"
    echo "------------------------"
    read -rp "Choose an option: " music_choice

    case "$music_choice" in
        1) install_spotify ;;
        2) install_soundcloud ;;
        3) install_youtube_music ;;
        4) install_clementine ;;
        5) install_rhythmbox ;;
        0) return ;;
        *) echo "[!] Invalid option." ;;
    esac
}

# Update 
update_menu() {
    clear
    echo "----- Update -----"
    echo "1) Update System"
    echo "2) Clean Package Cache"
    echo "3) Install Available Updates"
    echo "0) Back to Main Menu"
    echo "------------------------"
    read -rp "Choose an option: " update_choice

    case "$update_choice" in
        1) sudo pacman -Syu ;;
        2) sudo pacman -Scc ;;
        3) sudo pacman -Syu --noconfirm ;;
        0) return ;;
        *) echo "[!] Invalid option." ;;
    esac
}

# Driver
driver_menu() {
    clear
    echo "----- Drivers -----"
    echo "1) Install AMD Drivers"
    echo "2) Install NVIDIA Drivers"
    echo "3) Install Intel Graphics Drivers"
    echo "0) Back to Main Menu"
    echo "------------------------"
    read -rp "Choose an option: " driver_choice

    case "$driver_choice" in
        1) install_amd_drivers ;;
        2) install_nvidia_drivers ;;
        3) install_intel_drivers ;;
        0) return ;;
        *) echo "[!] Invalid option." ;;
    esac
}

# Utilities 
utilities_menu() {
    clear
    echo "----- Utilities -----"
    echo "1) Install Git"
    echo "2) Install VSCode"
    echo "3) Install GParted"
    echo "4) Install Neofetch"
    echo "5) Install Terminator"
    echo "6) Install Htop"
    echo "0) Back to Main Menu"
    echo "------------------------"
    read -rp "Choose an option: " util_choice

    case "$util_choice" in
        1) install_git ;;
        2) install_vscode ;;
        3) install_gparted ;;
        4) install_neofetch ;;
        5) install_terminator ;;
        6) install_htop ;;
        0) return ;;
        *) echo "[!] Invalid option." ;;
    esac
}

# Code Editor things
code_editor_menu() {
    clear
    echo "----- Code Editors -----"
    echo "1) Install VSCode"
    echo "2) Install Sublime Text"
    echo "3) Install Atom"
    echo "4) Install IntelliJ IDEA"
    echo "0) Back to Main Menu"
    echo "----------------------------"
    read -rp "Choose an option: " editor_choice

    case "$editor_choice" in
        1) install_vscode ;;
        2) install_sublime ;;
        3) install_atom ;;
        4) install_intellij ;;
        0) return ;;
        *) echo "[!] Invalid option." ;;
    esac
}

# Communication Tools 
comm_menu() {
    clear
    echo "----- Communication Tools -----"
    echo "1) Install Discord"
    echo "2) Install Slack"
    echo "3) Install Teams"
    echo "4) Install Telegram"
    echo "5) Install Signal"
    echo "0) Back to Main Menu"
    echo "------------------------------"
    read -rp "Choose an option: " comm_choice

    case "$comm_choice" in
        1) install_discord ;;
        2) install_slack ;;
        3) install_teams ;;
        4) install_telegram ;;
        5) install_signal ;;
        0) return ;;
        *) echo "[!] Invalid option." ;;
    esac
}

# Main Menu
main_menu() {
    clear
    echo "----- Archy -----"
    echo "1) Games"
    echo "2) Music"
    echo "3) Update System"
    echo "4) Driver Setup"
    echo "5) Utilities"
    echo "6) Code Editors"
    echo "7) Communication Tools"
    echo "0) Exit"
    echo "---------------------"
    read -rp "Choose an option: " main_choice

    case "$main_choice" in
        1) gaming_menu ;;
        2) music_menu ;;
        3) update_menu ;;
        4) driver_menu ;;
        5) utilities_menu ;;
        6) code_editor_menu ;;
        7) comm_menu ;;
        0) exit 0 ;;
        *) echo "[!] Invalid option." ;;
    esac
}

# Install Helper Functions

# Install Heroic Games Launcher
install_heroic() {
    echo "[*] Installing Heroic Games Launcher..."
    flatpak install -y flathub com.heroicgameslauncher.hgl
}

# Install Wine + Proton-GE
install_wine_proton() {
    echo "[*] Installing Wine + Winetricks..."
    sudo pacman -S --needed --noconfirm wine winetricks
    echo "[*] Installing yay (AUR helper) for Proton-GE..."
    if ! command -v yay &> /dev/null; then
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    fi
    echo "[*] Installing Proton-GE..."
    yay -S --noconfirm proton-ge-custom
}

# Install Steam
install_steam() {
    echo "[*] Installing Steam..."
    sudo pacman -S --needed --noconfirm steam
}

# Install Lutris
install_lutris() {
    echo "[*] Installing Lutris..."
    sudo pacman -S --needed --noconfirm lutris
}

# Install PlayOnLinux
install_playonlinux() {
    echo "[*] Installing PlayOnLinux..."
    sudo pacman -S --needed --noconfirm playonlinux
}

# Install RetroArch
install_retroarch() {
    echo "[*] Installing RetroArch..."
    sudo pacman -S --needed --noconfirm retroarch
}

# Install Spotify
install_spotify() {
    echo "[*] Installing Spotify..."
    flatpak install -y flathub com.spotify.Client
}

# Install SoundCloud
install_soundcloud() {
    echo "[*] Installing SoundCloud..."
    flatpak install -y flathub com.soundcloud.SoundCloud
}

# Install YouTube Music
install_youtube_music() {
    echo "[*] Installing YouTube Music..."
    flatpak install -y flathub com.google.AndroidYouTubeMusic
}

# Install Clementine
install_clementine() {
    echo "[*] Installing Clementine..."
    sudo pacman -S --needed --noconfirm clementine
}

# Install Rhythmbox
install_rhythmbox() {
    echo "[*] Installing Rhythmbox..."
    sudo pacman -S --needed --noconfirm rhythmbox
}

# Install Git
install_git() {
    echo "[*] Installing Git..."
    sudo pacman -S --needed --noconfirm git
}

# Install VSCode
install_vscode() {
    echo "[*] Installing VSCode..."
    sudo pacman -S --needed --noconfirm visual-studio-code-bin
}

# Install GParted
install_gparted() {
    echo "[*] Installing GParted..."
    sudo pacman -S --needed --noconfirm gparted
}

# Install Neofetch
install_neofetch() {
    echo "[*] Installing Neofetch..."
    sudo pacman -S --needed --noconfirm neofetch
}

# Install Terminator
install_terminator() {
    echo "[*] Installing Terminator..."
    sudo pacman -S --needed --noconfirm terminator
}

# Install Htop
install_htop() {
    echo "[*] Installing Htop..."
    sudo pacman -S --needed --noconfirm htop
}

# Install Sublime Text
install_sublime() {
    echo "[*] Installing Sublime Text..."
    sudo pacman -S --needed --noconfirm sublime-text
}

# Install Atom
install_atom() {
    echo "[*] Installing Atom..."
    sudo pacman -S --needed --noconfirm atom
}

# Install IntelliJ IDEA
install_intellij() {
    echo "[*] Installing IntelliJ IDEA..."
    sudo pacman -S --needed --noconfirm intellij-idea-community-edition
}

#install signal
install_signal() {
    echo "[*] Installed signal..."
    sudo pacman -S --needed --noconfirm signal-desktop
}

# Install Discord
install_discord() {
    echo "[*] Installing Discord..."
    flatpak install -y flathub com.discordapp.Discord
}

# Install Slack
install_slack() {
    echo "[*] Installing Slack..."
    flatpak install -y flathub com.slack.Slack
}

# Install Teams
install_teams() {
    echo "[*] Installing Microsoft Teams..."
    flatpak install -y flathub com.microsoft.Teams
}

# Install Telegram
install_telegram() {
    echo "[*] Installing Telegram..."
    flatpak install -y flathub org.telegram.desktop
}

install_basic_dependencies() {
    echo "[*] Installing basic dependencies (git, base-devel, flatpak, corectrl, steam, lutris)..."
    sudo pacman -S --needed --noconfirm git base-devel flatpak corectrl steam lutris
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
clear
}


install_basic_dependencies 
while true; do
    main_menu
done
