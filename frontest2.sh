LOG_FILE = tmp/frontend
echo Nginx installation in progress ......
yum list all | grep nginx &>>LOG_FILE
echo status = $?
yum install nginx -y &>>LOG_FILE
echo status = $?
echo installation going on
systemctl enable nginx
echo enabling nginx
echo status = $?
systemctl start nginx
echo starting nginx
echo status = $?
echo installation completed

