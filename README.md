# Unix Dotfiles

Dotfiles is a concept that you use in order to restore, maintain or sync configuration data in unix-based operating systems.

This repository aims to setup a desktop environment for Linux systems, download and setup tools for programming, and configuring gaming software.

# Ecosystem

The ecosystem makes usage of the **GNOME** desktop environment, **alacritty** as the main terminal emulator and **vscode** as the primary code editor.

## Running

### 1- Downloading applications

Right now it offers a little bit of bloat as there is no way to opt-out of gaming/work applications and only keeping the core utils.

Arch based distros

```bash
./arch-install-apps.sh
```

### 2- Applying settings

```bash
./setup-environment.sh
```

## Plans for the future

- Automating the download of GNOME extensions;
- Automating the download of live-service Lutris games (games that i will most likely always have installed);
- Automating the setup of a GNOME theme with no need for manual intervention;
