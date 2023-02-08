#!/bin/bash

# cd to script folder
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd "$SHELL_FOLDER"

# import conf and lib
. ./conf.sh
. lib/log.sh

case $1 in
    --debug) export DEBUG_MODE=true
    ;;
    *) echo default
    ;;
esac


install(){
    pkg=$1
    cmd=$2

    if [ "$2" = "" ]; then
        cmd=$pkg
    fi


    if command -v "$cmd" >/dev/null 2>&1
    then
        echo "$pkg is already installed"
    else
        printBlue "Installing $pkg..."
        sudo "$INSTALLER" install "$pkg"
    fi
}

# ========== MAIN ==========

#######################
# 1. Install neccessary packs
#######################
apt-get update
install git
install curl
install vim
install unzip
# install snapd snap
# install snapcraft
install ncdu
install python3
install npm

for installer in "$WD"/install/*
do
    $installer
done

#######################
# 2. Optional install
#######################

for installer in "$WD"/install_optional/*
do
    if [[ -f "$installer" && -x "$installer" ]]
    then
        printConfirm "Run $installer?(y/n)"
        read -r opt
        if test "$opt" = 'y'
        then
            $installer
        fi
    fi
done

#######################
# 3. Copy home config
#######################

printConfirm "Reset bash and vim?(y/n)"
read -r opt
if test "$opt" = 'y'
then
    printInfo "Copying $WD /home_config/ into /$USER/"
    cp -r home_config/. ~/
    source /"$USER"/.bash_profile
fi

# lib function: append to .bash_profile
#!/bin/sh
add2bash(){    
    if grep -Fxq "$1" ~/.bash_profile
    then
        printDebug "scripts dir is in env var"
    else
        echo "$1" >> ~/.bash_profile
    fi
}

add2bash "export PATH=$WD/scripts:\$PATH"

#######################
# 4. Set cron job
#######################
"$WD"/scripts/setCrons.sh

printYellow "=================================================="
printYellow "[TODO] replace oh-my-bash theme if .bash_profile is not replaced"
printYellow "[TODO] initialize vundle in vim: PluginInstall"
printYellow "[TODO] set /etc/nginx/sites-enabled"
printYellow "=================================================="
echo "DONE"
