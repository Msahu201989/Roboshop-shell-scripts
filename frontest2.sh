#!

set-hostname Frontend
yum list all | grep nginx
yum install nginx
systemctl enable nginx
systemctl start nginx

echo installation completed