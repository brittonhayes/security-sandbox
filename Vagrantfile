# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Kali Box
  config.vm.define "kali", primary: true do |kali|
    kali.vm.box = "kalilinux/rolling"
    kali.vm.hostname = "kali.local"

    # Provision
    kali.vm.provision "shell", inline: <<-SCRIPT
    sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt-get update
    sudo apt-get install -y \
        golang-go \
        tldr \
        httpie

    SCRIPT

    # Setup directory structure
    kali.vm.provision "file", source: "data/code", destination: "$HOME/code"
    kali.vm.provision "file", source: "data/ctf", destination: "$HOME/ctf"
    kali.vm.post_up_message = "Welcome to Kali Linux by Offensive Security. Enjoy your stay."
  end
  
  # JUICESHOP
  config.vm.define "juiceshop", autostart: false do |juiceshop|
    juiceshop.vm.box = "ubuntu/xenial64"
    juiceshop.vm.hostname = "juice.sh"
    juiceshop.vm.network "private_network", ip: "192.168.33.10"
    juiceshop.vm.provision "file", source: ".provision/www/default.conf", destination: "/tmp/juice-shop/default.conf"
    juiceshop.vm.provision :shell, path: ".provision/juiceshop.sh"

    juiceshop.vm.post_up_message = "View this machine at http://192.168.33.10"
  end

  # DAMN VULNERABLE WEB APP
  config.vm.define "dvwa", autostart: false do |dvwa|
    dvwa.vm.box = "ubuntu/xenial64"
    dvwa.vm.hostname = "dvwa.local"
    dvwa.vm.network "private_network", ip: "192.168.33.20"
    dvwa.vm.provision "docker" do |d|
      d.run "vulnerables/web-dvwa",
        args: "-p 80:80"
    end

    dvwa.vm.post_up_message = "View this machine at http://192.168.33.20"
  end

  # METASPLOITABLE
  config.vm.define "metasploitable", autostart: false do |metasploitable|
    metasploitable.vm.box = "ubuntu/xenial64"
    metasploitable.vm.hostname = "metasploitable.local"
    metasploitable.vm.network "private_network", ip: "192.168.33.30"
    metasploitable.vm.provision "docker" do |d|
      d.run "vulnerables/metasploit-vulnerability-emulator",
        args: "-P"
    end

    metasploitable.vm.post_up_message = "View this machine at http://192.168.33.30"
  end
end
