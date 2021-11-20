mkdir /$USER/trojan-go
cd /$USER/trojan-go
wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.6/trojan-go-linux-amd64.zip
unzip trojan-go-linux-amd64.zip && rm trojan-go-linux-amd64.zip
cp -r $WD/install_optional/trojan-conf/. /$USER/trojan-go/