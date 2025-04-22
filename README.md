# Description

Crash Course for <a name="k8s">Kubernetes</a> (K8s). This course assumes you have <a name="docker">Docker</a> installed, but you can also add it via Devbox if not.

# Setup

## Windows-only

Because of the differences with the shell and difficulty in setting up some of the packages used, it is probably wise to use <a name="wsl">Windows Subsystem for Linux</a> (WSL).
Install via `wsl --install [-d <DistroName>]`, *e.g.* 

`wsl --install -d Ubuntu`

Ubuntu comes with Docker out-of-the box.

## Devbox

<a name="devbox">Devbox</a> allows us to create virtual shells with a `nix`-based package manager. This ensures we are on (almost) the same environment. It also allows us to install all dependencies with a single command, instead of searching online how to install them. Finallly, we can create tasks, *i.e.* scripts that are manually run often, *e.g.* training scripts.

### Devbox Installation (Linux, MacOS)

Run the following script:

`curl -fsSL https://get.jetify.com/devbox | bash`

### Setup a Devbox Environment

In your repository, run

`devbox init`

This creates a pretty self-explanatory `devbox.json`. To enable your new shell, run

`devbox shell`

To install packages, run

`devbox add <package-name>`

and

`refresh`

to update the shell.

To exit the Devbox shell, run

`exit`



# Part 1: Basics of K8s

## Managing a Cluster

The most common way for interfacing with a cluster is `kubectl`. In order to talk to this cluster, we first need a cluster. For our simple tests, we will use a virtual K8s cluster within a Docker container. There are several tools for this available:

1. <a name="minikube">`minikube`</a>
1. <a name="kind">`kind`</a>
1. <a name="k3d">`k3d`</a> (technically not K8s, but <a name="k3s">K3s</a>)
1. <a name="k0s">`k0s`</a> (again, technically K0s, not K8s)
1. ...

In this course, we will assume you are using `minikube`. If you already used any of them, try another one! Be careful with K3s and K0s, they might come with different Operators or Controllers, requiring more changes to your setup.

K8s uses a declarative approach, meaning you tell it want you want to have (a Manifest), not what you want it to do. The Operator then tries its best to fulfill your requirements. Manifests are written in YAML (or JSON). See `example-pod.yaml` for an example.

## Exercise 1

1. Set up your K8s cluster
1. Apply the manifest `example-pod.yaml` and see the changes in the cluster.
1. Play around with Deployments, (replicas of) Pods, Jobs,...
1. Maybe try to set up a server for the game of your choice, *e.g.* Minecraft, Factorio,...



# Part 2: Helm and Helm Charts

When installing someone else's app, instead of having to rely on order-of-operations and deploying Namespace, then CRDs, then some Deployment,... all of which could be changing at any time, we usually install using <a name="helm">Helm</a> instead.

Helm manages packages called 'Helm Charts'. These are stored in Repositories (like anything else) and have a very specific structure:

- `Chart.yaml`: Metadata about the Chart, like name, version, creators,...
- `values.yaml`: Variables for tuning of the Chart, or its Dependency Charts.
- `charts/`: A directory containing dependency Helm Charts needed for installing the Chart
- `templates/`: A folder containing YAMLs templated using Govaluate-style templating, *i.e.* `{{ govaluate.style.templating }}`

## Installing a Helm Chart

Check if the repo is present in the repo list

`helm repo list`

If not, add the repo to Helm using

`helm repo add <repo-name> <repo-url>`

*e.g.*

`helm repo add bitnami https://charts.bitnami.com/bitnami`

If the repo was already present, update using

`helm repo update`

Install the Chart via

`helm install <repo-name>/<chart-name>`

An installed Chart is referred to as a Release. We can change the default settings with a `values.yaml` of our own, or by supplying the `--set` flag:

`helm install <repo-name>/<chart-name> -f values.yaml`

or

`helm install <repo-name>/<chart-name> --set <parameter=value>`

## More Features

Helm can upgrade a Release by either changing the values supplied

`helm upgrade <repo-name>/<chart-name> -f values.yaml`

or by just using a newer version

```
helm repo update
helm upgrade <repo-name>/<chart-name>
```
(assuming default settings)

To uninstall a Release, use

`helm uninstall <release-name>`

## Exercise 2

1. Install `helm`
1. Add the <a name="prometheus">Prometheus</a> Helm Repo to Helm
1. Deploy Prometheus on your cluster using Helm
1. Do the same with <a name="grafana">Grafana</a>, and add Prometheus as a data source
1. (optional) Experiment with some other Charts, *e.g.* Databases, Telemetry, GUI,...



# Part 3

TODO

# References

<sup>[1](#k8s)</sup> https://kubernetes.io, abbreviated 'K8s' by leaving out the 8 letters inbetween

<sup>[2](#docker)</sup> https://www.docker.com

<sup>[3](#wsl)</sup> https://learn.microsoft.com/en-us/windows/wsl

<sup>[4](#devbox)</sup> https://github.com/jetify-com/devbox

<sup>[5](#minikube)</sup> https://minikube.sigs.k8s.io

<sup>[6](#kind)</sup> https://kind.sigs.k8s.io

<sup>[7](#k3d)</sup> https://k3d.io

<sup>[8](#k3s)</sup> https://k3s.io/, a lightweight form of K8s. The 3 stands for uhm uh uhm the uhm the – huh

<sup>[9](#k0s)</sup> https://k0sproject.io

<sup>[10](#helm)</sup> https://helm.sh

<sup>[10](#prometheus)</sup> https://prometheus.io

<sup>[10](#grafana)</sup> https://grafana.com
