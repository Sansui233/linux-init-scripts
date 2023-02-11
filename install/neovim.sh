. $WD/lib/log.sh
. ../conf.sh
if command -v nvim >/dev/null 2>&1; then
    printInfo 'neovim  is already installed'
else
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    sudo chmod u+x nvim.appimage 
    sudo mv nvim.appimage /usr/local/bin/nvim
    PACK_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/user/start
    mkdir -p "$PACK_DIR"
    git clone --depth 1 --single-branch https://github.com/adoyle-h/one.nvim.git "$PACK_DIR"/one.nvim
    NVIM_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/
    mkdir -p "$NVIM_HOME"
    cp -r $WD/install/nvim $NVIM_HOME

    printInfo 'installing node for nvim-mason requirment'
    $INSTALLER install node
    sudo npm cache clean -f
    sudo npm install -g n
    sudo n 16.15.1 # DO NOT USE latest stable version that require an extra clib

    printYellow "OK ~ You can open nvim in another tab and run PackSync to init"
    read -p  "Press any key to continue..."
fi
