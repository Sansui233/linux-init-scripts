######## Install Vundle
. $WD/lib/log.sh
if [[ ! -d "/$USER/.vim/bundle/Vundle.vim" ]]; then
    printInfo -e '\033[34mInstalling Vundle for vim... \033[0m'
    git clone https://github.com/VundleVim/Vundle.vim.git /$USER/.vim/bundle/Vundle.vim
else
    printInfo 'Vundle is already installed'
fi
