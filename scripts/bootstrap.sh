#!/bin/bash

BASE_DIR="~/Desktop/"

echo "Starting bootstrap..."

echo "Updating apt and installing packages"
# Update apt and snap
sudo apt-get install -y snapd
sudo apt-get install -y xclip
sudo systemctl enable --now snapd apparmor


echo "Setting up docker"
# Install Docker
sudo apt-get install -y docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker "$USER"

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Dockers complete."

echo "Setting up languages and editors for development"
# Install applications 
# and languages
sudo snap install task --classic
sudo snap install micro --classic
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt-get install -y golang-go
sudo apt-get install -y tldr

echo "Setting up directory structure for development"
# Create code environment
mkdir -p "$BASE_DIR"/code/workspace
mkdir -p "$BASE_DIR"/code/scripts
mkdir -p "$BASE_DIR"/code/golang
mkdir -p "$BASE_DIR"/code/python
mkdir -p "$BASE_DIR"/code/javascript

echo "Setting up directory structure for CTFs"
# Create ctf environment
mkdir -p "$BASE_DIR"/ctf/loot
mkdir -p "$BASE_DIR"/ctf/notes
mkdir -p "$BASE_DIR"/ctf/workspace

echo "All done! You may need to run this script a second time after logging out and in to complete setup."