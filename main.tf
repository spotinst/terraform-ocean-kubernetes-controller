locals {
  chart      = "ocean-kubernetes-controller"
  repository = "https://charts.spot.io"
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
  dynamic "set_sensitive" {
    for_each = var.spotinst_token != null ? [1] : []
    content {
      name  = "spotinst.token"
      value = var.spotinst_token
    }
  }

  dynamic "set" {
    for_each = var.spotinst_account != null ? [1] : []
    content {
      name  = "spotinst.account"
      value = var.spotinst_account
    }
  }

  dynamic "set" {
    for_each = var.cluster_identifier != null ? [1] : []
    content {
      name  = "spotinst.clusterIdentifier"
      value = var.cluster_identifier
    }
  }

  dynamic "set" {
    for_each = var.controller_image != null ? [1] : []
    content {
      name  = "image.repository"
      value = var.controller_image
    }
  }

  dynamic "set" {
    for_each = var.controller_version != null ? [1] : []
    content {
      name  = "image.tag"
      value = var.controller_version
    }
  }

  dynamic "set" {
    for_each = var.image_pull_policy != null ? [1] : []
    content {
      name  = "image.pullPolicy"
      value = var.image_pull_policy
    }
  }

  dynamic "set" {
    for_each = var.base_url != null ? [1] : []
    content {
      name  = "spotinst.baseUrl"
      value = var.base_url
    }
  }

  dynamic "set" {
    for_each = var.proxy_url != null ? [1] : []
    content {
      name  = "spotinst.proxyUrl"
      value = var.proxy_url
    }
  }

  dynamic "set" {
    for_each = var.enable_csr_approval != null ? [1] : []
    content {
      name  = "spotinst.enableCsrApproval"
      value = var.enable_csr_approval
    }
  }

  dynamic "set" {
    for_each = var.disable_auto_update != null ? [1] : []
    content {
      name  = "spotinst.disableAutoUpdate"
      value = var.disable_auto_update
    }
  }

  dynamic "set" {
    for_each = var.disable_rightsizing != null ? [1] : []
    content {
      name  = "spotinst.disableAutomaticRightSizing"
      value = var.disable_rightsizing
    }
  }

  dynamic "set" {
    for_each = var.image_pull_secrets
    content {
      name  = "imagePullSecrets[${index(var.image_pull_secrets, set.value)}].name"
      value = set.value
    }
  }

  dynamic "set" {
    for_each = var.resources_limits != null ? var.resources_limits : {}
    content {
      name  = "resources.limits.${set.key}"
      value = set.value
    }
  }

  dynamic "set" {
    for_each = var.resources_requests != null ? var.resources_requests : {}
    content {
      name  = "resources.requests.${set.key}"
      value = set.value
    }
  }

  dynamic "set" {
    for_each = var.secret_name != null ? [1] : []
    content {
      name  = "secret.name"
      value = var.secret_name
    }
  }

  dynamic "set" {
    for_each = var.service_account_name != null ? [1] : []
    content {
      name  = "serviceAccount.name"
      value = var.service_account_name
    }
  }

  dynamic "set" {
    for_each = var.config_map_name != null ? [1] : []
    content {
      name  = "configMap.name"
      value = var.config_map_name
    }
  }

  dynamic "set" {
    for_each = var.ca_bundle_secret_name != null ? [1] : []
    content {
      name  = "caBundleSecret.name"
      value = var.ca_bundle_secret_name
    }
  }

  dynamic "set" {
    for_each = var.deploy_metrics_server != null ? [1] : []
    content {
      name  = "metrics-server.deployChart"
      value = var.deploy_metrics_server
    }
  }
}
