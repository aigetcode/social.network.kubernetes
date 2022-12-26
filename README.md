## запуск миникуба на локальном компе

    minikube start --driver=virtualbox --no-vtx-check
    eval $(minikube docker-env)

### дополнения для командной строки

    source <(kubectl completion zsh)


### добавить ingress в k8s

    minikube addons enable ingress


### настроить pg_hba.conf

    поменять IPv4 local connections:
    127.0.0.1/32 - 0.0.0.0/0


http://192.168.59.100:30000/

ingress нужно настроить в фале hosts

http://social.local/
