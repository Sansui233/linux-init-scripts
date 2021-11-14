WD=$(cd "$(dirname "$0")";pwd)
DIRNAME=${WD##*/}

if [[ ! -d $WD/release/ ]]; then mkdir -p $WD/release/; fi

cd $WD; cd ..
tar -czf $DIRNAME.tar.gz $DIRNAME
mv $DIRNAME.tar.gz $WD/release/