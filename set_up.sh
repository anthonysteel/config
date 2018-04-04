sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse

sudo apt-get update
if [ $? -eq 0 ]; then
    echo "apt-get update"
else
    echo "apt-get failed to update"
    #exit 1
fi

sudo apt-get install vim
if [ $? -eq 0 ]; then
    echo "vim installed"
else
    echo "vim failed to install"
    #exit 1
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if [ $? -eq 0 ]; then
    echo "vundle installed"
else
    echo "vundle failed to install"
    #exit 1
fi

# Install vim plugins
vim -c "PluginInstall" -c "qa"

sudo apt-get install python-pip python-dev build-essential
if [ $? -eq 0 ]; then
    echo "pip installed"
else
    echo "pip failed to install"
    #exit 1
fi

sudo pip install --upgrade pip
if [ $? -eq 0 ]; then
    echo "pip upgraded"
else
    echo "pip failed to upgrade"
    #exit 1
fi

pip install ipython
if [ $? -eq 0 ]; then
    echo "ipython installed"
else
    echo "ipython failed to install"
    #exit 1
fi

sudo pip install virtualenv virtualenvwrapper
if [ $? -eq 0 ]; then
    echo "virtualenvwrapper installed"
else
    echo "virtualenvwrapper failed to install"
fi

if [ $? -eq 0 ]; then
    echo "nodejs installed"
else
    echo "nodejs failed to install"
fi

sudo apt-get install ruby-full
if [ $? -eq 0 ]; then
    echo "ruby installed"
else
    echo "ruby failed to install"
    #exit 1
fi

sudo apt-get install tmux

gem install tmuxinator
if [ $? -eq 0 ]; then
    echo "tmuxinator installed"
else
    echo "tmuxinator failed to install"
    #exit 1
fi

# terminal configuration
for filename in ./config_files/*; do
    name=${filename##*/}
    cp $filename ~/.$name
done

source ~/.bashrc

sudo apt-get install chromium-browser
if [ $? -eq 0 ]; then
    echo "Chrome installed"
else
    echo "Chrome failed to install"
    #exit 1
fi

sudo apt-get install dconf-cli
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh

sudo apt-get install fonts-powerline
