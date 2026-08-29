terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
  }
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

module "kubernetes-controller" {
  source = "../.."

  release_name = "test-terraform"

  values_file = "./values.yaml"

}
