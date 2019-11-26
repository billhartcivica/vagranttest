Demonstration of Vagrant and Ansible-Built HA Web Servers with Proxy
====================================================================

Overview:

This repository contains the files required to automatically build a two-server HA cluster of NGinx
backend servers with an NGinx front-end proxy. The aim is to provision the proxy to act as the front-
end gateway to both backend web servers, ensuring that if one fails the other will continue to present
pages. Each web server is configured identically, using Ansible to configure/provision all host options
while Vagrant is the engine which handles deployment.

Technical Detail:

The repository is made up of the following files:

- Vagrantfile (build definition)
- Ansible inventory file (contains target hosts for Ansible)
- Ansible playbooks - one for the proxy and one for any number of backend web servers (default: 2)
- Playbook roles subfolders (located under provision/roles)

Prerequisites:

Before downloading this repository, ensure your machine has the following installed:

- Oracle Virtualbox - link
- Vagrant - link

For performance, please ensure your machine is sufficiently powerful and has enough memory and disk 
capacity to run three virtual servers.

 
