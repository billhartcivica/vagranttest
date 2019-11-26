# Demonstration of Vagrant and Ansible-Built HA Web Servers with Proxy
====================================================================

## Overview:

This repository contains the files required to automatically build a two-server HA cluster of NGinx
backend servers with an NGinx front-end proxy. The aim is to provision the proxy to act as the front-
end gateway to both backend web servers, ensuring that if one fails the other will continue to present
pages. Each web server is configured identically, using Ansible to configure/provision all host options
while Vagrant is the engine which handles deployment.

## Technical Detail:

The repository is made up of the following files:

- Vagrantfile (build definition)
- Ansible inventory file (contains target hosts for Ansible)
- Ansible playbooks - one for the proxy and one for any number of backend web servers (default: 2)
- Playbook roles subfolders (located under provision/roles)

## Prerequisites:

Before downloading this repository, ensure your machine has the following installed:

- Oracle Virtualbox - https://www.virtualbox.org/wiki/Downloads
- Vagrant - https://www.vagrantup.com/downloads.html

For performance, please ensure your machine is sufficiently powerful and has enough memory and disk 
capacity to run three virtual servers.

## Installation and Running

To install this example, clone this repository to your own Linux machine:

``` 
git clone https://github.com/billhartcivica/vagranttest.git
```

Navigate to the newly downloaded folder:
```
cd vagranttest
```

Assuming you have met the technical requirements (installed Vagrant and Oracle Virtualbox), all that is 
needed is to run 'vagrant up'.

After a period of about 5 to 6 minutes, the server cluster should be up and running. Open your browser
and enter 'http://10.0.0.10' in the address bar and press <enter>. You should see the following:

![alt text](./hello.png)
 
## Further Technical Details:

The process of creating the cluster is as follows:

- Vagrant initiates the build, using the directives found in the Vagrantfile in the root of this repository.
- The first machine, the web proxy, is created and Ansible installed locally on that host.
- Ansible is started and the playbook for the proxy is run. This calls on the 'role' for the proxy (proxy)
  which contains the tasks as well as the configuration files required to be copied to the host.

 
