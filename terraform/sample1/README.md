# Greenlake for containers examples


Couple of Terraform recipes for doing things with Greenlake containers.
 
- [Cluster Examples](#cluster-examples)

## Directory layout

- sample1/
  - Providers.tf
  - Resources.tf
  - README.md

- sample2/
  - Providers.tf
  - Resources.tf
  - README.md

# cluster-examples

Following resources and providers are configured and used in this recipie. An existing cluster is used to download a Kubeconfig & deploy an application.

- [cluster/create](cluster/create)
  - provider hpegl
  - data hpegl_caas_cluster
  - resource namespace
  
- [cluster/namespace](cluster/namespaces)
  - provider hpegl
  - resource hpegl_caas_cluster
  - resource namespace

# application-deployment-examples

- [cluster/helm](cluster/helm)
  - provider helm
  - resource helm-release
