Here are the steps to get the script properly implemented 

1. Ensure you have an SSL certificate already setup 

2. Edit the auto_renew.sh file by changing the 
   crontab -l to crontab-e to enble editing, 
   then creat the crontab file as shown below 
	
   #The following is a scheduled command for the constant 
   #checking and update of the cerbot SSL certificate to 
   #be triggered on the 15th day of every month with effect 
   #from the day this file was created. 
   # 
   # m h  dom mon dow   command
   0 0 15 * 1 /usr/bin/certbot renew -n -q
3. Edit the auto_renew.sh file again to change the -e back 
   to to crontab -l, save and then run the bash auto_renew.sh
