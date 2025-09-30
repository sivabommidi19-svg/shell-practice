#! /bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error:: please run this script with root privelege"
    exit 1 # failure is other than 0
fi
VALIDATE(){ # funsction receive the inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo "Error:: Installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is success" 
    fi   
}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "ngnix"

dnf install python3 -y
VALIDATE $? "python3"