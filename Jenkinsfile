pipeline {
    agent any
    environment{
        dockercred=credentials('docker-credentials')
    }
    stages {
        stage("docker login"){
            steps {
                sh "echo $dockercred_PSW | docker login -u $dockercred_USR --password-stdin"
                sh "echo 'login to dockerhub succeded'"
            }
        }
        stage('Build Docker Images'){
            steps {
                sh "docker build -t jen-frontend frontend-backend-demo/frontend-express/"
                sh "docker build -t jen-backend frontend-backend-demo/backend-flask/flask/"
                sh "docker build -t jen-proxy-nginx frontend-backend-demo/backend-flask/nginx"
                sh "echo ' ####################3 Images Builded #############'"
            }
        }
        stage('Tag Docker images'){
            steps {
                sh "docker images"
                sh "echo 'Taggin docker images'"
                sh "docker tag jen-frontend joi292/jen-frontend:v1.0"
                sh "docker tag jen-backend joi292/jen-backend:v1.0"
                sh "docker tag jen-proxy-nginx joi292/jen-proxy-nginx:v1.0"
                sh "echo '##################### IMAGES SUCCESSFULLY TAGGED ######################'"
            }
        }
        stage('Push Docker Images'){
            steps{ 
                 sh "echo '##################### PUSHING DOCKER IMAGES ######################'"
                sh "docker push joi292/jen-frontend:v1.0"
                sh "docker push joi292/jen-backend:v1.0"
                sh "docker push joi292/jen-proxy-nginx:v1.0"
                sh "echo '##################### Docker images uploaded successfully ######################'"
            }
        }
        stage('Building Terraform Infra'){
            steps {
                sh "pwd"
                sh "ls ./iac"
                //sh "chmod o+x /iac"
                //sh "cd ./iac"
                //sh "ls"
                //sh "terraform -chdir=./iac destroy -"
                sh "terraform -chdir=./iac init"
                sh "terraform -chdir=./iac validate"
                sh "terraform -chdir=./iac plan -var-file='/var/jenkins_home/dev.tfvars' -out jenkins-plan"
                sh "terraform -chdir=./iac apply -auto-approve jenkins-plan"
                sh "echo '############### TERRAFORM INFRA BUILD SUCCESSFULLY :) ;) ##################'"
                //sh "rm ./iac/jenkins-plan"
                //sh "rm./iac/terraform.tfstate"
                //sh "rm./iac/terraform.tfstate.backup"
                //sh "rm ./iac/.terraform.lock.hcl"
            }
        }
        stage("Apply AWS Cluster configuration manifest") {
            steps {
                sh "aws eks update-kubeconfig --region us-east-1 --name sre_cluster"
                sh "kubectl apply -f ./deploy/frontend_deployment/frontend-deployment.yaml,./deploy/frontend_deployment/frontend-service.yaml"
                sh "kubectl apply -f ./deploy/backend_deployment/backend-deployment.yaml,./deploy/backend_deployment/backend-service.yaml"
                sh "kubectl apply -f ./deploy/proxy_deployment/proxy-deployment.yaml,./deploy/proxy_deployment/proxy-service.yaml"
            }
        }
    }
}