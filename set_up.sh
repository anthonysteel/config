sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse

sudo apt-get update

sudo apt-get install vim
declare -A config=(["vim"]=$?)

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
config+=(["vundle"]=$?)

# Install vim plugins
vim -c "PluginInstall" -c "qa"

sudo apt-get install python-pip python-dev build-essential
config+=(["python"]=$?)

sudo pip install --upgrade pip
config+=(["pip"]=$?)

sudo apt-get install ipython
config+=(["ipython"]=$?)

sudo pip install virtualenv virtualenvwrapper
config+=(["virtualenv"]=$?)

sudo apt-get install nodejs-legacy
config+=(["virtualenv"]=$?)

sudo apt-get install ruby-full
config+=(["ruby-full"]=$?)

sudo apt-get install tmux
config+=(["tmux"]=$?)

sudo gem install tmuxinator
config+=(["tmuxinator"]=$?)

# terminal configuration
for filename in ./config_files/*; do
    name=${filename##*/}
    cp $filename ~/.$name
done

source ~/.bashrc

sudo apt-get install chromium-browser
config+=(["chromium"]=$?)

sudo apt-get install dconf-cli
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh

sudo apt-get install fonts-powerline
config+=(["powerline"]=$?)

echo
(
printf '\e[1;38mPACKAGE\tSTATUS\n'
for package in "${!config[@]}"; do
    if [ "${config[$package]}" -eq 0 ]; then
        printf '\e[1;33m%s\tInstalled\n' $package
    else 
        printf '\e[1;31m%s\tFailed\n' $package
    fi
done
) | column -t -s $'\t'
echo
