#!/bin/bash
username='ubuntu'
IPinstance=$(terraform output public_ip)
MY_SSH_KEY='ubuntu_ssh_key.pem'
chmod 400 ${MY_SSH_KEY}

ssh -i $MY_SSH_KEY -o StrictHostKeyChecking=no ${username}@${IPinstance//\"/} << EOF
                sudo apt update -y
                sudo apt install unzip -y
                sudo apt install -y nginx
                sudo apt install net-tools -y
                sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
                source ~/.bashrc
                nvm install lts/hydrogen
EOF
