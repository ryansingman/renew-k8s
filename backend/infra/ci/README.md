# Backend CI Infra
Defines infrastructure used by renew-k8s backend CI pipelines.

## Deployment
From the root directory, run:
```
terraform -chdir=infra/backend/ci init
terraform -chdir=infra/backend/ci apply
```

