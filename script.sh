#!/bin/bash
sudo dnf update -y
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello From Terraform EC2!</h1>" | sudo tee /var/www/html/index.html

