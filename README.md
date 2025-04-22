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

`devbox add <package-name>`.

To exit the Devbox shell, run

`exit`

## Managing a Cluster

The most common way for interfacing with a cluster is `kubectl`. In order to talk to this cluster, we first need a cluster. For our simple tests, we will use a virtual K8s cluster within a Docker container. There are several tools for this available:

1. <a name="minikube">`minikube`</a>
1. <a name="kind">`kind`</a>
1. <a name="k3d">`k3d`</a> (technically not K8s, but <a name="k3s">K3s</a>)
1. <a name="k0s">`k0s`</a> (again, technically K0s, not K8s)
1. ...

In this course, we will assume you are using `minikube`. If you already used any of them, try another one! Be careful with K3s and K0s, they might come with different Operators or Controllers, requiring more changes to your setup.

K8s uses a declarative approach, meaning you tell it want you want to have (a Manifest), not what you want it to do. The Operator then tries its best to fulfill your requirements. Manifests are written in YAML (or JSON). See `example-pod.yaml` for an example.

## Installing our Packages

Simply run

`devbox add kubectl minikube`

Then 

`refresh`

to update your shell.

# Instructions

1. Set up your K8s cluster
1. Apply the manifest `example-pod.yaml` and see the changes in the cluster.
1. Play around with Deployments, (replicas of) Pods, Jobs,...
1. Maybe try to set up a server for the game of your choice, *e.g.* Minecraft, Factorio,...

# Part 2

TODO

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
