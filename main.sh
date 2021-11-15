#!/bin/bash

# cd to script folder
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd "$SHELL_FOLDER"

# import
. ./conf.sh
. lib/log.sh
. lib/newCron.sh

case $1 in
    --debug) export DEBUG_MODE=true
    ;;
    *) echo default
    ;;
esac


install(){
    cmd=$1
    if command -v $cmd >/dev/null 2>&1
    then
        echo "$cmd is already installed"
    else
        printBlue "Installing $cmd..."
        sudo $INSTALLER install $cmd
    fi
}

# ========== MAIN ==========

# 1. Install neccessary packs
install git
install curl
install vim
for installer in $WD/install/*
do
    $installer
done

# 2. Optional install
for installer in $WD/install_optional/*
do
    if [[ -f "$installer" && -x "$installer" ]]
    then
        printConfirm "[Confirm] Execute $installer?(y/n)"
        read -r opt
        if test $opt = 'y'
        then
            $installer
        fi
    fi
done

# 3. Copy config
printConfirm "[Confirm] Reset bash, vim and iptables config?(y/n)"
read -r opt
if test $opt = 'y'
then
    for file in $WD/home_config/*
    do
        printInfo "Copying $file"
        cp $file /$USER/
    done
    source /$USER/.bash_profile
    
    for file in $WD/iptables/*
    do
        printInfo "Copying $file"
        cp $file /etc/network/
    done
    iptables-apply
fi

#!/bin/sh
add2bash(){
    if grep -Fxq "$1" ~/.bash_profile
    then
        printDebug "scripts dir is in env var"
    else
        echo "$1" >> ~/.bash_profile
    fi
}

#执行该函数
add2bash "export PATH=$WD/scripts:\$PATH"

# 4. set cron job
newCron "* */72 * * * $WD/scripts/cleanlog.sh"

printYellow "=================================================="
printYellow "[TODO] replace oh-my-bash theme"
printYellow "[TODO] initialize vim vundle: Plugin Install"
printYellow "=================================================="
echo "DONE"