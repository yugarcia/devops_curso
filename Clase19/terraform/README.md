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
### Configurar variables de entorno para autenticar el provider.
```bash
export AWS_ACCESS_KEY_ID="AKIAJQY3ZG..."
export AWS_SECRET_ACCESS_KEY="5Z4Z3......"
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

### Documentacion de terraform para AWS
[Provider AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
[Modulos AWS](https://registry.terraform.io/browse/modules?provider=aws&verified=true)