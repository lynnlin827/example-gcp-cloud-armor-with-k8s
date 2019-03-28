# Example - Cloud Armor with kubernetes

## Requirements

* Terraform
* kubectl
* GCP project

## Run

1. Create service account in GCP project and download the json file

2. Create `terraform.tfvars` and apply GCP resources

```shell
$ terraform init
$ terraform apply
```

3. Apply k8s resources

```shell
$ kubectl apply -f k8s.yaml
```

4. Check ingress or load balancer on GCP to get the IP address (security policy may take several minutes to work)

```shell
$ kubectl get ingress -n example-cloud-armor
NAME                  HOSTS     ADDRESS        PORTS     AGE
example-cloud-armor   *         XX.XXX.XX.XX   80        25m
```
