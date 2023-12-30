#!/bin/bash

ansible all -m yum -a "name=httpd"
ansible all -m service -a "name=httpd state=started enabled=true"
ansible all -m user -a "name=anna"
ansible all -m copy -a "src=/etc/hosts dest=/tmp"