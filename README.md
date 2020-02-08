# kubectl

alpine based image with kubectl (arm) installed

## Useage

```yaml
kind: pipeline
type: kubernetes
name: default

steps:
  - name: deploy
    image: dijitle/kubectl:v1.17.2
    environment:
      KUBERNETES_CERT:
        from_secret: k8s_cert
      KUBERNETES_TOKEN:
        from_secret: k8s_token
    commands:
      - kubectl-init.sh
      - kubectl get nodes
```

get from your cluster

```bash
#cert
kubectl get secret default-token-xxxxx -o jsonpath='{.data.ca\.crt}' && echo

#token
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}'
```

set orgsecret in drone

```bash
drone orgsecret add <yourorg> k8s_cert <yourcert>
drone orgsecret add <yourorg> k8s_token <yourtoken>
```

Since drone is running in your cluster, it uses the pre-set environment variables for `KUBERNETES_SERVICE_HOST` and `KUBERNETES_SERVICE_PORT_HTTPS`, typically defaulting to `10.96.0.1:443`
