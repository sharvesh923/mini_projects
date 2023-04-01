#!/bin/bash
# Update the machine
sudo apt-get update -y 
# Install Nginx
sudo apt-get install nginx -y
# Start Nginx
sudo systemctl start nginx
# Enable Nginx to start at boot
sudo systemctl enable nginx 
# # Adding permission to the html dir
sudo chmod -R 755 /var/www/html

# # cat command enter value in index.html file
# sudo sh -c "echo 'hello everyone online' > /var/www/html/index.nginx-debian.html"
# echo "<h1>Deployed via Terraform user_data</h1>" | sudo tee /var/www/html/index.nginx-debian.html
cat << EOF | sudo tee /var/www/html/index.nginx-debian.html
<div style="text-align: center;">
  <h1 style="color: black; animation: shine 2s ease-in-out infinite;">Deployed via Terraform user_data</h1>
  <h2 style="color: black; animation: shine 2s ease-in-out infinite;">By Sharvesh</h2>
</div>

<style>
@keyframes shine {
  from {text-shadow: none;}
  to {text-shadow: 0 0 10px black;}
}
</style>
EOF
sudo systemctl restart nginx