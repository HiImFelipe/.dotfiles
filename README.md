# Unix Dotfiles

Dotfiles is a concept that you use in order to restore, maintain or sync configuration data in unix-based operating systems.

This repository aims to setup a desktop environment for Linux systems, download and setup tools for programming, and configuring gaming software.

# Ecosystem

The ecosystem makes usage of the **GNOME** desktop environment, **alacritty** as the main terminal emulator and **vscode** as the primary code editor.

## Running

### 1- Downloading applications

Right now it offers a little bit of bloat as there is no way to opt-out of gaming/work applications and only keeping the core utils.

To run the program you just need to give the scripts the right to be executable, then run the following

```bash
./arch-install-apps.sh
```

**Flags**

There are tags implements in order to download different sets of apps. By default, all of them will install, but you can select just a few group of apps instead of downloading them all at once.

```bash
-h # help tag, it will show you how to execute the program.
-g # gaming tag, it will download apps for gaming in general.
-w # work tag, it will download software i use for programming.
-c # core utils tag, it will download drivers and apps that i use in my day-to-day life.
```

Example

```bash
./arch-install-apps.sh -g -w
```

### 2- Applying settings

```bash
./setup-environment.sh
```

## Plans for the future

- Automating the download of GNOME extensions;
- Automating the download of live-service Lutris games (games that i will most likely always have installed);
- Automating the setup of a GNOME theme with no need for manual intervention;
