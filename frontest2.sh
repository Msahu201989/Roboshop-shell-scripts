
yum list all | grep nginx
yum install nginx -y &>>/tmp/frontend
systemctl enable nginx
systemctl start nginx

echo installation completed