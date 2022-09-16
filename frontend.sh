echo Installing Nginx
yum install nginx -y &>>/tmp/frontrnd
echo status = $?

echo Downloading Nginx Web Content
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/frontrnd
echo status = $?

cd /usr/share/nginx/html


echo Removing old web content
rm -rf *
echo status = $?

echo Extracting Web Content
unzip /tmp/frontend.zip &>>/tmp/frontrnd
echo status = $?

mv frontend-main/static/* . &>>/tmp/frontrnd
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/frontrnd
echo status = $?

echo Starting Nginx service
systemctl enable nginx &>>/tmp/frontrnd
systemctl restart nginx &>>/tmp/frontrnd
echo status = $?