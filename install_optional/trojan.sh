mkdir /$USER/trojan-go
cd /$USER/trojan-go
wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.6/trojan-go-linux-amd64.zip
unzip trojan-go-linux-amd64.zip && rm trojan-go-linux-amd64.zip
cp $WD/install_optional/trojan-conf/config.json /$USER/trojan-go/
cp $WD/install_optional/trojan-conf/trojan.conf /etc/nginx/sites-available/