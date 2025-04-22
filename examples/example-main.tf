terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = local.config_path
  }
}

locals {
  domain_name = "home"
  config_path = "~/.kube/configs/cabinops.yaml"
}
