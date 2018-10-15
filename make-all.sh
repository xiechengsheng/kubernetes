#!/bin/bash

cd /root/golang/src/k8s.io/kubernetes/
make
rm -f /usr/bin/kube-apiserver /usr/bin/kube-controller-manager /usr/bin/kube-scheduler /usr/bin/kubectl
cp /root/golang/src/k8s.io/kubernetes/_output/bin/kube-apiserver /usr/bin/
cp /root/golang/src/k8s.io/kubernetes/_output/bin/kube-controller-manager /usr/bin/
cp /root/golang/src/k8s.io/kubernetes/_output/bin/kube-scheduler /usr/bin/
cp /root/golang/src/k8s.io/kubernetes/_output/bin/kubectl /usr/bin/
for svc in kube-apiserver kube-controller-manager kube-scheduler; do
    systemctl restart $svc
    systemctl enable $svc
    systemctl status $svc
done
