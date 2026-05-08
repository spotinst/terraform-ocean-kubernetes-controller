# Upgrade from v0.x to v1.x

The `v1.0.0` release is not backwards compatible.

## List of breaking changes

- Terraform `v1.1.9` is now the minimum supported version.
- Helm provider `v3.0.0` is now the minimum supported version.

## Upgrade steps

- If required, update terraform version.
- Update helm provider version.
- Update helm provider attributes following
  the [migration guide for helm v3](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/guides/v3-upgrade-guide#changes-to-provider-attributes).
- Download new helm provider:

```sh
terraform init -upgrade
```

- Apply the change:

```sh
terraform apply
```

> [!NOTE]
> If you want to keep using ocean-kubernetes-controller module v0, lock the version in module config:
>
> ```hcl
> module "kubernetes-controller" {
>   source  = "spotinst/kubernetes-controller/ocean"
>   version = "~> 0.0"
> }
> ```
