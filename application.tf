####################################################
###...Apply The 2048 game in Kubernetes Cluster
###...to verify AWS ALB ingress controller work
####################################################

resource "null_resource" "install_2048" {
  provisioner "local-exec" {
    command = "kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.1.3/docs/examples/2048/2048_full.yaml"
  }

  depends_on = [helm_release.aws_ingress]
}