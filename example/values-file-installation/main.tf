provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "ocean_controller" {
  source = "../.."

  release_name = "test-terraform"

  values_file = "./values.yaml"
}
