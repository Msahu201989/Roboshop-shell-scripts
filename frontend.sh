LOG_FILE=/tmp/frontrnd

echo Installing Nginx
yum install nginx -y &>>$LOG_FILE
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

mv frontend-main/static/* . &>>$LOG_FILE
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE
echo status = $?

echo Starting Nginx service
systemctl enable nginx &>>$LOG_FILE
systemctl restart nginx &>>$LOG_FILE
echo status = $?