# app

App Helm chart for Kubernetes

## Prerequisites

* Install the follow packages: ``git``, ``kubectl``, ``helm``, ``sops``, ``helm-docs``. See this [tutorial](../../REQUIREMENTS.md).

## How to install

Add repo:

```console
helm repo add 1mr https://charts.1mr.me
helm repo update
```

Test the installation with command:

```console
helm -n NAMESAPCE install app 1mr/app -f values.yaml --debug --dry-run
```

Install chart with command:

```console
helm -n NAMESAPCE install app 1mr/app -f values.yaml
```

## How to uninstall

Remove application with command.

```console
helm -n NAMESAPCE uninstall app -n NAMESPACE
```

## Documentation of Helm Chart

Install ``helm-docs``.

Generate docs with ``helm-docs`` command.

```bash
cd charts/app

helm-docs
```

The markdown generation is entirely go template driven. The tool parses metadata from charts and generates a number of sub-templates that can be referenced in a template file (by default ``README.md.gotmpl``). If no template file is provided, the tool has a default internal template that will generate a reasonably formatted README.

## Parameters

The following tables lists the configurable parameters of the chart and their default values.

Change the values according to the need of the environment in ``values.yaml`` file.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| application.env | string | `nil` |  |
| application.secret | string | `nil` |  |
| autoscaling.enabled | bool | `true` |  |
| autoscaling.maxReplicas | int | `3` |  |
| autoscaling.minReplicas | int | `2` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `70` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| canary.flagger.analysis | object | `{}` |  |
| canary.flagger.enabled | bool | `false` |  |
| canary.flagger.thresholds | object | `{}` |  |
| canary.nginx.cookie | string | `""` |  |
| canary.nginx.enabled | bool | `false` |  |
| canary.nginx.header | object | `{}` |  |
| command | string | `nil` |  |
| env | string | `nil` |  |
| extraContainer | string | `nil` |  |
| grpcService.containerPort | int | `50051` |  |
| grpcService.enabled | bool | `false` |  |
| grpcService.port | int | `40000` |  |
| image | object | `{"repository":"1am3r/hello-world-koa","tag":"v.0.1"}` | Image to use for deploying |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | string | `nil` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"app.lvh.me"` |  |
| ingress.hosts[0].paths[0] | string | `"/ping"` |  |
| ingress.hosts[0].paths[1] | string | `"/ok"` |  |
| ingress.ingressClassName | string | `"nginx"` |  |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls.enabled | bool | `false` |  |
| livenessProbe.path | string | `"/healthz"` |  |
| livenessProbe.periodSeconds | int | `15` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| livenessProbe.type | string | `"http"` |  |
| nameOverride | string | `""` | Name Ovverride |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podDisruptionBudget.enabled | bool | `true` |  |
| podDisruptionBudget.minAvailable | int | `1` |  |
| podSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| podSecurityContext.capabilities.drop[0] | string | `"all"` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `1000` |  |
| prometheus.metrics | bool | `false` |  |
| pvc.accessModes[0] | string | `"ReadWriteOnce"` |  |
| pvc.enabled | bool | `false` |  |
| pvc.extraPvcLabels | object | `{}` |  |
| pvc.finalizers[0] | string | `"kubernetes.io/pvc-protection"` |  |
| pvc.size | string | `"10Gi"` |  |
| pvc.type | string | `"pvc"` |  |
| pvc.volumeName | string | `""` |  |
| readinessProbe.path | string | `"/readiness"` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| readinessProbe.type | string | `"http"` |  |
| resources.limits.cpu | string | `"200m"` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"64Mi"` |  |
| secretsStore | object | `{"enabled":false,"parameters":null,"provider":"vault","secretObjects":null}` | Secrets Store CSI Driver |
| securityContext.runAsNonRoot | bool | `true` |  |
| service.containerPort | int | `3000` |  |
| service.enabled | bool | `false` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.autoMountServiceAccountToken | bool | `false` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| strategy.rollingUpdate.maxSurge | int | `1` |  |
| strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| tolerations | list | `[]` |  |
