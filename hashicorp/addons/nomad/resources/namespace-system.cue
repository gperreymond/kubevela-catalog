package main

nomadNamespaceSystem: {
  name: "nomad-namespace-system"
  type: "raw"
  properties: {
    apiVersion: "v1"
    kind: "Namespace"
    metadata: {
      name: "nomad-system"
    }
  }
}