source functions/arch-install-apps.sh
source functions/setup-environment.sh

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

install_apps ${options[@]}

echo "Packages installed. Proceeding to environment setup."

setup_environment ${options[@]}

echo "Environment setup complete."

clear

echo "Everything was installed and set up, enjoy your new system!"