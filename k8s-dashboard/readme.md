## Install kubernetes dashboard
    
    helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
    helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard

## Port forwards kubernetes dashboard

    kubectl port-forward pod-name 8443:8443

## Get token for kubernetes dashboard

    kubectl -n kubernetes-dashboard create token admin-user
