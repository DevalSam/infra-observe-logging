Having a completely secured connection between our servers is a priceless asset to any network connectivity 
therefore using a properly confifured secured shell connection is can not be too much to ask for in any 
network environment.

a proper teleport setup will give any business an edge as far as a secured shell connection is concerned, 
below are simple illustrations of we how can conveniently aqiure this great network security asset 


first you can do a one click set up if you use digitalocean as your provider.
log into your digitalocean account and complete the following steps 

1. click on the create button 

2. select droplet from the drop down menu 

3. under the choose an image section of page select the market place tab and "teleport" into the "search Keyword" textbox

4. click on the teleport option to inigtiate the setup process 

5. complete the setup process using your desired options for each section and click the "create droplet" 
   button to complete the process 
  

another way it can be done is by using an ansible playbook to initiate an installation from your workstation
to multiple servers at the same time.   

1. first ensure your ansible playbook is in the correct directory where all the necessary files are located 
   e.g your "hosts file" or your "evn. file" 

2. use the ansible-playbook playbook/teleport.yml command to run the playbook. 

for other variations of this installation process please you can visit the teleport official page https://goteleport.com/docs/installation/ 
