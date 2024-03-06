provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "kubernetes-controller" {
  source = "../.."

  # Credentials
  spotinst_token   = var.spotinst_token
  spotinst_account = var.spotinst_account

  # Configuration
  cluster_identifier = var.cluster_identifier

  # image_pull_secrets = [ "test1", "test2" ]

  # resources_limits = {
  #   cpu    = "1200m"
  #   memory = "256Mi"
  # }

  # resources_requests = {
  #   cpu    = "400m"
  #   memory = "128Mi"
  # }

  # node_selector = {
  #   "beta.kubernetes.io/os" = "linux"
  # }

  release_name = "test-terraform"
}
