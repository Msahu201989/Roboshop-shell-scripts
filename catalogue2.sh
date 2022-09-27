LOG_FILE= /tmp/frontend
echo downloading package
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>LOG_FILE
echo installing Nodejs
yum install nodejs -y &>>LOG_FILE
echo status = $?
echo Nodejs Installation completed
echo creating roboshop user
useradd roboshop
echo switing to roboshop user
su roboshop
echo status = $?
echo downloading package
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>LOG_FILE
echo status = $?
cd /home/roboshop
echo unzipping catalogue
unzip /tmp/catalogue.zip &>>LOG_FILE
mv catalogue-main catalogue
cd /home/roboshop/catalogue
echo installing depedndencies
npm install &>>LOG_FILE
echo installation completed
