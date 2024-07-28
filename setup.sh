#!/bin/bash

sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo bash -c 'echo "<html><body style=\"background-color: 47D34F;\"><h1><p> Welcome to Utrains the place for jaelyn to practice, Cloud, Linux!!.<br> This traf
OneStar is amazing: <span style=\"color: purple;\">${HOSTNAME}</span> </p></h1></body></html>" > /var/www/html/index.html'