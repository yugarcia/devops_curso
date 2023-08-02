# Terraform
## Configuracion de Terraform con AWS
### Instalar Terraform
Para poder realizar la instalacion de terraform puede remitirse a esta documentacion.

[Instalar terraform] (https://developer.hashicorp.com/terraform/downloads)

### Generar las credenciales de AWS

Para poder generar las credenciales de AWS debe ingresar a su cuenta de AWS y dirigirse a la seccion de IAM y generar claves programaticas.

### Configurar las credenciales de AWS

```bash	
aws configure
```
### Ejecutar terraform

```bash
terraform init
````
```bash
terraform plan --out plan.out
```
```bash
terraform apply
```