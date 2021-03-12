#!/bin/bash

echo "Starting bootstrap..."


echo "Updating apt and installing packages"
# Update apt and snap
sudo apt update
sudo apt install snapd
sudo apt install xclip
sudo systemctl enable --now snapd apparmor


echo "Setting up docker"
# Install Docker
sudo apt install -y docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker "$USER"

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Docker scomplete."

echo "Setting up languages and editors for development"
# Install applications 
# and languages
sudo snap install task --classic
sudo snap install micro --classic
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go
sudo apt-get install tldr

echo "Setting up directory structure for development"
# Create code environment
mkdir -p ~/Documents/code/workspace
mkdir -p ~/Documents/code/scripts
mkdir -p ~/Documents/code/golang
mkdir -p ~/Documents/code/python
mkdir -p ~/Documents/code/javascript

echo "Setting up directory structure for CTFs"
# Create ctf environment
mkdir -p ~/Documents/ctf/loot
mkdir -p ~/Documents/ctf/notes
mkdir -p ~/Documents/ctf/workspace

echo "All done! You may need to run this script a second time after logging out and in to complete setup."