# Infrastructure as Code (IaC) for GCP GKE

This project provides Terraform-based infrastructure automation for Google Cloud Platform (GCP), focusing on Google
Kubernetes Engine (GKE) clusters, Helm chart deployments, and secure networking.

## Feature Branch Isolation (ArgoCD ApplicationSets)

Deployment supports fully automated feature branch isolation by namespaces, implemented with ArgoCD ApplicationSets.
Each feature branch is deployed into its own isolated namespace, managed by ArgoCD, enabling parallel development and
testing environments.

## Structure

- `it-delivers-everywhere/gcp/environments/dev/` – Environment-specific configs (main.tf, terraform.tfvars, values.yaml,
  etc.)
- `it-delivers-everywhere/gcp/modules/gke/` – GKE cluster and related resources (main.tf, variables.tf, outputs.tf)
- `tmp/values.yaml` – Example Helm values file

## Features

- Modular GKE cluster provisioning
- Helm chart deployments (e.g., ingress-nginx, argo-appsets)
- Customizable firewall rules for control plane and service access
- IP/subnet whitelisting for secure access
- Environment-specific configuration via tfvars and variables.tf

## Usage

1. Configure your environment in `environments/dev` (edit `terraform.tfvars`, `variables.tf`, `values.yaml`).
2. Run:
   ```sh
   terraform init
   terraform plan
   terraform apply
   ```
   in your environment folder.
3. Customize firewall whitelists and Helm values as needed.

## Requirements

- Terraform
- Google Cloud credentials
- Helm (for manual chart management, if needed)

## Security

- Firewall rules restrict GKE control plane and service access to specified IPs/subnets.
- Helm chart values are customizable per environment.

## Notes

- Update `terraform.tfvars` to set whitelisted IPs/subnets (e.g., `controlplane_whitelist = ["192.168.0.1"]`).
- Use `variables.tf` to declare all required variables.
- For service/load balancer IPs, retrieve them after deployment using `kubectl get svc -n <namespace>`.

## License

MIT

## Backlog

- [ ] Add project creation

## OCI OKE Challenges and Weaknesses

- **DNS resolution issues** – Does not work out of the box due to stateless firewall-like behavior; fixed by allowing
  UDP traffic for `10.0.0.0/16`.
- **Control plane exposure** – By default, the provider creates a basic cluster with the control plane exposed to the
  internet. For simplicity, this has not yet been restricted (e.g., via VPN).
- **Ingress-related firewall rules** – Creating an ingress automatically generates firewall rules, which then need to be
  imported back into the configuration.
- **Ingress controller limitations** – The native ingress controller is unavailable in the standard cluster, so NGINX is
  used instead.
