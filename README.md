# Description

Crash Course for <a name="k8s">Kubernetes</a>. This course assumes you have Docker installed, but you can also add it via Devbox, if not.

# Setup

## Windows-only

Because of the differences with the shell and difficulty in setting up some of the packages used, it is probably wise to use <a name="wsl">WSL</a>.
Install via `wsl --install [-d <DistroName>]`, *e.g.* 

`wsl --install -d Ubuntu`

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

The most common way for interfacing with a K8s is `kubectl`. In order to talk to this cluster, we first need a cluster. For our simple tests, we will use a virtual K8s cluster within a Docker container. There are several tools for this available:

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
1. ???

# Part 2

Switch to branch `helm` and read the `README.md`.

# References

<sup>[1](#k8s)</sup> https://kubernetes.io/, abbreviated 'K8s' (leaving out the 8 letters inbetween)

<sup>[2](#test)</sup> Windows Subsystem for Linux, https://learn.microsoft.com/en-us/windows/wsl/

<sup>[3](#devbox)</sup> https://github.com/jetify-com/devbox

<sup>[4](#k3s)</sup> https://k3s.io/, a lightweight form of K8s. The 3 stands for uhm uh uhm the uhm the – huh

