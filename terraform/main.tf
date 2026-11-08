terraform {
  required_version = "~> 1.17"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.3"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.5"
    }
  }
}

provider "helm" {
  kubernetes = {
    config_path = var.kubeconfig_path
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

module "flux_operator_bootstrap" {
  source  = "controlplaneio-fluxcd/flux-operator-bootstrap/kubernetes"
  version = "0.10.0"

  revision = 1

  gitops_resources = {
    instance_yaml = file("${path.root}/../kubernetes/flux-system/flux-instance.yaml")
  }
}
