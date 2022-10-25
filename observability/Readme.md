since the whole essence of having observebility is make sure nothing goes wrong without our notice 

This part of our journey wiil have a lot to do with a broad overview of our entire network infrastructure 
and how we can have our eyes on things

1. first to ensure we run into trouble with using our alocated space on the server we're going to have to set up a log retention
   the log retention file can be found in our logging directory inside our ansible directory but we're just going to leave copy here 
   for reference purpose. refer to log_retention.ynl 

2. Create Grafana Loki Datasource on Grafana.
   
   # To setup a loki data source on grafana we can complete the task through the steps below 
	
	
  #1 From the grafana cloud portal log into your grafana cloud instance, and this will bring you to the grafana cloud instance homepage. 
	
  #2 Select the gear ⚙️  or cog icon on the left hand side of the screen and then select data source
	
  #3 Click on add-datasoure to add Loki as a data source or select Loki from the pre-configured data sources.
	
  #4 Set the URL and port number e.g http://174.138.49.236:3100 click on save and test, and this should add Loki as a data source.
	
  #5 Now we can head over to the explore tab at the left pane to see what is being scraped.

 
3. Create Grafana dashboards for visualising CPU utilisation for each test instances and zeitgeist parachain. 
   Create Grafana dashboards for visualising Memory utilisation for each test instances and zeitgeist parachain.
   Create Grafana dashboard for visualising Zeitgeist metrics.


                                                ############# 1. ############
                                                            
	# Ensure that node-exporter and Prometheus are properly installed, configured and running on the servers or applications 
	  you intend to obsreved.  
	
	# Head over to your grafana dashboard and add promotheus as a datasource you'd like to create a dashboard for 
	
	# fill in the URL box with http://your_monitoring_server_IP:port9090
	
	# at this point you can either create or import an already developed dashboard suitable for the data/metrics you'd like to observe
	
	                                       ############## 2. #############
	
	# To create a new dashboard from scratch click on add new panel
	
	# First select the type of visualization preferred ( we'll go with a graph for this first one ) 
	
	# now select a datasource whcih in this case should be prometheus, since it has our node exporter plugged in
	
	# time to fill in the metrics which in this case is for our virtual machines total CPU time in seconds 
	
	# in the metrics box type in the desired type of metrics and add more panels as required and so on
	
	                                 
	 
	# we can import a dashboard by clicking on "import" then either browse through or put in a number for prefered dashboard template 
