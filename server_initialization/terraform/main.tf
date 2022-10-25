

# #Creating Test Droplets as object for Monitoring

# resource "digitalocean_droplet" "web1" {
# image  = "ubuntu-20-04-x64"
# name   = "test_1"
# region = "nyc3"
# size   = "s-1vcpu-1gb"
# ssh_keys = ["36:e8:29:d1:5f:f1:f8:99:0c:49:42:f8:bb:e6:ea:a1"]
# }

# # resource "digitalocean_droplet" "web2" {
# # image  = "ubuntu-20-04-x64"
# # name   = "test_2"
# # region = "nyc3"
# # size   = "s-1vcpu-1gb"
# # ssh_keys = ["36:e8:29:d1:5f:f1:f8:99:0c:49:42:f8:bb:e6:ea:a1"]
# # }

# # resource "digitalocean_droplet" "web3" {
# # image  = "ubuntu-20-04-x64"
# # name   = "test_3"
# # region = "nyc3"
# # size   = "s-1vcpu-1gb"
# # ssh_keys = ["36:e8:29:d1:5f:f1:f8:99:0c:49:42:f8:bb:e6:ea:a1"]
# # }


# # Creating Loggong And Monitoring Droplets 

# # resource "digitalocean_droplet" "web4" {
# # image  = "ubuntu-20-04-x64"
# # name   = "monitoring"
# # region = "nyc3"
# # size   = "s-1vcpu-1gb"
# # ssh_keys = ["36:e8:29:d1:5f:f1:f8:99:0c:49:42:f8:bb:e6:ea:a1"]
# # }

# # resource "digitalocean_droplet" "web5" {
# # image  = "ubuntu-20-04-x64"
# # name   = "logging"
# # region = "nyc3"
# # size   = "s-1vcpu-1gb"
# # ssh_keys = ["36:e8:29:d1:5f:f1:f8:99:0c:49:42:f8:bb:e6:ea:a1"]
# # }


# # Creating a Droplet to host The Parachain Node

# # resource "digitalocean_droplet" "web" {
# # image  = "ubuntu-20-04-x64"
# # name   = "zeitgeist_para"
# # region = "nyc3"
# # size   = "s-4vcpu-8gb"
# # ssh_keys = ["36:e8:29:d1:5f:f1:f8:99:0c:49:42:f8:bb:e6:ea:a1"]             
# # }

# # resource "digitalocean_droplet" "web2" {
# # image  = "ubuntu-20-04-x64"
# # name   = "teleport"
# # region = "nyc3"
# # size   = "s-1vcpu-1gb"
# # ssh_keys = ["36:e8:29:d1:5f:f1:f8:99:0c:49:42:f8:bb:e6:ea:a1"]
# # }


# resource "digitalocean_firewall" "web" {
#   name = "only-22-80-and-443"



#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "22"
#     source_addresses = ["0.0.0.0/24", "2002:1:2::/48"]
#   }

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "80"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "443"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   inbound_rule {
#     protocol         = "icmp"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "tcp"
#     port_range            = "53"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "udp"
#     port_range            = "53"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "icmp"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }
# }
