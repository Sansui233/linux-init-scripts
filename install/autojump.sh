######## Install autojump
if command -v autojump >/dev/null 2>&1; then
    echo 'autojump is already installed'
else
    echo -e '\033[34mInstalling autojump... \033[0m'
    if command -v python >/dev/null 2>&1; then
        echo 'autojump dependecy: python is already installed'
    else
        echo -e 'autojump dependecy: \033[34mInstalling python dependency...\033[0m'
        $INSTALLER install python
    fi
		$INSTALLER install autojump
    echo ". /usr/share/autojump/autojump.sh" >> /$USER/.bash_profile
    source /$USER/.bash_profile
fi
