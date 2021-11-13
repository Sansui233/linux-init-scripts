######## Install Vundle
if [[ ! -d "/$USER/.vim/bundle/Vundle.vim" ]]; then
    echo -e '\033[34mInstalling Vundle for vim... \033[0m'
    git clone https://github.com/VundleVim/Vundle.vim.git /$USER/.vim/bundle/Vundle.vim
else
    echo 'Vundle is already installed'
fi