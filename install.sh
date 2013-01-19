#!/bin/sh

# todos
# install mrun.pl user home dir
# rename mrun.pl rename to .mrun chmod 777
# 
# read default mrun.ls
# check if dir exist - error if not advised user creation or list changes
# install mrun.ls rename to .list
# for common existing backup schema like mysql,
# install.sh will create automatic mysql dir, and will install
# existing backup schema. .run and .list 
# while .list will be user input to know what db to be backup
# and to used its credentials. 
# for not common backup schema, feel free to create .run, and .list files
# from the directory you want to backup and how you
# want it to be backup.
# once its filename is .run and the directory is adde on the main list (.mlist/.list), 
# this will be scan and run by the .mrun 
