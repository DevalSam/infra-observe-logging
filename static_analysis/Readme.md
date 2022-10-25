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
 

