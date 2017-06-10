#!/usr/bin/env bash

apt-get update --fix-missing
apt-get install vim git zlib1g-dev --assume-yes
apt-get install python3 --assume-yes
apt-get install python3-venv --assume-yes
apt-get install bpython --assume-yes

