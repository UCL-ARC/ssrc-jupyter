#!/bin/bash

# install helm
curl https://raw.githubusercontent.com/helm/helm/HEAD/scripts/get-helm-3 | bash

# apply jupyterhub chart and configuration
helm repo add jupyterhub https://hub.jupyter.org/helm-chart/
helm repo update
helm upgrade --cleanup-on-fail \
  --install jupyterhub jupyterhub/jupyterhub \
  --namespace jupyterhub --create-namespace \
  --version=${z2jupyterhub_version} \
  --values jupyterhub_config.yaml

kubectl config set-context $(kubectl config current-context) --namespace jupyterhub

# enable ingress
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/${calico_version}/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/${calico_version}/manifests/custom-resources.yaml
