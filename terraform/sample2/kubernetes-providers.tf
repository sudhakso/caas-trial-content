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


data "hpegl_caas_site" "BangaloreUPC" {
   name = "BangloreUPC"
   space_id = "18f11e77-1776-48f3-a7af-4e3f55578a9e"
}
