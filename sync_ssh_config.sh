#!/bin/bash
clear
################################################################
##
##   SSH config syncer
##   Written By: Hamid Teimouri
##
############################# Variable ##########################
TODAY=`date +"%Y/%m/%d"`
TIME=`date +" %H:%M"`
SSH_DIRECTORY=~/.ssh
#################################################################


echo -e "\033[3;32m Syncing ssh config... \033[0m";
echo -e "\033[3;32m ${TODAY} - ${TIME} \033[0m";


if [[ ! -d $SSH_DIRECTORY ]]
then
    echo -e "\033[31m $SSH_DIRECTORY does not exist on your filesystem. \033[0m"
    exit
fi
echo -e "\033[33m - changing directory into $SSH_DIRECTORY \033[0m";

# shellcheck disable=SC2164
cd $SSH_DIRECTORY

echo -e "\033[33m - pulling changes from Git... \033[0m";
git pull origin main

echo -e "\033[33m - adding changes... \033[0m";
git add .
git commit -m "added"
git push origin main

echo -e "\033[3;32m Successfully done! \033[0m";