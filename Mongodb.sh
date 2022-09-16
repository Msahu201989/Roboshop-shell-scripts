LOG_FILE=/tmp/mongodb
echo "Setting MongoDB Repo"

curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE
echo status = $?

echo "Installing MongoDB Repo"
yum install -y mongodb-org &>>$LOG_FILE
echo status = $?

echo "Startiong mongodb service"
systemctl enable mongod &>>$LOG_FILE
systemctl start mongod &>>$LOG_FILE
echo status = $?



