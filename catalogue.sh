LOG_FILE=/tmp/catalogue

echo "Setup Nodejs Repo"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${LOG_FILE}
echo status = $?

echo "Installing NodeJs"
yum install nodejs -y &>>${LOG_FILE}
echo status = $?

echo "Creating user Roboshop"
useradd roboshop &>>${LOG_FILE}
echo status = $?

echo "Downloding Catalogue Application code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>${LOG_FILE}
echo status = $?

cd /home/roboshop

echo "Extracting Catalogue Application code"
unzip /tmp/catalogue.zip &>>${LOG_FILE}
echo status = $?

echo "Moving Files to Catalogue"
mv catalogue-main catalogue
cd /home/roboshop/catalogue
echo status = $?

echo "Installing NodeJs Dependencies"
npm install &>>${LOG_FILE}
echo status = $?

echo "Setup Catalogue service"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
echo status = $?

systemctl daemon-reload &>>${LOG_FILE}
systemctl enable catalogue &>>${LOG_FILE}

echo "start catalogue service"
systemctl start catalogue &>>${LOG_FILE}
echo status = $?
