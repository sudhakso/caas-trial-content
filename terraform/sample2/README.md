# Greenlake for containers examples


Couple of Terraform recipes for doing things with Greenlake containers.
 
- [Cluster Examples](#cluster-examples)
- [Application Examples](#application-deployment-examples)

## Directory layout

- Providers.tf
- Resources.tf

# cluster-examples

Following resources and providers are configured and used in this recipie. A new cluster is created and Kubeconfig is downloaded.

- [cluster/create](cluster/create)
  - provider hpegl
  - resource hpegl_caas_cluster
  - resource namespace
  
- [cluster/namespace](cluster/namespaces)
  - provider hpegl
  - resource hpegl_caas_cluster
  - resource namespace

- [cluster/localfile](cluster/kubeconfig)  
  - resource local_file
