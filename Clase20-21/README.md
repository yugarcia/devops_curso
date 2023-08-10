# Terraform - Gestion de proyectos.

## Configuracion de Terraform backend con S3.

### Crear bucket S3.
```bash
aws s3api create-bucket --bucket educacionit-tf-state --region us-east-1
```
### Asignar los permisos.
```bash
aws iam create-policy --policy-name terraform-s3 --policy-document file://policy.json
aws iam create-user --user-name terraform-s3
aws iam attach-user-policy --user-name terraform-s3 --policy-arn arn:aws:iam::aws:policy/terraform-s3
```
### Configurar DynamoDB.
```bash
aws dynamodb create-table --table-name terraform-state-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1
```
### Configurar el backend en el archivo main.tf.

```terraform
terraform {
  backend "s3" {
    bucket         = "bucket-name"
    key            = "path/to/my/key"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
```
### Migrar un estado a un backend.

```terraform
terraform init --migrate-state
```

## Data Sources.

[https://developer.hashicorp.com/terraform/language/data-sources](documentacion)