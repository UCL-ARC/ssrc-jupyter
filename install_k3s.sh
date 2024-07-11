#!/bin/bash

curl https://get.k3s.io | \
  K3S_KUBECONFIG_MODE="644" \
  INSTALL_K3S_EXEC="--cluster-cidr=192.168.0.0/16 --disable=traefik" \
  INSTALL_K3S_VERSION=${k3s_version} sh -

until /usr/local/bin/kubectl get pods -A &> /dev/null; do
  sleep 5
done

chmod go-r /etc/rancher/k3s/k3s.yaml
echo "export KUBECONFIG=/etc/rancher/k3s/k3s.yaml" >> /root/.bash_profile
