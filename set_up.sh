sudo apt-get update
if [ $? -eq 0 ]; then
    echo "apt-get update"
else
    echo "apt-get failed to update"
    #exit 1
fi

sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse

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

curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs
if [ $? -eq 0 ]; then
    echo "nodejs installed"
else
    echo "nodejs failed to install"
fi

sudo apt-get install -y build-essential

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs yarn

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.5.0
rbenv global 2.5.0
if [ $? -eq 0 ]; then
    echo "ruby installed"
else
    echo "ruby failed to install"
    #exit 1
fi

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
