#!/bin/sh

export WEB_SERVER_COUNT=2
echo "#####################################################################"
echo "# Example of an Ansible build script from within Vagrant, to build  #"
echo "# a frontend proxy server and two backend web servers, presenting a #"
echo "# simple 'Hello World' page, driven by a PHP backend process.       #"
echo "#####################################################################"

envsubst < "Vagrantfile.tmp" > "Vagrantfile" 
# Start deployment...
echo "Starting up cluster..."
vagrant up

vagrant ssh -c 'ansible-playbook -i /vagrant/provision/roles/common/tests/inventory, /vagrant/provision/roles/common/tests/test.yml' proxy
vagrant ssh -c 'ansible-playbook -i /vagrant/provision/roles/common/tests/inventory, /vagrant/provision/roles/common/tests/test.yml' host1
vagrant ssh -c 'ansible-playbook -i /vagrant/provision/roles/common/tests/inventory, /vagrant/provision/roles/common/tests/test.yml' host2

echo "#####################################################################"
echo "#                                                                   #"
echo "# Tests complete.                                                   #"
echo "#                                                                   #"
echo "#####################################################################"


