# Unix Dotfiles

Dotfiles is a concept that you use in order to restore, maintain or sync configuration data in unix-based operating systems.

This repository aims to setup a desktop environment for Linux systems, download and setup tools for programming, and configuring gaming software.

# Ecosystem

The ecosystem makes usage of the **GNOME** desktop environment, **alacritty** as the main terminal emulator and **vscode** as the primary code editor.

## Running

### 1- Clone the repo

In order to run the application, you need to not only clone the repo, but also to change your directory so you run the script in the project's root folder

```bash
git clone https://github.com/HiImFelipe/.dotfiles.git
cd .dotfiles
```

### 2- Executing the script

Make sure to change the script rights so it can be executed

```bash
chmod +x main.sh
```

Afterwards, you only need to run it

```bash
./main.sh
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
./main.sh -g -w
```

## Plans for the future

- Automating the download of GNOME extensions;
- Automating the download of live-service Lutris games (games that i will most likely always have installed);
- Automating the setup of a GNOME theme with no need for manual intervention;
