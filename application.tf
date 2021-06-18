####################################################
###    Game-2048 Deployment                      ###
### For Test ingress controller                  ###
####################################################

resource "kubectl_manifest" "game-2048-namespace" {
  yaml_body = <<YAML
apiVersion: v1
kind: Namespace
metadata:
  name: game-2048
YAML

  wait       = true
  depends_on = [helm_release.aws_ingress]
}

resource "kubectl_manifest" "game-2048-deployment" {
  yaml_body =<<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: game-2048
  name: deployment-2048
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: app-2048
  replicas: 5
  template:
    metadata:
      labels:
        app.kubernetes.io/name: app-2048
    spec:
      containers:
      - image: alexwhen/docker-2048
        imagePullPolicy: Always
        name: app-2048
        ports:
        - containerPort: 80
YAML

  wait       = true
  depends_on = [kubectl_manifest.game-2048-namespace]
}

resource "kubectl_manifest" "game-2048-service" {
  yaml_body =<<YAML
apiVersion: v1
kind: Service
metadata:
  namespace: game-2048
  name: service-2048
spec:
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
  type: NodePort
  selector:
    app.kubernetes.io/name: app-2048
YAML

  wait       = true
  depends_on = [kubectl_manifest.game-2048-deployment]
}

resource "kubectl_manifest" "game-2048-ingress" {
  yaml_body =<<YAML
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  namespace: game-2048
  name: ingress-2048
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
spec:
  rules:
    - http:
        paths:
          - path: /*
            backend:
              serviceName: service-2048
              servicePort: 80
YAML

  wait       = true
  depends_on = [kubectl_manifest.game-2048-service]
}