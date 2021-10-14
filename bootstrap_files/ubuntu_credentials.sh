#!/bin/bash
sudo useradd --groups google-sudoers paloalto
sudo echo "paloalto:Pal0Alt0@123" | chpasswd
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd
