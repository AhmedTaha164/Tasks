#!/bin/bash

useradd devopstask  #adding new user
userdel devopstask  #deleting the user

touch newfile  #create new file
chmod 733 newfile # chnge pirmission for the file 
chmod u+rwx,g+rw,o-rwx newfile

ls -la # list all the files in the dir

find . -name "newfile"  #search for the file in  the current dir

date >> newfile1 #printing the date in the file

cat newfile1 #showing the content of the file

alias p='pwd' #making alias for pwd command

p #show current dir

cp newfile1 /home/ahmed-taha #copy file for the new dir

mv newfile /home/ahmed-taha #move file to for the new dir

touch test1 #create new file

mv test1 file1 #rename the file

mkdir newdir #making new dir

rmdir newdir #removing dir

su taha #switch user
