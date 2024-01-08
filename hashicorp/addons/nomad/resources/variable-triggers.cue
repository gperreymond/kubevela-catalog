package main

nomadVariableTriggers: {
  name: "nomad-variable-triggers"
  type: "raw"
  properties: {
    apiVersion: "standard.oam.dev/v1alpha1"
    kind: "TriggerService"
    metadata: {
      name: "nomad-variable-trigger-update"
      namespace: "nomad-system"
    }
    spec: {
      triggers: [{
        source: {
          type: "resource-watcher"
          properties: {
            apiVersion: "v1"
            kind: "ConfigMap"
            namespace: "nomad-system"
            events: ["create", "update"]
            matchingLabels: {
              "nomad-variable/trigger": "true"
            }
          }
        }
        action: {
          type: "record-event"
        }
      }, {
        source: {
          type: "resource-watcher"
          properties: {
            apiVersion: "v1"
            kind: "ConfigMap"
            namespace: "nomad-system"
            events: ["delete"]
            matchingLabels: {
              "nomad-variable/trigger": "true"
            }
          }
        }
        action: {
          type: "record-event"
        }
      }]
    }
  }
}