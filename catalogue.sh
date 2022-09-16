LOG_FILE=/tmp/catalogue

echo "Setup Nodejs Repo"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit
   fi
echo status = $?

echo "Installing NodeJs"
yum install nodejs -y &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit
   fi

echo "Creating user Roboshop"
useradd roboshop &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit
   fi

echo "Downloding Catalogue Application code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit
   fi

cd /home/roboshop

echo "Extracting Catalogue Application code"
unzip /tmp/catalogue.zip &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit
   fi

echo "Moving Files to Catalogue"
mv catalogue-main catalogue
cd /home/roboshop/catalogue
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit
   fi

echo "Installing NodeJs Dependencies"
npm install &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit
   fi

echo "Setup Catalogue service"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit
   fi

systemctl daemon-reload &>>${LOG_FILE}
systemctl enable catalogue &>>${LOG_FILE}

echo "start catalogue service"
systemctl start catalogue &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit
   fi
