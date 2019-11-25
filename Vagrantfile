# -*- mode: ruby -*-
# vi: set ft=ruby :

# Every Vagrant development environment requires a box. You can search for
# boxes at https://atlas.hashicorp.com/search.
BOX_IMAGE = "ubuntu/bionic64"
SERVER_COUNT = 2

Vagrant.configure("2") do |config|
  config.vm.define "proxy" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "proxy"
    subconfig.vm.network :private_network, ip: "10.0.0.10"
    subconfig.vm.provision :ansible_local do |ansible|
      ansible.playbook = "provision/playbook.yml"
      ansible.inventory_path = 'inventory'
      ansible.limit = 'all'
    end
  end

  (1..SERVER_COUNT).each do |i|
    config.vm.define "host#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "host#{i}"
      subconfig.vm.network :private_network, ip: "10.0.0.#{i + 10}"
      subconfig.vm.provision :ansible_local do |ansible|
        ansible.playbook = "provision/playbook#{i}.yml"
        ansible.inventory_path = 'inventory'
        ansible.limit = 'all'
      end
     end 
    end
  end
# end
