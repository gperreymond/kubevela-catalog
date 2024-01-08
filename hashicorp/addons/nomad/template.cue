package main

output: {
  apiVersion: "core.oam.dev/v1beta1"
  kind: "Application"
  metadata: {
    name: "nomad"
    namespace: "vela-system"
  }
  spec: {
    components: [
      nomadNamespaceSystem,
      nomadVariableTriggers
    ]
    workflow: {
      steps: [{
        name: "create namespace nomad-system"
        type: "apply-component"
        properties: {
          component: "nomad-namespace-system"
        }
      }, {
        name: "create triggers nomad-variable"
        type: "apply-component"
        dependsOn: ["create namespace nomad-system"]
        properties: {
          component: "nomad-variable-triggers"
        }
      }]
    }
  }
}
