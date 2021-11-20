if [[ ! -d "/$USER/.acme.sh" ]]; then
    $INSTALLER install socat
    curl  https://get.acme.sh | sh
else
    echo 'acme is already installed'
fi