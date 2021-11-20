WD=$(cd "$(dirname "$0")";pwd)
DIRNAME=${WD##*/}

if [[ ! -d $WD/release/ ]]; then mkdir -p $WD/release/; fi

chmod +x $WD/install/*.sh
chmod +x $WD/install_optional/*.sh
chmod +x $WD/scripts/*.sh

cd $WD; cd ..
tar -czf $DIRNAME.tar.gz $DIRNAME
mv $DIRNAME.tar.gz $WD/release/