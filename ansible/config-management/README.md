Role Name
=========

This role performs installation of docker and launches ngnix server on the container. The server can be accessed on port 80.

Requirements
------------
Ansible Master Server
AWS EC2
Ubuntu 18.04

Role Variables
--------------



Dependencies
------------
After provisioning of EC2 Server using Infra-management module, you should use your AWS Key to login into the EC2 Server.

Eg: ansible-playbook installdocker.yml  --private-key=xxx.pem -u ubuntu
--private-key should be your AWS pem key.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
