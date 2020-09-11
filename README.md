# Helm3 Chart for ScanCode.io

Read more about ScanCode.io here: [scancodeio.readthedocs.io](https://scancodeio.readthedocs.io/)

Read more about Helm3 here: [helm docs](https://helm.sh/docs/).

# Installation

Requires:

* Kubernetes cluster running with appropriate permissions (depending on your cluster)
* kubectl set up to connect to the cluster
* helm


Tested on:

* minikube

    $ minikube version
    minikube version: v1.25.1
    commit: 3e64b11ed75e56e4898ea85f96b2e4af0301f43d

* helm version.BuildInfo{Version:"v3.8.1", GitCommit:"5cb9af4b1b271d11d7a97a71df3ac337dd94ad37", GitTreeState:"clean", GoVersion:"go1.17.5"}

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```bash
# clone github repository
git clone git@github.com:xerrni/scancode-kube.git
# create kubernetes namespace
kubectl create namespace scancode
# configure values.yaml file
vi values.yaml
# install helm dependencies
helm dependency update
# check if dependencies are installed
helm dependency list
# sample output

# NAME            VERSION REPOSITORY                              STATUS
# nginx           9.x.x   https://charts.bitnami.com/bitnami      ok
# postgresql      11.x.x  https://charts.bitnami.com/bitnami      ok
# redis           16.x.x  https://charts.bitnami.com/bitnami      ok

# install scancode helm charts
helm install scancode ./ --namespace scancode

# wait until all pods are in Running state
# afterwards cancel this command as it will run forever
kubectl get pods -n scancode --watch

# sample output

# NAME                                       READY   STATUS    RESTARTS   AGE
# scancode-nginx-f4d79f44d-4vhlv             1/1     Running   0          5m28s
# scancode-postgresql-0                      1/1     Running   0          5m28s
# scancode-redis-master-0                    1/1     Running   0          5m28s
# scancode-scancodeio-web-5786df657c-khrgb   1/1     Running   0          5m28s
# scancode-scancodeio-worker-0               1/1     Running   1          5m28s

# expose nginx frontend
minikube service --url=true -n scancode scancode-nginx
```

# License

This project is licensed under the Apache 2.0 license.
It depends on [Bitnami charts](https://github.com/bitnami/charts) which is
  also licensed under Apache 2.0 license.
<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->
[Apache 2.0 License](https://github.com/jenkinsci/helm-charts/blob/main/LICENSE).
