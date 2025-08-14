# Terraform AWS EC2 Template - Control VPC Provision by ENV

- [Terraform AWS EC2 Template - Control VPC Provision by ENV](#terraform-aws-ec2-template---control-vpc-provision-by-env)
  - [Diagram](#diagram)
  - [Initialize](#initialize)
  - [Control VPC](#control-vpc)

---

## Diagram

![pic](./pic/diagram.gif)

---

## Initialize

```sh
# initialize with remote backend
terraform init -backend-config=state.config
```

---

## Control VPC

- By default, Provision VPC in prod

```terraform
variable "ENV" {
  default = "prod"
}
```

- Use `-var` to provision VPC in dev

```sh
# apply dev
terraform apply -var ENV=dev
```
