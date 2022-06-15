resource "helm_release" "prometheus-stack" {
   name = "prometheus-stack"
   repository = "https://prometheus-community.github.io/helm-charts"
   chart = "kube-prometheus-stack"

   namespace = "upc-demo1"

   set {
    name  = "grafana.service.type"
    value = "NodePort"
  }

}
