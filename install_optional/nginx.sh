#!/bin/bash
. $WD/lib/log.sh
. $WD/lib/newCron.sh

####### Install nginx
if command -v nginx >/dev/null 2>&1; then
    echo 'nginx is already installed'
else
    printBlue 'Installing nginx...'
    sudo $INSTALLER install nginx
fi


######## Install CF real IP conf for nginx
printConfirm "[Confirm] Generate CF real IP conf for nginx?(y/n)"
read -r input
case $input in
    [yY][eE][sS]|[yY])
        echo -e 'Generate nginx cf realip file and add to crontab...'
        if [[ ! -f "$WD/scripts/nginxCFrealIP.sh" ]]; then
            printError "$WD/scripts/nginxCFrealIP.sh doesn't exits"
        else
            $WD/scripts/nginxCFrealIP.sh
            newCron "0 5 * * 1 bin/bash $WD/scripts/nginxCFrealIP.sh"
            printInfo "stored in /etc/nginx/sites-available/cloudflare_ip.conf"
        fi
    ;;
    
    [nN][oO]|[nN])
    ;;
    
    *)
        echo "Invalid input, skip"
    ;;
esac