######## Install oh-my-bash
if [[ ! -d "/$USER/.oh-my-bash" ]]; then
    echo -e '\033[34mInstalling oh-my-bash... \033[0m'
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
else
    echo 'oh-my-bash is already installed'
fi