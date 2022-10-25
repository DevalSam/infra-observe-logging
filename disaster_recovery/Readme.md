
Our disaster recovery plan or setup is the only safety net we can always fall back to should we be faced with any major incident 
in our network infrastructure so in that case it only necessary that we fortify our network with suitable disaster recovery application
like restic.

to get restic properly installed, configured and running on our server here are a few action steps we have to take 

1. first we have to ensure that we have ansible installed on our work-station

2. then we'd have to craete our ansible playbook in the proper directory as in the dependencies/ansible/playbook directory

3. once our ansible playbook has been properly configured with right hosts and location you can run the playbook

4. to have the right configurations for our restic playbook we can lookup https://github.com/roles-ansible/ansible_role_restic 
   
      
