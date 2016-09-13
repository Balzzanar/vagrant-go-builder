#!/usr/bin/env bash

### Bash helpers ###

function info {
  echo " "
  echo "--> $1"
  echo " "
}

### Provision script ###

info "Install additional software"
apt-get install -y git

info "Installing golang"
curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
tar -xvf go1.6.linux-amd64.tar.gz
mv go /usr/local

info "Setup the Golang environment structure"
mkdir -p /golang/{pkg,lib}
ln -s /app /golang/src
chown -R vagrant:vagrant /golang
chmod -R 700 /golang


info "Setting up the ssh key"
mkdir /data
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
cat /dev/zero | ssh-keygen -q -N "" > /dev/null 2>&1
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/id_rsa > /data/ia_key_www
chmod 400 /data/ia_key_www
chown vagrant:vagrant /data/ia_key_www
echo "Done!"