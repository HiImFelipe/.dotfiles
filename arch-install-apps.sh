#!/usr/bin/sh

cd ~

declare -A options=(
    [gaming]=0
    [work]=0
    [core]=0
    [all]=1
)

while getopts "h?gwca:" opt; do
    case "$opt" in
    h|\?)
        echo "Usage: $0 [-g] [-w] [-c]. Default behaviour is to get all packages"
        exit 0
        ;;
    g)  options[gaming]=1
        options[all]=0
        ;;
    w)  options[work]=1
        options[all]=0
        ;;
    c)  options[core]=1
        options[all]=0
        ;;
    a)  options[all]=1
        ;;
    esac
done

### Setup PARU (AUR)
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~

### Update system
paru -Syu

if [[ options[all] -eq 1 || options[work] -eq 1 ]]
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

if [[ options[all] -eq 1 || options[work] -eq 1 ]]
then
    echo "Installing work packages..."

    paru -S \
    discord \
    visual-studio-code-bin \
    docker \
    docker-compose \
    nvm

    flatpak install flathub \
    rest.insomnia.Insomnia \

    ### Setup Docker
    sudo systemctl start docker.service
    sudo systemctl enable docker.service
    sudo groupadd docker
    sudo usermod -aG docker $USER

    echo "Work packages installed successfully"
fi

if [[ options[all] -eq 1 || options[gaming] -eq 1 ]]
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

echo "Packages installed, proceed to setup the environment."