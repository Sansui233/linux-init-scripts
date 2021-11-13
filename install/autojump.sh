######## Install autojump
if [[ ! -d "/$USER/autojump" ]]; then
    echo -e '\033[34mInstalling autojump... \033[0m'
    git clone git://github.com/joelthelion/autojump.git
    cd autojump
    if command -v python >/dev/null 2>&1; then
        echo 'autojump dependecy: python is already installed'
    else
        echo -e 'autojump dependecy: \033[34mInstalling python dependency...\033[0m'
        apt install python
    fi
    ./install.py # or ./uninstall.py
    echo "[[ -s /$USER/.autojump/etc/profile.d/autojump.sh ]] && source /$USER/.autojump/etc/profile.d/autojump.sh" >>/$USER/.bash_profile
    source /$USER/.bash_profile
else
    echo 'autojump is already installed'
fi