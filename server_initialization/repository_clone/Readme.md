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
