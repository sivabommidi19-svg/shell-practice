#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_Name.log"

mkdir -p $LOGS_FOLDER
echo "ERROR:: please run this script with root privelege"

if [ $USERID -ne 0 ]; then
    echo "Error:: please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # funsction receive the inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installing $2 ... $G is success $N"  | tee -a $LOG_FILE
    fi   
}

dnf list installed mysql &>>$LOG_FILE
#Install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e "MySQL Already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi
dnf list installed nginx &>>$LOG_FILE
#Install if it is not found
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "ngnix"
else
    echo -e "Nginx Already exist ... $Y SKIPPING $N"  | tee -a $LOG_FILE
fi
dnf list installed python3 &>>$LOG_FILE
#Install if it is not found
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "Python3 Already exist ... $Y SKIPPING $N"  | tee -a $LOG_FILE
fi