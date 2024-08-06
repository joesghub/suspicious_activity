#!/bin/bash

#read through each line of the log file

 #awk 'BEGIN {IGNORECASE=1} /unauthorized | invalid/ {print NR, $0}' /var/log/auth_log.log

#search for each keyword, which indicates potentially suspicious login attempts 
	#unauthorized, invalid 

#if the line contains this keyword, write the line to a new file called suspicious_activity.log
	# >> suspicious_activity.log

#Cronjob instruction to Automate the script to run daily.
	# 30 18 * * * /home/ubuntu/scripts/suspicious_activity_daily.sh >> ~/scripts/suspicious_activity.log


awk 'BEGIN {IGNORECASE=1} /unauthorized|invalid/ {print NR, $0}' /var/log/auth_log.log
