# -*- mode: ruby -*-
# vi: set ft=ruby :

# Every Vagrant development environment requires a box. You can search for
# boxes at https://atlas.hashicorp.com/search.
BOX_IMAGE = "ubuntu/bionic64"
SERVER_COUNT = 2

# Deploy the backend webservers assigning IP addresses from 10.0.0.11 onwards.
Vagrant.configure("2") do |config|
  (1..SERVER_COUNT).each do |i|
    config.vm.define "host#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "host#{i}"
      subconfig.vm.network :private_network, ip: "10.0.0.#{i + 10}"
      subconfig.vm.provision :ansible_local do |ansible|
        ansible.playbook = "provision/playbook-webserver.yml"
        ansible.inventory_path = 'inventory'
        ansible.limit = 'all'
      end
      # Run post-build tests to confirm service is up and page responding
      subconfig.vm.provision "shell", inline: "echo ********RUNNING TESTS AND SERVICE CHECKS********"
      subconfig.vm.provision "shell", inline: "ansible-playbook -i /vagrant/provision/roles/common/tests/inventory, /vagrant/provision/roles/common/tests/test.yml"
      subconfig.vm.provision "shell", inline: "echo ********TESTS AND SERVICE CHECKS COMPLETE********" 
    end
  end

# Deploy the frontend proxy server, setting IP address 10.0.0.10.
  config.vm.define "proxy" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "proxy"
    subconfig.vm.network :private_network, ip: "10.0.0.10"
    subconfig.vm.provision :ansible_local do |ansible|
      ansible.playbook = "provision/playbook-proxy.yml"
      ansible.inventory_path = 'inventory'
      ansible.limit = 'all'
    end
    # Run post-build tests to confirm service is up and page responding (load balancer works if it does)
    subconfig.vm.provision "shell", inline: "echo ********RUNNING TESTS AND SERVICE CHECKS********"
    subconfig.vm.provision "shell", inline: "ansible-playbook -i /vagrant/provision/roles/common/tests/inventory, /vagrant/provision/roles/common/tests/test.yml"
    subconfig.vm.provision "shell", inline: "echo ********TESTS AND SERVICE CHECKS COMPLETE********"
  end

end

