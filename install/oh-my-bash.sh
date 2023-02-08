######## Install oh-my-bash
. $WD/lib/log.sh
if [[ ! -d "/$USER/.oh-my-bash" ]]; then
    printInfo -e 'Installing oh-my-bash...'
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
else
    printInfo 'oh-my-bash is already installed'
fi
