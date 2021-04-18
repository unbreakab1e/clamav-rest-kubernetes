# Docker ClamAV + go-clamav-rest installation on Kubernetes

Tested on Kubernetes 1.18, might require API versions updates for more recent versions.

## Assumptions
- AWS EBS CSI driver is present in the cluster. If you're not on AWS, change `0_storage_class.yaml` to use the one you have

## Installation
- Adjust image name/version in the `kustomization.yaml`, if you've built your own image
- Adjust ingress hostname in the `5_ingress.yaml`
- run `kustomize build . | kubectl apply -f`