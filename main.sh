#!/bin/bash
export USER=root
export WD=$(pwd)
export INSTALLER=apt

. ./log.sh
. ./newCron.sh

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

install git
install curl
install vim
for installer in ./install/*
do
    $installer
done

# optional installation
for installer in ./install_optional/*
do
    printYellow "[Confirm] Execute $installer?(y/n)"
    read -r opt
    if test $opt = 'y'
    then
        $installer
    fi
done

# copy config
printYellow "[Confirm] Reset bash, vim and iptables config?(y/n)"
read -r opt
if test $opt = 'y'
then
    for file in $WD/home_config/*
    do
        printBlue "Copying $file"
        cp $file /$USER/
    done
    source /$USER/.bash_profile
    
    for file in $WD/iptables/*
    do
        printBlue "Copying $file"
        cp $file /etc/network/
    done
    iptables-apply
fi


# set cron job
newCron "* */72 * * * $WD/scripts/cleanlog.sh"

printYellow "=================================================="
printYellow "[TODO] replace oh-my-bash theme"
printYellow "[TODO] initialize vim vundle: Plugin Install"
printYellow "=================================================="
echo "DONE"