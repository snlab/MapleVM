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
HOME=/home/vagrant sudo -u vagrant make local

cd ..
git clone https://github.com/snlab/MapleDemo
cd MapleDemo

# You can comment and uncomment the following lines to download the
# sample video with different sizes. (10M, 20M, 30M or 50M)
#
# wget http://www.sample-videos.com/video/mp4/480/big_buck_bunny_480p_10mb.mp4 -O sample.mp4
# wget http://www.sample-videos.com/video/mp4/480/big_buck_bunny_480p_20mb.mp4 -O sample.mp4
# wget http://www.sample-videos.com/video/mp4/480/big_buck_bunny_480p_30mb.mp4 -O sample.mp4
wget http://www.sample-videos.com/video/mp4/480/big_buck_bunny_480p_50mb.mp4 -O sample.mp4

chown -R vagrant:vagrant /home/vagrant/maple
