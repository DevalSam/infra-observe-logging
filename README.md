# Server_observebility_test

the purpose of the whole setup is to illustrate the reality of an everyday business with
an observability as code.


There will be detailed directions on every single action steps you will need in order to complete the 
required task in each directory 

the task will be completed in seven different sections namely:

1. server initialization:- 
   
   * create 2 or 3 test instances using terraform 
   * create monitoring and logging instances using terraform
   * create another instance to deploy zeitgeist parachain
   * create systemd service to run the parachain node in the background 
     (readme included for further directions)
   
   
2. dependencies:- 

   * install docker and docker-compose on previously created monitoring and 
     logging instances using ansible 
     
   * install promtail configurations on the test and Zeitgeist parachain 
     instances using ansible 
     
   * deploy prometheus, grafana, and alert-manager docker-compose configurations
     to the monitoring instance using ansible, then start the container using the 
     {docker-compose up -d} command
     
   * deploy grafana loki docker-compose configuration to logging instance using 
     ansible
     
      
3. reverse proxy:-

   * setup https and basic auth for prometheus and grafana 
   
   # To get this right we need to put a couple of things in place we need to ensure we have a domain name 
          set with our ipdress included in an A record
          
        # log into the server where you intend to have the task done in and do the following 
   
   
        #Install Nginx

        sudo apt update
        sudo apt install nginx
        
        
   # After you have installed NGINX, you can find the configuration files in the /etc/nginx folder.

  #  Use NGINX as a reverse proxy
  #  To enable the reverse proxy feature in NGINX, we will create a new default configuration file in the /etc/nginx/sites-enabled directory.

  # Note, you should never allow direct access to your app, otherwise, users could possibly just bypass the reverse proxy. I’ve changed the    
  # listening address from 0.0.0.0 to 127.0.0.1, that our app is only accepting connections from localhost.

server {
        listen 80 default_server;
        listen [::]:80 default_server;

        server_name yourservername.com;

        location / {
             proxy_pass http://prometheus_ip:9090;
             proxy_set_header Host $host
       }
}


       #Step 03: Config Nginx Virtual Host 
       #Now you need to modify the default vhost file of Nginx, go ahead and type
       
       #-Now enable Nginx service at boot, go ahead and type

	sudo systemctl enable nginx.service
	sudo service nginx restart.

        sudo nano /etc/nginx/sites-available/default
        
       #Scroll down a little bit here you will find the virtual host configuration. Uncomment the lines. After that, move to the server name 
       #swap with the name of your first application server
       
       
        server {
        listen 80;
        listen [::]:80;

        server_name wordtest.xyz;

        root /var/www/example.com;
        index index.html;
        location / {
                proxy_pass htto://167.172.235.140:9090;
                proxy_set_header Host $host;
        }
}

  server {
        listen 80;
        listen [::]:80;

        server_name grafana.wordtest.xyz;

        root /var/www/example.com;
        index index.html;
        location / {
                proxy_pass htto://167.172.235.140:3000;
                proxy_set_header Host $host;
        }
}

        
       #You need to change the server name and server IP. After that, you need to save the config file and restart the 
        Nginx server.

       sudo service nginx restart
		
	
	
	#Add trusted SSL Certificates from Letsencrypt
	#Now, let’s obtain trusted HTTPS certificates for our application. It’s also best practice to redirect all unencrypted HTTP connections 
	to	
	#HTTPS. This is relatively easy with certbot and letsencrypt certificates. The certbot will obtain free certificates and also handle the 
	#renewal process automatically. To do that we will install certbot and also a plugin for our NGINX server.

        sudo apt install certbot python3-certbot-nginx
        
           
    
    
	 #Once we have installed those packages, we can obtain our certificates.

	sudo certbot --nginx -d yourservername.com
	# like in our case, we can go ahead to obtain the certificate for two differnt domains
	# E.g sudo cerbot --nginx - wordtest.xyz -d grafana.wordtest.xyz
	
 	#It will ask you if you want to redirect all traffic from HTTP to HTTPS. Select yes (2). This automatically makes some changes to our 
 	NGINX 
	default configuration.


	(optional) Test auto-renewal
	certbot renew --dry-run	
   
   
   
   
4. observebility:-

   * setting up log retention for grafana loki indexes and chunks with 
     s3-compatible object storage 
     
   * create a grafana loki data source on grafana 
   
   * create grafana dashboards for visualizing CPU utilizations for each
     test instance and zeitgeist parachain
     
   * create grafana dashboards for visualizing memory utilizations for each
     test instance and zeitgeist parachain
     
   * create grafana dashboards for visualizing zeitgeist metrics
   

5. disaster recovery:-

   * install restic on all instances using ansible to backup each instance data
     on an object storage
     
     
6. static analysis:- 

   * write hadolint github action to lint docker files in github actions 
     pipeline
     
   * scan docker images for vulnerabilities with trivy github action in the 
     pipeline 
     
7. secure ssh using teleport:-

   * create a bastion host to restrict ssh access to instances using teleport 
   
   * write ansible playbook to install the teleport agent on each instance 
   
   
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
   
     









