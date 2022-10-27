A digitalocean account will be needed in order to complete this set of tasks successfully 

serveral servers will be needed and created before the end of this moudle 
to get things done properly all the commands have been hashed out and can be activated as time goes on

1. first thing will be to get all our ip-addresses, access keys and ssh public keys froms our provider 

2. then after properly setting up the variables.tf and the terraform.tfvars files we can spin up the initial servers 

3. for more details on how to get things done properly you can lookup https://docs.digitalocean.com/tutorials/

4. additional directions on how to clone the zeitgiest repository can be found below:

	one of our major aims for this whole set up was to illustrate observebilty for an everyday business scenario 
	so to get that properly done we'll have to replicate a real world business which is why we'll be cloning a  real 
	business on this task.

	The following steps are to be followed carefully after a server for cloning of the zeitgeist parachain node have been created
	as directed in the main.ft file of the terraform directory 

	 ssh into the remote machine e.g ssh -i /.ssh/id_rsa root@<ip address>, then:
		 
	 Run the command sudo apt-get update && sudo apt-get upgrade -y
		 
	 # Install rust by going to rustup.rs and copying the following:
	   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	 # Next update rust nightly
	   rustup update nightly

	 # Next
	   rustup default nightly 
		 
	 # Next
	   rustup target add wasm32-unknown-unknown --toolchain nightly 

	 # Next
	   sudo apt install make clang pkg-config libssl-dev git cmake 

	 # clone the code locally and checkout latest version
	   git clone https://github.com/zeitgeistpm/zeitgeist.git --depth 1 --branch latest

	 # change directory
	   cd zeitgeist
		  
	 # use the initializer script
	  ./scripts/init.sh
		  
	 # After initializing you can then start building by using the cargo command:
	   cargo build --release --features parachain --bin zeitgeist
		  
	 # Next is the cargo run 
	   cargo run --release --bin zeitgeist -- --dev

	Further directions can be found in the parachain_systemd.service file.
	
	
	
	
		    ############# Finally the systemd service: #############
		From the home directory run the following commands 
		
   	#Create a new user (without a home folder) and disable login for that user:
		
	sudo useradd -M -r -s /sbin/nologin zeitgeist 
	sudo mkdir -p /services/zeitgeist/bin
	sudo cp /path/to/your/target/release/zeitgeist /services/zeitgeist/bin
	sudo chown -R zeitgeist:zeitgeist /services/zeitgeist
	sudo chmod -R go=-rwx /services/zeitgeist
	  
	sudo nano /etc/systemd/system/zeitgeist-node.service
	  
	[Unit]
	Description=Zeitgeist Battery Station parachain full node
	After=network.target
	Requires=network.target

	[Service]
	Type=simple
	User=zeitgeist
	Group=zeitgeist
	RestartSec=5
	Restart=always
	Nice=0
	ExecStart=/services/zeitgeist/bin/zeitgeist \
	    --base-path=/services/zeitgeist/battery_station \
	    --chain=battery_station \
	    --name=zeitgeist-support-$RANDOM \
	    --port=30333 \
	    --rpc-port=9933 \
	    --ws-port=9944 \
	    --rpc-external \
	    --ws-external \
	    --rpc-cors=all \
	    --pruning=archive \
	    --prometheus-external \
	    -- \
	    --port=30334 \
	    --rpc-port=9934 \
	    --ws-port=9945


	[Install]
	WantedBy=multi-user.target

	sudo systemctl enable zeitgeist-node
	sudo systemctl start zeitgeist-node

	systemctl status zeitgeist-node

	
