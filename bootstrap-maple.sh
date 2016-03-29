#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y unzip openjdk-7-jre npm nodejs nodejs-legacy vlc

cd /home/vagrant
wget https://github.com/snlab/MapleVM/releases/download/v0.1/maple.zip
if [ ! -d "/home/vagrant/maple" ]; then
    sudo -u vagrant unzip /home/vagrant/maple.zip
fi
sudo npm install -g bower
cd maple/MapleGUI
sudo -u vagrant make local
cd ..
git clone https://github.com/snlab/MapleDemo
cd MapleDemo
wget http://www.sample-videos.com/video/mp4/480/big_buck_bunny_480p_50mb.mp4 -O sample.mp4
