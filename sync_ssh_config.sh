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
#################################################################


echo -e "\033[3;32m Syncing ssh config... \033[0m";
echo -e "\033[3;32m ${TODAY} - ${TIME} \033[0m";

cd ~/.ssh2 || exit

echo -e "\033[33m - pulling changes... \033[0m";
git pull origin main

echo -e "\033[33m - adding changes... \033[0m";
git add .
git commit -m "added"
git push origin main

echo -e "\033[3;32m Successfully done! \033[0m";