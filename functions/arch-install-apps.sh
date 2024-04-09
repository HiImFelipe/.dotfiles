#!/usr/bin/sh

function install_apps() {
    # 1 - All
    # 2 - Core 
    # 3 - Work
    # 4 - Gaming

    install_options=("$@")

    ### Setup PARU (AUR Helper)

    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    
    cd ~
    paru -Syu

    if [[ install_options[1] -eq 1 || install_options[2] -eq 1 ]]
    then
        echo "Installing core packages..."

        paru -S \
        linux-headers \
        nvidia-dkms \
        alacritty \
        flatpak \
        discord \
        nvidia-settings \
        google-chrome \
        qbittorrent \
        visual-studio-code-bin \
        docker \
        docker-compose \
        lutris \
        nvm \
        yt-dlp

        flatpak install flathub \
        com.github.tchx84.Flatseal \
        com.spotify.Client \
        com.usebottles.bottles \
        org.pipewire.Helvum \
        com.github.GradienceTeam.Gradience \
        com.mattjakeman.ExtensionManager

        echo "Core packages installed successfully"
    fi

    if [[ install_options[1] -eq 1 || install_options[3] -eq 1 ]]
    then
        echo "Installing work packages..."

        paru -S \
        discord \
        visual-studio-code-bin \
        docker \
        docker-compose \
        nvm \
        github-cli

        flatpak install flathub \
        rest.insomnia.Insomnia \

        ### Setup Docker
        sudo systemctl start docker.service
        sudo systemctl enable docker.service
        sudo groupadd docker
        sudo usermod -aG docker $USER

        echo "Work packages installed successfully"
    fi

    if [[ install_options[1] -eq 1 || install_options[4] -eq 1 ]]
    then
        echo "Installing gaming packages..."

        ### Wine Dependency Hell

        sudo pacman -S \
        wine-staging \
        winetricks \
        giflib \
        lib32-giflib \
        libpng \
        lib32-libpng \
        libldap \
        lib32-libldap \
        gnutls \
        lib32-gnutls \
        mpg123 \
        lib32-mpg123 \
        openal \
        lib32-openal \
        v4l-utils \
        lib32-v4l-utils \
        libpulse \
        lib32-libpulse \
        alsa-plugins \
        lib32-alsa-plugins \
        alsa-lib \
        lib32-alsa-lib \
        libjpeg-turbo \
        lib32-libjpeg-turbo \
        libxcomposite \
        lib32-libxcomposite \
        libxinerama \
        lib32-libxinerama \
        ncurses \
        lib32-ncurses \
        opencl-icd-loader \
        lib32-opencl-icd-loader \
        libxslt lib32-libxslt \
        libva \
        lib32-libva \
        gtk3 \
        lib32-gtk3 \
        gst-plugins-base-libs \
        lib32-gst-plugins-base-libs \
        vulkan-icd-loader \
        lib32-vulkan-icd-loader \
        cups \
        samba \
        dosbox

        ### Gaming Software

        paru -S \
        steam \
        lutris

        flatpak install flathub \
        re.chiaki.Chiaki \
        net.pcsx2.PCSX2 \
        dev.goats.xivlauncher \
        com.heroicgameslauncher.hgl \
        org.DolphinEmu.dolphin-emu \
        org.prismlauncher.PrismLauncher

        echo "Gaming packages installed successfully"
    fi
}