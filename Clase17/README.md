# Clase 17 -- Servicios de AWS [s3, ec2 ]

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