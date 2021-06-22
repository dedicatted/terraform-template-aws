####################################################
###    Example Deployment                        ###
###    game-2048                                 ###
####################################################

resource "kubectl_manifest" "game-2048-namespace" {
  count = var.install_2048_game ? 1 : 0

  yaml_body = file("kubernetes-aws-template/files/game-2048-namespace.yaml")

  wait       = true
  depends_on = [helm_release.aws_ingress]
}

resource "kubectl_manifest" "game-2048-deployment" {
  count = var.install_2048_game ? 1 : 0

  yaml_body = file("kubernetes-aws-template/files/game-2048-deployment.yaml")


  wait       = true
  depends_on = [kubectl_manifest.game-2048-namespace]
}

resource "kubectl_manifest" "game-2048-service" {
  count = var.install_2048_game ? 1 : 0

  yaml_body = file("kubernetes-aws-template/files/game-2048-service.yaml")

  wait       = true
  depends_on = [kubectl_manifest.game-2048-deployment]
}

resource "kubectl_manifest" "game-2048-ingress" {
  count = var.install_2048_game ? 1 : 0

  yaml_body = file("kubernetes-aws-template/files/game-2048-ingress.yaml")

  wait       = true
  depends_on = [kubectl_manifest.game-2048-service]
}