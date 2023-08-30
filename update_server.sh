#!/ban/bash

###############################################################
#CREATED BY:  ANNIE V LAM
#DATE:  2023-08-27
#
#PURPOSE:  Automate server update every Friday at 2300
#
###############################################################

#To get today's date
today=$(date +'%Y.%m.%d')

#To update and put the number of packages available for update in a log with date 
sudo apt update 2>&1|grep " packages " >> /home/ubuntu/Build_Script_1/log/update_$today.log 

#This is a contingency to also execute an upgrade and append the number of packages updated  in a log with date  
sudo apt upgrade 2>&1|grep " upgraded" | cut -d "," -f 1 >> /home/ubuntu/Build_Script_1/log/update_$today.log

#To make sure all users have access to execute the update_server.sh script
#$sudo chmod 777 /home/ubuntu/Build_Script_1/update_server.sh

#To make sure Root user has access to all the following folders/files 
#$cd ~
#$cd Build_Script_1
#$mkdir log
#$sudo chmod 777 Build_Script_1/
#$sudo chown root:root Build_Script_1/
#$cd log
#$sudo chmod 777 log/
#$sudo chown root:root log/

#Open the crontab file 
#$sudo crontab -e

#The schedule to execute  a shell script every Friday at 11pm EST or 3am UTC time and to redirect standard errors into  a log file
##0 3 * * 5 bash /home/ubuntu/Build_Script_1/update_server.sh > /var/log/build_script_log.log 2>&1

exit 0
