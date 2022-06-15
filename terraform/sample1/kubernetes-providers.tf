# Copyright 2021-22 Hewlett Packard Enterprise Development LP

# Set-up for terraform >= v0.13
terraform {

  required_providers {

    hpegl = {
      # We are specifying a location that is specific to the service under development
      # In this example it is caas (see "source" below).  The service-specific replacement
      # to caas must be specified in "source" below and also in the Makefile as the
      # value of DUMMY_PROVIDER.

      source  = "terraform.example.com/caas/hpegl"
      version = ">= 0.0.1"

    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "hpegl" {

  caas {
    api_url = "https://mcaas.intg.hpedevops.net/mcaas"
  }
}

data "hpegl_caas_cluster" "upc-demo1" {

  name     = "upc-demo1"
  space_id = "18f11e77-1776-48f3-a7af-4e3f55578a9e"

}

resource "local_file" "foo" {

  content  = base64decode(data.hpegl_caas_cluster.upc-demo1.kubeconfig)
  filename = "./kubeconfig"

}

provider "helm" {
  kubernetes {
       host     = yamldecode(base64decode(data.hpegl_caas_cluster.upc-demo1.kubeconfig)).clusters[0].cluster.server
       token    = yamldecode(base64decode(data.hpegl_caas_cluster.upc-demo1.kubeconfig)).users[0].user.token
       insecure = true
  }
}

provider "kubernetes" {

  host     = yamldecode(base64decode(data.hpegl_caas_cluster.vishaldemo.kubeconfig)).clusters[0].cluster.server
  token    = yamldecode(base64decode(data.hpegl_caas_cluster.vishaldemo.kubeconfig)).users[0].user.token
  insecure = true

}

provider "kubectl" {

  host             = yamldecode(base64decode(data.hpegl_caas_cluster.upc-demo1.kubeconfig)).clusters[0].cluster.server
  token            = yamldecode(base64decode(data.hpegl_caas_cluster.upc-demo1.kubeconfig)).users[0].user.token
  insecure         = true
  load_config_file = false

}

