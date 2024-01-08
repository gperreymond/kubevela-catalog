```sh
vela addon enable fluxcd
vela addon enable kube-trigger
# use hashicorp
vela addon registry add Hashicorp --type git --endpoint=https://github.com/gperreymond/kubevela-catalog.git --path=hashicorp/addons
```

* https://github.com/kubevela/kube-trigger