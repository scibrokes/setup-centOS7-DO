
1) Create a droplet
2) 
3) 


## 建立好Droplet后，首先更新与升级现有资源
## Linux的lsb-core核心程序包，nginx服务器，gdebi可安装RStudio软件，micro编译器修改Linux上的任何设定文件，firewalld防火墙
apt update && apt install -y lsb-core nginx gdebi-core micro firewalld

## https://www.tecmint.com/lolcat-command-to-output-rainbow-of-colors-in-linux-terminal/
apt install -y ruby figlet cowsay
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat
cd ..
cd ..
rm master.zip

## --------------------------------
##安装R语言
# update indices
apt update -qq

# install two helper packages we need
apt install --no-install-recommends software-properties-common dirmngr

# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: 298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
apt install -y --no-install-recommends r-base

add-apt-repository ppa:c2d4u.team/c2d4u4.0+
apt install -y --no-install-recommends r-cran-rstan
apt install -y --no-install-recommends r-cran-tidyverse

wget -c https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/rstudio-server-2021.09.0-preview%2B341-amd64.deb
gdebi rstudio-server-2021.09.0-preview+341-amd64.deb
rm rstudio-server-2021.09.0-preview+341-amd64.deb

## --------------------------------
## 安装anaconda
## https://docs.anaconda.com/anaconda/install/linux/
apt install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
sha256sum Anaconda3-2021.05-Linux-x86_64.sh
bash Anaconda3-2021.05-Linux-x86_64.sh
rm Anaconda3-2021.05-Linux-x86_64.sh

## --------------------------------
## 新建用户
adduser englianhu
passwd  englianhu
micro /etc/sudoers  ## 或者 vim /etc/sudoers

```
# User privilege specification
# Ubuntu20.04 解释变量 https://unix.stackexchange.com/a/201866/128388
root            ALL=(ALL:ALL) ALL
englianhu       ALL=(ALL:ALL) ALL               \\添加这一行

## Same thing without a password
%wheel          ALL=(ALL)   NOPASSWD: ALL
englianhu       ALL=(ALL)   NOPASSWD: ALL       \\添加这一行
```



