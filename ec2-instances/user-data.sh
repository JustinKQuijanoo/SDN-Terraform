#!/bin/bash
###
# Author: Justin Quijano
# Class: TELE36058 Software Defined Networks
# Lab 3 - Terraform
###

# install nginx webserver  
sudo yum install nginx -y

# create index.html file 
cd /var/www/html
echo "<html><body><h1>Hello from Justin Quijano at $(hostname -f)</h1></body></html>" > index.html

# restart and enable nginx service
systemctl restart nginx
systemctl enable nginx