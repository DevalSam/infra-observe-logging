


#14. 	create Digital ocean Firewall resource using Terraform, to allow inbound and outbound connections to the specified ports to the 
	Monitoring, Logging, and Zeitgeist node.      
  
    
	# First we have to create a firewall but implement the inbound and outbound rules in the configuration setup at once 
	
	#Below are the creation and configuration setups
	
	#Update your variables.tf file with the following lines
	
	variable "source_addresses" {
	  description = "inbound_rules"
	}

	variable "destination_addresses" {
	  description = "outbound_rules"
	}     
	
	
	#Also update your terraform.tfvars with lines below
	
	source_addresses = ["167.172.235.140/32","174.138.49.236/32","138.197.14.244/32"]

	destination_addresses = ["167.172.235.140/32","174.138.49.236/32","138.197.14.244/32"]	
	
	#Finally the main.tf 
	
	resource "digitalocean_firewall" "web" {
  name = "only-22-80-and-443"



  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/24", "2002:1:2::/48"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}	
