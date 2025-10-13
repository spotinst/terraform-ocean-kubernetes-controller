locals {
  chart      = "ocean-kubernetes-controller"
  repository = "https://charts.spot.io"
}
locals {
  set_items = concat(
    var.spotinst_account != null ? [{ name = "spotinst.account", value = var.spotinst_account }] : [],
    var.cluster_identifier != null ? [{ name = "spotinst.clusterIdentifier", value = var.cluster_identifier }] : [],
    var.controller_image != null ? [{ name = "image.repository", value = var.controller_image }] : [],
    var.controller_version != null ? [{ name = "image.tag", value = var.controller_version }] : [],
    var.image_pull_policy != null ? [{ name = "image.pullPolicy", value = var.image_pull_policy }] : [],
    var.base_url != null ? [{ name = "spotinst.baseUrl", value = var.base_url }] : [],
    var.proxy_url != null ? [{ name = "spotinst.proxyUrl", value = var.proxy_url }] : [],
    var.enable_csr_approval != null ? [{ name = "spotinst.enableCsrApproval", value = var.enable_csr_approval }] : [],
    var.disable_auto_update != null ? [{ name = "spotinst.disableAutoUpdate", value = var.disable_auto_update }] : [],
    var.disable_rightsizing != null ? [{ name = "spotinst.disableAutomaticRightSizing", value = var.disable_rightsizing }] : [],
    var.readonly_mode != null ? [{ name = "spotinst.readonly", value = var.readonly_mode }] : [],
    [for idx, s in var.image_pull_secrets : { name = "imagePullSecrets[${idx}].name", value = s }],
    var.resources_limits != null ? [for k, v in var.resources_limits : { name = "resources.limits.${k}", value = v }] : [],
    var.resources_requests != null ? [for k, v in var.resources_requests : { name = "resources.requests.${k}", value = v }] : [],
    var.secret_name != null ? [{ name = "secret.name", value = var.secret_name }] : [],
    var.service_account_name != null ? [{ name = "serviceAccount.name", value = var.service_account_name }] : [],
    var.config_map_name != null ? [{ name = "configMap.name", value = var.config_map_name }] : [],
    var.ca_bundle_secret_name != null ? [{ name = "caBundleSecret.name", value = var.ca_bundle_secret_name }] : [],
    var.deploy_metrics_server != null ? [{ name = "metrics-server.deployChart", value = var.deploy_metrics_server }] : [],
    var.replicas != null ? [{ name = "replicas", value = var.replicas }] : []
  )

  set_sensitive_items = var.spotinst_token != null ? [{ name = "spotinst.token", value = var.spotinst_token }] : []
}

resource "helm_release" "ocean-kubernetes-controller" {
  # Whether to create the Ocean Controller
  count = var.create_controller ? 1 : 0

  # Chart details
  chart      = local.chart
  version    = var.chart_version
  repository = local.repository
  wait       = var.wait

  name             = var.release_name
  namespace        = var.namespace
  create_namespace = var.create_namespace

  # Allow passing values from a file
  values = [
    var.values_file != null ? file(var.values_file) : "",
    var.tolerations == null ? "" : "tolerations: ${jsonencode(var.tolerations)}",
    var.node_selector == null ? "" : "nodeSelector: ${jsonencode(var.node_selector)}",
  ]

  # ...Or set values directly from variables
  set = local.set_items

  set_sensitive = local.set_sensitive_items
}
