

#9.  	Set up HTTPS and Basic Authentication for Prometheus using Nginx and Certbot. This is to ensure that Prometheus is secure at all times.
#10. 	Set up HTTPS Grafana endpoints using Nginx and Certbot. This is to ensure that Grafana is secure at all times.


                                ####################### THIS TWO WILL BE TREATED AS ONE ############################

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
