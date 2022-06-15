
resource "hpegl_caas_cluster" "new-cluster-iac" {

  name         = "new-cluster-iac"
  space_id     = "18f11e77-1776-48f3-a7af-4e3f55578a9e"
  blueprint_id = "b4992cd9-43f7-4c71-81ae-f0897512fb87"
  site_id      = data.hpegl_caas_site.BangaloreUPC.id

}

resource "local_file" "kc" {

  content  = base64decode(hpegl_caas_cluster.new-cluster-iac.kubeconfig)
  filename = "./kubeconfig"

}


