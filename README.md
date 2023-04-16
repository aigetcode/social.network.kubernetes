# Project for project configs and docker settings (Kubernetes)


## Run minicube on local computer
    minikube start --driver=virtualbox --no-vtx-check
    minikube start --hyperv-virtual-switch=minikube
    eval $(minikube docker-env)

### Command line plugins
    source <(kubectl completion zsh)


### Add ingress in k8s
    minikube addons enable ingress


### Settings pg_hba.conf
    change IPv4 local connections:
    127.0.0.1/32 - 0.0.0.0/0


http://192.168.59.100:30000/

`ingress` needs to be configured in the file `hosts`

http://social.local/

### Create helm template
    helm create name_folder

### Install helm charts
    helm install name folder
    example: helm install social .
    helm install social . -f values-test.yaml

### Update helm charts
    helm upgrade name folder
    example: helm upgrade social .

### Show generated templates by helm
    helm template .


---

### Grafana:
    localhost:3000

---

## Docker compose

#### Create docker image from app
    gradle jibDockerBuild

#### 0. Build gradle project
    gradle clean build

#### 1. Build service image
    ./servis.sh build

#### 2. Start containers
    ./servis.sh start

#### 2. Check that all containers are alive
    docker ps -a

#### 3. Stop containers
    ./server.sh stop

#### 4. If you need to install from scratch - i.e. delete all data, then we perform a cleaning
    ./server.sh clean
