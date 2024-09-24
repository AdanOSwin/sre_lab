
# EPAM RD

[![N|Solid](https://upload.wikimedia.org/wikipedia/commons/d/d6/EPAM_logo.png)](https://nodesource.com/products/nsolid)

## _Site Reliability Engineer Workshop_


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## Tools needed to start this workshop

- Laptop with Windows/Mac/Linux operating system
- Integrated development environment (Visual Studio Code, Sublime, etc...)
- Docker Engine
https://docs.docker.com/engine/install/ubuntu/
- Docker Compose
https://github.com/docker/compose/releases
- Minikube or Kind
https://minikube.sigs.k8s.io/docs/start/
- Helm Chart
https://helm.sh/docs/intro/install/
- Python3
https://www.python.org/downloads/
- NodeJs
https://nodejs.org/en/download/

## Repo Structure

The structure of this repo contains all the elements to create the necessary resources for this course.

+++ SRE-RD

    └── frontend-backend-demo/
        ├── frontend
        ├── backend
    └── deploy/
        ├── backend_deployment
        ├── frontend_deployment
        ├── grafana_deployment
        ├── prometheus_deployment
    └── iac/
        ├── versions.tf
        ├── variables.tf
        ├── provider.tf
        ├── dns.tf
        ├── data-sources.tf
        ├── modules.tf
    └── sre-tool/
        ├── slacknotification.yml 
        ├── grafana.json
        ├── alert.json
        ├── dlocust.py    
    
It is important to manage this structure of folders which must be versioned using the GIT FLOW deloyment strategy

## Activities to do in this workshop

### _Frontend and Backend Sample App_

1. Inside the _____ folder there is a sample app with the role of frontend and backend, using your local machine you should be able to launch the app
2. When you have the ability to run your backend and frontend locally, the second step is to create a dockerfile for the backend and frontend
3. With the functional front and back docker images you should create a docker-compose that helps the "development" team to deploy this entire stack from scratch
4. You must create a route in the backend to have a healtcheck within the API

#### _Deliverables of this PHASE_
- Dockerfile for the frontend
- Dockerfile for the backend
- Docker-compose to deploy both components
- Add a health_check to the API in python

### _Infraestructure as Code (Containers/Cloud)_

1. Deploy a local k8s cluster using minikube
2. Create the following manifests to deploy the front and backend (deployymet-front.yml, deployment-backend.yml, svc-front and svc-backend and ingress-frontend, ingress,-backend)
3. Deploy the manifests to the local cluster
create a cluster of k8s in their respective cloud using terraform (define a strategy in the order of the TF files e.g. providers.tf, variables.tf, resouces modules.)
4. Manually deploy application manifests manually (document commands and steps)

#### _Deliverables of this PHASE_
- K8s local cluster installation
- Creation of k8s manifests
- TF exercise where you must show how the k8s cluster was created
- Manual deployment of k8s manifests
- Application running on k8s

Devops CI/CD (cloud Others)
7.- Crear un pipleines para desplegar la infraestructura como codigo tf plan, tf apply (clusters de k8s en la respectiva nube, permisos necesarios IAM, AD ... y grafana server como pod)
8.- Crear un pipeline para CI front y backend (pull src, testing, build and push a cada container registry de la nube en cuestión)
9.- Integrar en el pipeline de CI del front y backend los stages necesarios para el deployment de las apps (deploy k8s manifest).
Observability
10.- Configurar observabilidad (grafana, slack notification, alerts, y dashboards para front y backend (manual desde UI de grafana ))
10.1 Agregar el backend de métricas correspondientes a cada nube (agregar manuelmente desde la UI de grafana)
10.2 Crear las alarmas apartir de los umbrales de monitoreo (agregar manualmente estos umbrales desde la UI de grafana)
10.3 Crear un dashbord con los SLI y SLOS para el frontend y el backend (metricas de uso, metricas de la app, RPS del backend, RPS del frontend)
DEMO
11.- Simular tráfico y caos engineering
11.1 Crear un script en python utilizando pycurl para testear el front y el api (multithreads up to 5)
