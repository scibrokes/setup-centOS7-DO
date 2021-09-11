
1) Create a droplet
2) 
3) 

sudo apt update && sudo apt install lsb-core
sudo lsb_release
sudo apt install -y nginx
sudo apt install -y firewalld
#sudo systemctl enable firewalld
#sudo systemctl start firewall
#sudo firewall-cmd --list-all
sudo apt -y install gdebi-core
ufw enable ## https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04


apt update && apt install -y lsb-core nginx gdebi-core r-base-dev

# update indices
apt update -qq
# install two helper packages we need
apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: 298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

wget -c https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/rstudio-server-2021.09.0-preview%2B341-amd64.deb

gdebi -y rstudio-server-2021.09.0-preview+341-amd64.deb



