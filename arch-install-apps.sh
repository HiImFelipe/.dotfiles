#!/usr/bin/sh

### Instalation script for distros based on Arch Linux
cd ~

### Setup PARU (AUR)
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~

### Update system
paru -Syu

### Wine Dependency Hell
sudo pacman -S wine-staging winetricks
sudo pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox

### Download packages from AUR
paru -S \
linux-headers \
nvidia-dkms \
alacritty \
flatpak \
discord \
nvidia-settings \
steam \
qbittorrent \
winetricks \
visual-studio-code-bin \
docker \
docker-compose \
lutris \
google-chrome \
nvm \
yt-dlp

### Setup Docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER

### Download work packages from flatpak
flatpak install flathub \
com.github.tchx84.Flatseal \
rest.insomnia.Insomnia \
com.spotify.Client \
com.usebottles.bottles \
org.pipewire.Helvum \
com.github.GradienceTeam.Gradience \
com.mattjakeman.ExtensionManager

### Download gaming packages from flatpak
flatpak install flathub \
net.lutris.Lutris.Locale \
net.davidotek.pupgui2 \
re.chiaki.Chiaki \
net.pcsx2.PCSX2 \
dev.goats.xivlauncher \
com.heroicgameslauncher.hgl \
org.DolphinEmu.dolphin-emu \
org.prismlauncher.PrismLauncher
