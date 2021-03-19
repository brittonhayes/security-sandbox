# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Kali Box
  config.vm.define "kali", primary: true do |kali|
  	kali.vm.provider "virtualbox" do |v|
  		v.name = "kali"
		v.memory = 4096
		v.cpus = 2
  	end

    kali.vm.box = "kalilinux/rolling"
    kali.vm.hostname = "kali.local"
    
    # Install tools
    kali.vm.provision "shell" do |s|
      s.inline = "sudo apt-get install -y $1"
      s.args = "golang-go tldr httpie jq yq tor"
    end
    
    # Start services
    kali.vm.provision "shell", type: "shell", run: "always" do |s|
      s.inline = "systemctl start tor"
    end

    # Setup directory structure
    kali.vm.provision "file", source: "data/code", destination: "$HOME/code"
    kali.vm.provision "file", source: "data/ctf", destination: "$HOME/ctf"
    kali.trigger.after :up do |trigger|
      trigger.info = "Updating tldr"
      trigger.run = { inline: "tldr -u" }
    end

    kali.vm.post_up_message = "Welcome to Kali Linux by Offensive Security. Enjoy your stay."
  end
  
  # JUICESHOP
  config.vm.define "juiceshop", autostart: false do |juiceshop|
  	juiceshop.vm.provider "virtualbox" do |v|
  		v.name = "juiceshop"
		v.memory = 2048
  	end
  
    juiceshop.vm.box = "ubuntu/xenial64"
    juiceshop.vm.hostname = "juice.sh"
    juiceshop.vm.network "private_network", ip: "192.168.33.20"
    juiceshop.vm.provision "file", source: ".provision/www/default.conf", destination: "/tmp/juice-shop/default.conf"
    juiceshop.vm.provision :shell, path: ".provision/juiceshop.sh"

    juiceshop.vm.post_up_message = "View this machine at http://192.168.33.20"
  end

  # DAMN VULNERABLE WEB APP
  config.vm.define "dvwa", autostart: false do |dvwa|
  	dvwa.vm.provider "virtualbox" do |v|
  		v.name = "dvwa"
		v.memory = 2048
  	end

    dvwa.vm.box = "ubuntu/xenial64"
    dvwa.vm.hostname = "dvwa.local"
    dvwa.vm.network "private_network", ip: "192.168.33.30"
    dvwa.vm.provision "docker" do |d|
      d.run "vulnerables/web-dvwa",
        args: "-p 80:80"
    end

    dvwa.vm.post_up_message = "View this machine at http://192.168.33.30"
  end

  # METASPLOITABLE
  config.vm.define "metasploitable", autostart: false do |metasploitable|
  	metasploitable.vm.provider "virtualbox" do |v|
  		v.name = "metasploitable"
		v.memory = 4096
  	end
  	
    metasploitable.vm.box = "ubuntu/xenial64"
    metasploitable.vm.hostname = "metasploitable.local"
    metasploitable.vm.network "private_network", ip: "192.168.33.40"
    metasploitable.vm.provision "docker" do |d|
      d.run "vulnerables/metasploit-vulnerability-emulator",
        args: "-P"
    end

    metasploitable.vm.post_up_message = "View this machine at http://192.168.33.40"
  end
end
