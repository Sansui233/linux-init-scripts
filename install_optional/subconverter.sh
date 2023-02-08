cd /$USER
wget https://github.com/tindy2013/subconverter/releases/latest/download/subconverter_linux64.tar.gz -O subconverter.tar.gz
tar -xvf subconverter.tar.gz
rm subconverter.tar.gz
sudo echo "[Unit]
Description=subconverter server

[Service]
ExecStart=/root/subconverter/subconverter
Restart=always
WorkingDirectory=/root/subconverter

[Install]
WantedBy=multi-user.target" >| /etc/systemd/system/subconv.service
sudo systemctl daemon-reload
sudo systemctl enable subconv.service
sudo systemctl start subconv.service

cd $WD