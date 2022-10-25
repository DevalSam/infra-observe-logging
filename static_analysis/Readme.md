Getting the best out of our docker files is really key, so in a attempt to get the best out of our docker files
we initiate the linting process using hadolint.

we can implement this in two different ways, first we can get it done by pulling a hadolint docker file
by running:

$ docker pull hadolint/hadolint
# or
$ docker pull ghcr.io/hadolint/hadolint 

and then putting all our docker files into the container and initiating our linting process from the container using the:

$ docker run --rm -i hadolint/hadolint < Dockerfile
# or
$ docker run --rm -i ghcr.io/hadolint/hadolint < Dockerfile commands 

an alternative way of doing this is by including the task in out github action pipeline 
and that can be archieved by adding the commands as shown in our "lint_action.yml" file 
as part of out github action pipeline or whatever CICD pipeline we might be using. 
 

Next we have to scan for vulnerabilities using trivy github action in the pipeline 

Scan Docker images for vulnerabilities with Trivy Github action in the pipeline. 
    
    
to get this done we can simply include the trivy config in our githup action to ensure that whatever is 
going through the pipeline is properly scanned for vulnerabilities.

so just like we did for our linting configuration, we include the codes below in our config:

- name: Run Trivy vulnerability scanner in fs mode
  uses: aquasecurity/trivy-action@master
  with:
    scan-type: 'fs'
    scan-ref: '.'
    trivy-config: trivy.yaml 

