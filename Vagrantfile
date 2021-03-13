# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "kalilinux/rolling"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  
  # Provision device
  config.vm.provision "file", source: "./data/.zshenv", destination: "$HOME/.zshenv"
  config.vm.provision "file", source: "./data/code", destination: "$HOME/Documents/code"
  config.vm.provision "file", source: "./data/ctf", destination: "$HOME/Documents/ctf"
  config.vm.provision "shell", path: "./scripts/bootstrap.sh"
end
