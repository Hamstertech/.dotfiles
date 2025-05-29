# TODO:
 - Complete the configuration of this process with the setup of a new system
 - Cleanup README.md
 - Test to see if the new-station.sh file works
 - Add symbolic link command to setup (And delete old file if it already exists)
 	- Symbolic link creation example: ln -s ~/.dotfiles/.gitconfig/.gitconfig ~/.gitconfig

# Oh-My-Zsh
sudo apt install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
sudo lchsh $USER

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

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

# Composer
cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer global require "laravel/installer"


# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Valet
composer global require cpriego/valet-linux
valet install
