# Spot Ocean Kubernetes Controller Terraform Module

A Terraform module to install the Ocean Controller on Kubernetes.

## Usage

```hcl
module "kubernetes-controller" {
  source  = "spotinst/kubernetes-controller/ocean"

  # Credentials.
  spotinst_token   = var.spotinst_token
  spotinst_account = var.spotinst_account

  # Configuration.
  cluster_identifier = var.cluster_identifier
}
```

## Examples

- [Backwards Compatible Installation](https://github.com/spotinst/terraform-ocean-kubernetes-controller/tree/main/example/backwards-compatible-installation)
- [Values File Installation](https://github.com/spotinst/terraform-spotinst-ocean-controller/tree/main/example/values-file-installation)

<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_url"></a> [base\_url](#input\_base\_url) | Specifies the base URL to be used by the HTTP client | `string` | `null` | no |
| <a name="input_ca_bundle_secret_name"></a> [ca\_bundle\_secret\_name](#input\_ca\_bundle\_secret\_name) | Overrides the default secret name for custom CA bundle | `string` | `null` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Specifies the version of the Helm chart to be installed | `string` | `"0.1.65"` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | Specifies the cluster identifier | `string` | `null` | no |
| <a name="input_config_map_name"></a> [config\_map\_name](#input\_config\_map\_name) | Overrides the default configmap name | `string` | `null` | no |
| <a name="input_controller_image"></a> [controller\_image](#input\_controller\_image) | Specifies the Docker image name for the Ocean Controller that should be deployed | `string` | `null` | no |
| <a name="input_controller_version"></a> [controller\_version](#input\_controller\_version) | Specifies the Docker version for the Ocean Controller that should be deployed | `string` | `null` | no |
| <a name="input_create_controller"></a> [create\_controller](#input\_create\_controller) | Controls whether the Ocean Controller should be deployed (it affects all resources) | `bool` | `true` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Controls whether the namespace should be created if it does not exist | `bool` | `true` | no |
| <a name="input_deploy_metrics_server"></a> [deploy\_metrics\_server](#input\_deploy\_metrics\_server) | Controls whether the metrics server should be deployed | `bool` | `false` | no |
| <a name="input_disable_auto_update"></a> [disable\_auto\_update](#input\_disable\_auto\_update) | Controls whether the auto-update feature should be disabled | `bool` | `true` | no |
| <a name="input_disable_rightsizing"></a> [disable\_rightsizing](#input\_disable\_rightsizing) | Controls whether the rightsizing feature should be disabled | `bool` | `false` | no |
| <a name="input_enable_csr_approval"></a> [enable\_csr\_approval](#input\_enable\_csr\_approval) | Controls whether the CSR approval feature should be enabled | `bool` | `true` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | Specifies the image pull policy (one of: Always, Never, IfNotPresent) | `string` | `"Always"` | no |
| <a name="input_image_pull_secrets"></a> [image\_pull\_secrets](#input\_image\_pull\_secrets) | Specifies a list of references to secrets in the same namespace to use for pulling the image | `list(string)` | `[]` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Specifies the namespace where the Ocean Controller should be deployed | `string` | `"spot-system"` | no |
| <a name="input_node_selector"></a> [node\_selector](#input\_node\_selector) | Specifies the node selector which must match a node's labels for the Ocean Controller resources to be scheduled on that node | `map(string)` | `null` | no |
| <a name="input_proxy_url"></a> [proxy\_url](#input\_proxy\_url) | Specifies the proxy server URL to communicate through | `string` | `null` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Specifies the name of the Helm release | `string` | `"ocean-controller"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Controls number of replicas | `number` | `null` | no |
| <a name="input_resources_limits"></a> [resources\_limits](#input\_resources\_limits) | Specifies the definition of the maximum amount of compute resources allowed | `map(any)` | `null` | no |
| <a name="input_resources_requests"></a> [resources\_requests](#input\_resources\_requests) | Specifies the definition of the minimum amount of compute resources required | `map(any)` | `null` | no |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Overrides the default secret name | `string` | `null` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Overrides the default service account name | `string` | `"controller-service-account-name"` | no |
| <a name="input_spotinst_account"></a> [spotinst\_account](#input\_spotinst\_account) | Specifies the Spot account ID | `string` | `null` | no |
| <a name="input_spotinst_token"></a> [spotinst\_token](#input\_spotinst\_token) | Specifies the Spot Personal Access token | `string` | `null` | no |
| <a name="input_tolerations"></a> [tolerations](#input\_tolerations) | Specifies a list of additional `toleration` objects | `list(any)` | `null` | no |
| <a name="input_values_file"></a> [values\_file](#input\_values\_file) | values.yaml file to be used for the Ocean Controller | `string` | `null` | no |
| <a name="input_wait"></a> [wait](#input\_wait) | Controls whether to wait for Helm release to deploy | `bool` | `false` | no |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.12.1 |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.12.1 |
<!-- END_TF_DOCS -->

## Documentation

If you're new to [Spot](https://spot.io/) and want to get started, please checkout our [Getting Started](https://docs.spot.io/connect-your-cloud-provider/) guide, available on the [Spot Documentation](https://docs.spot.io/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

- Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [terraform-spotinst](https://stackoverflow.com/questions/tagged/terraform-spotinst/).
- Join our [Spot](https://spot.io/) community on [Slack](http://slack.spot.io/).
- Open an issue.

## Community

- [Slack](http://slack.spot.io/)
- [Twitter](https://twitter.com/spot_hq/)

## Contributing

Please see the [contribution guidelines](.github/CONTRIBUTING.md).

## License

Code is licensed under the [Apache License 2.0](LICENSE).
