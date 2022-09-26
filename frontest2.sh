echo Nginx installation in progress ......
yum list all | grep nginx &>>/tmp/frontend
echo status = $?
yum install nginx -y &>>/tmp/frontend
echo status = $?
echo installation going on
systemctl enable nginx
echo enabling nginx
echo status = $?
systemctl start nginx
echo starting nginx
echo status = $?

echo installation completed