. $WD/log.sh

TG=/$USER/tg

if test -d $TG
then
    printYellow 'telegram-cli is already installed, reinstall?(y/n)'
    read -r opt
    if test $opt = 'n'
    then
        exits 0
    fi
fi

cd /$USER

printBlue "Installing telegram-cli into $TG"
git clone --recursive https://github.com/vysheng/tg.git
cd tg

printBlue "[tg-install] Install dependency"
sudo $INSTALLER update
sudo $INSTALLER install libreadline-dev
sudo $INSTALLER install libconfig-dev
sudo $INSTALLER install libssl-dev
sudo $INSTALLER install lua5.2 liblua5.2-dev
sudo $INSTALLER install libevent-dev
sudo $INSTALLER install libjansson-dev
sudo $INSTALLER install make
sudo $INSTALLER install libpython2-dev
#or
sudo $INSTALLER install libpython-dev

# Fix openssl issue on Ubuntu 20.04
printBlue "[tg-install] Fix openssl issue on Ubuntu 20.04"
sudo $INSTALLER install libgcrypt20-dev

printBlue "[tg-install] Compiling zlib"
git clone --recursive https://github.com/madler/zlib.git
cd zlib
./configure
sudo make install
cd $TG

printBlue "[tg-install] Compiling lua"
wget http://www.lua.org/ftp/lua-5.4.3.tar.gz
tar -zxvf lua-5.4.3.tar.gz && rm lua-5.4.3.tar.gz && cd lua-5.4.3
make linux test
make install
cd $TG

printBlue "[tg-install] Compiling telegram"
$TG/configure --disable-openssl --prefix=/usr CFLAGS="$CFLAGS -w"
printYellow "Check the list above and continue?[y/n]"
read -r opt
if test $opt = 'n' 
then
    exit 0
fi
make
printBlue "Telegram-cli is installed into $TG/bin/telegram-cli"

if test -d $WD/install_optional/telegram-cli_conf
then
    for file in $WD/install_optional/telegram-cli_conf/*
    do
        echo $file
        cp $file $TG/
    done
    exit 0
else
    printYellow '----------------------------------------------------'
    printYellow 'To exploit tg client for automation, you can'
    printYellow "[TODO] save your public key in https://my.telegram.org/auth?to=apps into $TG/tg-server.pub"
    printYellow "[TODO] write your shell script and store in crontab"
    printYellow "       Usage: $TG/bin/telegram-cli -W -e \"msg <channel> <text>\""
    printYellow '----------------------------------------------------'
fi
