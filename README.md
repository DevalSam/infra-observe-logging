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
     









