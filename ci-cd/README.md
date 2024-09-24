
# EPAM RD

[![N|Solid](https://upload.wikimedia.org/wikipedia/commons/d/d6/EPAM_logo.png)](https://nodesource.com/products/nsolid)

## _Site Reliability Engineer Workshop_


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## Jenkins Docker setup

This container will prepare a jenkins master and an agent that will allow us to create the necessary pipelines for this workshop

Para ejecutar este Jenkins es necesario realizar lo siguiente:



- We need to create an ssh key that will help us add it to the jenkins agent.
  
``` linux
ssh-keygen -f ~/.ssh/jenkins_agent_key
 ```
- We need to copy the content of our public key as an environment variable in our docker-compose.yml right at line 22

``` linux
  agent:
    image: jenkins/ssh-agent:jdk11
    privileged: true
    user: root
    container_name: agent
    expose:
      - 22
    environment:
      - JENKINS_AGENT_SSH_PUBKEY=COPYSSHPUBKEY
 ```

- Execute Docker Compose
``` linux
docker-compose up -d
 ```

### When the dockers are running now it's time to configure our Jenkins

- Access the following URL http://127.0.0.1:8080/
- Jenkins will ask for a default password, this can be obtained with the following command:
``` linux
docker logs jenkins | less
 ```
 Look for a block enclosed with six lines of asterisks like this:
``` linux
*************************************************************
*************************************************************
*************************************************************
 
Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:
 
c061b679107a4893b5383617729b5c6a
 
This may also be found at: /var/jenkins_home/secrets/initialAdminPassword
 
*************************************************************
*************************************************************
*************************************************************
 ```
 Enter the password and click Continue.

Select Install Suggested Plugins on the next page. When Jenkins finishes, it will prompt you for a new admin user and password. Enter a user name and password and click Save and Continue.