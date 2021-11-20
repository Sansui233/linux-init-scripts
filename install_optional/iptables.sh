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
. $WD/lib/log.sh

install iptables

printConfirm "Copying $WD/install_optional/iptables/ into /etc/network/?(y/n)"
read -r opt
if test $opt = 'y'
then
    cp -r  $WD/install_optional/iptables/. /etc/network/
    iptables-apply
fi

