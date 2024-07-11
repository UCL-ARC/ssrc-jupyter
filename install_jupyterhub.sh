#!/bin/bash

# install helm
curl https://raw.githubusercontent.com/helm/helm/HEAD/scripts/get-helm-3 | bash

# apply jupyterhub chart and configuration
helm repo add jupyterhub https://hub.jupyter.org/helm-chart/
helm repo update
helm upgrade --cleanup-on-fail \
  --install demo jupyterhub/jupyterhub \
  --namespace jupyterhub --create-namespace \
  --version=3.3.7 \
  --values jupyterhub_config.yaml

kubectl config set-context $(kubectl config current-context) --namespace jupyterhub
