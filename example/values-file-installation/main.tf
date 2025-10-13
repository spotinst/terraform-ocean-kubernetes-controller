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
