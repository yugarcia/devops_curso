# Clase 17 -- Servicios de AWS [s3, ec2 ]

# Para la proxima clase:

* Crear una cuenta gratuita de AWS.
* Crear un usuario de IAM con permisos de administrador.
* Crear una llave de acceso para el usuario de IAM. (traten esta llave como si fuera su contraseña)
* Configurar las credenciales de aws (aws configure).
* Mantener el repositorio actualizado de forma local.
* Tener instalado en su maquina VSCode y terraform. [Como instalar Terraform](https://github.com/edgaregonzalez/devops-63703/tree/master/Clase17/terraform/)
* Leer el desafio propuesto, si hay dudas traiganlo a la clase que viene.
## Servicios free tier AWS
[free tier site](https://aws.amazon.com/es/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)

## Instalar el cliente de aws

### Linux
```bash
sudo apt install awscli
```

### Windows
```bash
choco install awscli
```

### MAC
```bash
brew install awscli
```

## Configurar el cliente de aws

```bash
aws configure
```
## Algunos comandos para S3
### Crear un bucket en s3

```bash
aws s3 mb s3://<bucket-name>
```

### Subir un archivo a s3

```bash
aws s3 cp <file> s3://<bucket-name>
```

### Listar los buckets

```bash
aws s3 ls
```
### eliminar un archivo
```bash
aws s3 rm s3://<bucket-name>/<file>
```
### eliminar un bucket
```bash
aws s3 rb s3://<bucket-name>
```

## Algunos comandos para EC2

### Crear un keypair
```bash
aws ec2 create-key-pair --key-name <key-name>
```
### Crear una instancia de EC2

```bash
aws ec2 run-instances --image-id ami-0dc2d3e4c0f9ebd18 --instance-type t2.micro --key-name <key-name> --security-group-ids <security-group-id> --subnet-id <subnet-id>
```
### Listar las instancias de EC2

```bash
aws ec2 describe-instances
```