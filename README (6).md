
# Kura Assignment - Suspicious Activity 

## Purpose
You are a Junior Security Analyst at Chase Bank, responsible for monitoring the bank's digital security infrastructure. Recently, you and your team has noticed an increase in suspicious login attempts on the main server. These incidents could indicate potential unauthorized access or brute-force attacks targeting customer accounts.

As part of the cybersecurity team, your task is to investigate these incidents by analyzing the authentication logs stored on the server. The log file (/var/log/auth_log.log) records all login attempts, and your job is to identify any entries that indicate suspicious login attempts.

Instructions: Run this script to create a auth_log file you will analyze. Develop a Bash script to analyze auth_log.logs. Your script should: 
- read through each line of the log file
- search for each keyword, which indicates potentially suspicious login attempts 
- if the line contains this keyword, write the line to a new file called suspicious_activity.log.
- Automate the script to run daily.

This file will store all the entries that match the criteria. 

## Downloading and Running Script

### Downloading Script

1. Download Github to the server to use the git clone command. 
        
        1. To clone a repository using GitHub CLI, click GitHub CLI, and copy the link.
        2. Open Terminal.
        3. Change the current working directory to the location where you want the cloned directory.
        4. Type git clone, and then paste the URL you copied earlier.
        5. Press enter to create your local clone.

2. Create an acess token for the GH CLI to connect to the account.

3. Change the permissions on the file using `chmod 755 FILENAME` so it is executable.

### Running Script

1. Navigate to the location of the script.

2. Use the `./SCRIPTNAME` command to execute the script.

## Analyzing Auth Log 

### Developing Bash Script

#### Read through each line of the log file

`/unauthorized|invalid/` is the pattern that awk is searching for in each line.
`{print NR, $0}` tells awk to print the line number (NR) followed by the entire line ($0).

> [!TIP]  
>To make the search case insensitive, use the IGNORECASE variable.


#### Search for each keyword, which indicates potentially suspicious login attempts 

To determine the keywords to choose, I looked at the context of the log file entries. For example, some entries are failed attempts from registered users while some failed attempts are from invalid users. This difference in user type is what indicate the nature of the activity compared the "Failue". 

`Jul 31 10:26:14 server sshd[1245]: Failed password for user8 from 192.168.1.10 port 22 ssh2`

**vs**

`33 Jul 31 10:21:57 server sshd[1240]: Failed password for invalid user admin from 192.168.1.6 port 22 ssh2`

#### Write the line to a new file called suspicious_activity.log and automate the script to run daily.

In the CronTab, I set the the script to run daily and append the results to the `suspicious_activity` log.

`30 18 * * * /home/ubuntu/scripts/suspicious_activity_daily.sh >> ~/scripts/suspicious_activity.log`


### Runnning Bash Script

The command to append to the file is only contained in the cronjob code, so to get our first suspicious activity log we have to update the cronjob time to the present time, then reset it to the desired time. 
