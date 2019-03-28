# Example - Cloud Armor with kubernetes

## Requirements

* Terraform
* kubectl
* GCP project

## Run

1. Create service account in GCP project and download the json file

2. Create `terraform.tfvars`

```
gcp_credentials_file = "XXXXXX.json"
gcp_project = "XXXX-XXXX-XXXX"
allow_ips = [
  "XXX.XXX.XX.XX/XX",
  "XXX.XXX.XX.XX/XX",
]
```

3. Apply GCP resources

```shell
$ terraform init
$ terraform apply
```

4. Apply k8s resources

```shell
$ kubectl apply -f k8s.yaml
```

5. Check ingress or load balancer on GCP to get the IP address (security policy may take several minutes to work)

```shell
$ kubectl get ingress -n example-cloud-armor
NAME                  HOSTS     ADDRESS        PORTS     AGE
example-cloud-armor   *         XX.XXX.XX.XX   80        25m
```

## Down

1. Destroy k8s resources

```shell
$ kubectl delete -f k8s.yaml
```

2. Destroy GCP resources

```shell
$ terraform destroy
```
