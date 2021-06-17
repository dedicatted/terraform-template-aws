####################################################
###...Apply The 2048 game in Kubernetes Cluster
###...to verify AWS ALB ingress controller work
####################################################

resource "kubectl_manifest" "game_2048" {
  yaml_body  = data.http.game-2048.body

  depends_on = [helm_release.aws_ingress]
}