- Resource Block
  - Create VPC
  - Create Subnets
  - Internet Gateway
  - Create Route Table
  - Create Route in Route Table for Internet Access
  - Associate the Route Table with the Subnet
  - Create Security Group

```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform plan -out=tfplan
terraform apply
```

```bash
terraform destroy -auto-approve
rm -rf .terraform*
rm -rf terraform.tfstate*
```
