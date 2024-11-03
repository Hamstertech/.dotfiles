sudo add-apt-repository -y ppa:ondrej/php
sudo apt update -y

versions=(7.3 7.4 8.0 8.1 8.2 8.3)
modules=(xdebug imagick gettext gd cli mcrypt bcmath bz2 curl dba xml gmp intl ldap mbstring mysql odbc soap zip enchant sqlite3)

for version in "${versions[@]}"
do
    sudo apt install php${version}-fpm -y
done

sudo apt install php-pear -y
sudo apt install php-memcache -y

sudo apt-get install network-manager libnss3-tools jq xsel

for module in "${modules[@]}"
do
    for version in "${versions[@]}"
    do
        sudo apt install php${version}-${module} -y
    done
done
