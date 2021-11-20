if [[ ! -d "/$USER/.acme.sh" ]]; then
    curl  https://get.acme.sh | sh
else
    echo 'acme is already installed'
fi