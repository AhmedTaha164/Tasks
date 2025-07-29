#!/bin/bash

useradd devopstask
userdel devopstask

touch newfile
chmod 733 newfile
chmod u=rwx,g=rw,o= newfile

ls -la

find . -name "newfile"

date >> newfile1

cat newfile1

alias p='pwd'

p

cp newfile1 /home/ahmed-taha

mv newfile /home/ahmed-taha

touch test1

mv test1 file1

mkdir newdir

rmdir newdir

su taha
