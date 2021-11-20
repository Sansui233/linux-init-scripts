domain='dd72899.tk'

. $(cd "$(dirname "$0")";pwd)/../lib/log.sh

generate(){
    ~/.acme.sh/acme.sh --issue -d $domain --standalone --keylength ec-256 --force
}
installCert(){
    path=/etc/v2ray
    name=v2ray
    printYellow 'Cert path(/etc/v2ray):'; read -r path;
    printYellow 'Cert name(v2ray):'; read -r name;
    if [[ -z $path ]]; then
        mkdir /etc/v2ray
        path=/etc/v2ray;
    fi
    if [[ -z $name ]]; then name=v2ray; fi
    sudo ~/.acme.sh/acme.sh --installcert --ecc -d $domain --key-file $path/$name.key --fullchain-file $path/$name.crt
}
renew(){
    ~/.acme.sh/acme.sh --renew -d $domain --force --ecc
}

if [[ $# != 0 ]]; then
    if [[ $# == 2 ]]; then
        domain=$2
    fi
    case $1 in
        -g) generate $domain
        ;;
        -i) install $domain
        ;;
        -r) renew $domain
        ;;
        -all) generate $domain && installCert $domain && renew $domain
        ;;
        *) echo 'Usage: acme_private.sh -g[enerate]|-i[nstall]|-r[enew]|-all [domain]'
        ;;
    esac
else
    echo 'Usage: acme_private.sh -g[enerate]|-i[nstall]|-r[enew]|-all [domain]'
fi