#!/bin/bash
apt-get update
apt-get install nginx -y
systemctl start nginx
systemctl enable nginx
echo "<h1> Terraform Welcome </h1>" | sudo tee /var/www/html/index.html

#user_data = <<-EOF
#!/bin/bash
#sudo apt update -y
#sudo apt install -y apache2
#sudo systemctl start apache2
#sudo systemctl enable apache2
#echo "<h1>Welcome to My Apache Server</h1>" | sudo tee /var/www/html/index.html
#EOF