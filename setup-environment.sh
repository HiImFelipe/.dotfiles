#!/usr/bin/sh

### Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
rm ~/.zshrc
rm ~/.bashrc

### Setup dotfiles
git clone --recurse-submodules https://github.com/FelipeSSDev/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

### Setup NerdFonts
mkdir -p ~/.fonts

wget -O /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip &&
unzip /tmp/JetBrainsMono.zip -d ~/.fonts/JetBrainsMono

### Setup GNOME
mkdir -p ~/.themes

git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
./install.sh
./install.sh -l
cd ~

wget -O /tmp/adw-gtk3v4-2.tar.xz https://github.com/lassekongo83/adw-gtk3/releases/download/v4.2/adw-gtk3v4-2.tar.xz &&
tar -xvf /tmp/adw-gtk3v4-2.tar.xz -C ~/.themes

git clone https://github.com/vinceliuice/Tela-circle-icon-theme /tmp/Tela-circle-icon-theme
bash -C /tmp/Tela-circle-icon-theme/install.sh -a

gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

## Theme fixes
paru -S stylepak-git
flatpak override --user --filesystem=xdg-config/gtk-4.0

### Setup VSCode
paru -S visual-studio-code-bin
ln -s ~/.dotfiles/settings.json ~/.config/Code/User/settings.json

### Folder setup
cd ~/Documents && mkdir ./coding

### Setup node

source .zshrc  
nvm  install --lts
