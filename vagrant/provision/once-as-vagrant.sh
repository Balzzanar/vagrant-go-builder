#!/usr/bin/env bash

### Bash helpers ###

function info {
  echo " "
  echo "--> $1"
  echo " "
}

### Provision script ###

info "Create bash-alias 'app' for vagrant user"
echo 'alias app="cd /app"' | tee -a /home/vagrant/.bash_aliases

info "Set up paths for the vagrant user"
echo "export PATH=$PATH:/usr/local/go/bin" | tee -a /home/vagrant/.bashrc
echo "export GOPATH=/golang" | tee -a /home/vagrant/.bashrc
source /home/vagrant/.bashrc

info "Enable colorized prompt for guest console"
sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" /home/vagrant/.bashrc

info "Config git global user"
git config --global user.email "spann.johan@gmail.com"
git config --global user.name "Balzzanar"

# Go get projects
info "Getting projects with go get"
go get github.com/mattn/go-sqlite3


