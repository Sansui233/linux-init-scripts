WD=$(cd "$(dirname "$0")";pwd)
DIRNAME=${WD##*/}

cd $WD; cd ..
tar -czf $DIRNAME.tar.gz $DIRNAME
mv $DIRNAME.tar.gz $WD/release/