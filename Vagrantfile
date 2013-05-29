# -*- mode: ruby -*-
# vi: set ft=ruby :

# loading configuration from file config.rb when exists otherwise
# setup defualt values
load 'config.rb' if File.exists?('config.rb')

# Set defaults for configs not explicitly set.
FORWARD_PORTS ||= {80 => 8080, 443 => 8443}
ROLE ||= 'plain'
COUNT ||= ''
DB_ROOT_PASSWORD ||= "rootpass"
DB_REPL_PASSWORD ||= "replpass"
DEBIAN_PASSWORD ||= "debpass"
DRUPAL_PASSWORD ||= "drupalpass"

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.hostname = "nodejs-vm.itagenten"
  
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "https://raw.github.com/gmoigneu/vagrant-debian-wheezy-box/master/debian-70.box"

  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network

  # manage /etc/hosts on guest OS and host vagrant plugin install vagrant-hostsupdater
  # install: vagrant gem install vagrant-hostsupdater

  config.vm.hosts.aliases = %w(example.com)

  FORWARD_PORTS.each do |src, dest|
    config.vm.network :forwarded_port, guest: src, host: dest
  end

  ## This is what configuration will be copied to the Vagrant
  config.vm.synced_folder "srv/", "/srv/"

  config.vm.provision :salt do |salt|
    salt.minion_config = Dir.pwd + "/srv/salt/minion.conf"
    salt.run_highstate = true
    salt.salt_install_type = "stable"
  end

  # Done
  config.vm.provision :shell, :inline => 'cowsay "Your virtual machine is ready!"'

  # VirtualBox
  config.vm.provider :virtualbox do |vb|
    # Boot with a GUI so you can see the screen. (Default is headless)
    # vb.gui = true
    # Customize the VitualBox VM
    vb.customize ['modifyvm', :id, '--name', 'itagenten.vm.nodejs']    
  end
end
