mkdir /$USER/trojan-go
cd /$USER/trojan-go
wget https://github.com/p4gefau1t/trojan-go/releases/latest/download/trojan-go-linux-amd64.zip
unzip trojan-go-linux-amd64.zip && rm trojan-go-linux-amd64.zip
cp $WD/install_optional/trojan-conf/config.json /$USER/trojan-go/
cp $WD/install_optional/trojan-conf/trojan.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/trojan.conf /etc/nginx/sites-enabled/trojan.conf
printYellow "[TODO] Modify your config in /etc/nginx/sites-enabled/"

sudo cp $WD/install_optional/trojan-conf/trojan.service /etc/systemd/system/
sudo systemctl daemon-reload
printInfo "Trojan-go is installed in /$USER/trojan-go"
