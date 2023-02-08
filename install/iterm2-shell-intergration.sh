######## Install iterm2 shell integration
. $WD/lib/log.sh
if [[ ! -f "/$USER/.iterm2_shell_integration.bash" ]]; then
    printInfo -e 'Installing iterm2_shell_integration...'
    curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
else
    printInfo 'iterm2_shell_integration is already installed'
fi
