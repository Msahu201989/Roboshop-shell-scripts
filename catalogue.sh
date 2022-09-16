LOG_FILE=/tmp/catalogue




echo "Setup Nodejs Repo"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit 1
   fi
echo status = $?

echo "Installing NodeJs"
yum install nodejs -y &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit 1
   fi

id roboshop &>>${LOG_FILE}
fi[ $? -ne 0 ] then
echo "Creating user Roboshop"
useradd roboshop &>>${LOG_FILE}
   if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit 1
   fi
fi

echo "Downloding Catalogue Application code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit 1
   fi

cd /home/roboshop

echo "Extracting Catalogue Application code"
unzip /tmp/catalogue.zip &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit 1
   fi

echo "Moving Files to Catalogue"
mv catalogue-main catalogue
cd /home/roboshop/catalogue
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit 1
   fi

echo "Installing NodeJs Dependencies"
npm install &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit 1
   fi

echo "Setup Catalogue service"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit 1
   fi

systemctl daemon-reload &>>${LOG_FILE}
systemctl enable catalogue &>>${LOG_FILE}

echo "start catalogue service"
systemctl start catalogue &>>${LOG_FILE}
if [ $? -eq 0 ]; then
  echo Status = Success
  else
   echo Status = Failure
   exit 1
   fi
