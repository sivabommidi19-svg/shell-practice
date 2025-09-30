#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "Error:: please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # funsction receive the inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ... $G is success $N" 
    fi   
}

dnf list installed mysql
#Install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "MySQL Already exist ... $Y SKIPPING $N"
fi
dnf list installed nginx
#Install if it is not found
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "ngnix"
else
    echo -e "Nginx Already exist ... $Y SKIPPING $N"
fi
dnf list installed python3
#Install if it is not found
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "Python3 Already exist ... $Y SKIPPING $N"
fi