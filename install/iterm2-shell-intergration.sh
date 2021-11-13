######## Install iterm2 shell integration
if [[ ! -f "/$USER/.iterm2_shell_integration.bash" ]]; then
    echo -e '\033[34mInstalling iterm2_shell_integration... \033[0m'
    curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
else
    echo 'iterm2_shell_integration is already installed'
fi