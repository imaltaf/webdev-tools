#!/usr/bin/env bash

echo "Make sure you're root before installing the tools"
sleep 2s
clear

sudo apt install curl

echo -e "- Installing brave"

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

echo -e "Installing all dependencies\n"
cd
echo -e "- Installing git"
sudo apt-get install git -y 2> /dev/null &> /dev/null
sudo apt-get install unzip -y 2> /dev/null &> /dev/null

echo -e "- Installing python"
sudo apt-get install python3 -y 2> /dev/null &> /dev/null
sudo apt-get install python3-pip -y 2> /dev/null &> /dev/null
sudo apt install -y libpcap-dev 2> /dev/null &> /dev/null

echo -e "- Installing go-lang"
wget https://go.dev/dl/$goversion.linux-amd64.tar.gz -q 2> /dev/null &> /dev/null
rm -rf /usr/local/go && tar -C /usr/local -xzf $goversion.linux-amd64.tar.gz 2> /dev/null &> /dev/null
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc	
source ~/.bashrc


echo -e "- Installing snapd"
sudo apt install snapd -y 2> /dev/null &> /dev/null

echo -e "- Installing cmake"
sudo apt install cmake -y 2> /dev/null &> /dev/null

echo -e "- Installing jq"
sudo apt install jq -y 2> /dev/null &> /dev/null
# sudo apt-get install -y parallel

echo -e "- Installing chromium"
sudo snap install chromium 2> /dev/null &> /dev/null
sleep 2s

echo -e "- Installing sublime"

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null


echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update
sudo apt-get install sublime-text

echo -e "- Installing redis-server"

sudo apt install redis-server

sudo apt install nodejs npm

sudo apt install apache2

sudo apt install mysql-server

sudo apt install php libapache2-mod-php

wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i vscode.deb

sudo npm install -g sass

sudo npm install -g gulp

sudo npm install -g webpack

sudo npm install -g @babel/core @babel/cli

sudo apt install postgresql

sudo apt install mongodb

wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i chrome.deb
