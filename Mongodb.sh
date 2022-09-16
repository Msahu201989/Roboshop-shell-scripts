LOG_FILE=/tmp/mongodb
echo "Setting MongoDB Repo"

curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE
echo status = $?

echo "Installing MongoDB Repo"
yum install -y mongodb-org &>>$LOG_FILE
echo status = $?

echo "update mongodb Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo status = $?

echo "Startiong mongodb service"
systemctl enable mongod &>>$LOG_FILE
systemctl restart mongod &>>$LOG_FILE
echo status = $?

echo "Downloading MongoDB Schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
echo status = $?


cd /tmp
echo "Extract Schema File"
unzip mongodb.zip &>>$LOG_FILE
echo status = $?



cd mongodb-main

echo "Load Catalogue Service Schema"
mongo < catalogue.js &>>$LOG_FILE
echo status = $?

echo "Load USers service Schema"
mongo < users.js &>>$LOG_FILE
echo status = $?

