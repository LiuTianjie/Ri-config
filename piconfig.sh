#! /bin/bash

#扩展sd卡空间(由于已经搭建好环境，这里没敢测试，之后再烧录新的镜像时会尝试)
sudo raspi-config --expand-rootfs

#更换apt为清华源
sudo cp /etc/apt/sources.list /etc/apt/sources.list.copy
sudo rm -rf /etc/apt/sources.list
sudo touch /etc/apt/sources.list
sudo chmod 777 /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ stretch main contrib non-free rpi \n
deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ stretch main contrib non-free rpi
" >> /etc/apt/sources.list
sudo chmod -777 /etc/apt/sources.list

#更换pip为阿里云
sudo cp /etc/pip.conf /etc/pip.conf.copy
sudo chmod 777 /etc/pip.conf
sudo echo "index-url = https://mirrors.aliyun.com/pypi/simple" >> /etc/pip.conf
sudo chmod -777 /etc/pip.conf

#开启ssh服务
sudo systemctl enable ssh
sudo systemctl start ssh

#开启VNC服务