echo Installing Nginx
yum install nginx -y &>>/tmp/frontrnd

echo Downloading Nginx Web Content
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/frontrnd

cd /usr/share/nginx/html


echo Removing old web content
rm -rf *

echo Extracting Web Content
unzip /tmp/frontend.zip &>>/tmp/frontrnd

mv frontend-main/static/* .
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/frontrnd

echo Starting Nginx service
systemctl enable nginx &>>/tmp/frontrnd
systemctl restart nginx &>>/tmp/frontrnd
