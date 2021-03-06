#!/usr/bin/env bash

apt-get update --fix-missing
apt-get install vim git --assume-yes

cd /home/vagrant/
sudo wget https://www.python.org/ftp/python/3.4.1/Python-3.4.1.tar.xz
sudo tar -xvf Python-3.4.1.tar.xz
cd Python-3.4.1
sudo ./configure
make
sudo make install

apt-get install bpython --assume-yes
