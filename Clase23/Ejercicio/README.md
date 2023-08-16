# Actividad en Clase.
### Objetivo:
El objetivo de este ejercicio es crear un balanceador de carga que permita distribuir carga con dos instancias ec2.

Incorporar el uso de localstack como herramienta para el desarrollo local.

### Requisitos:
1. Crear una VPC con dos subredes privadas y dos subredes publicas.
1. Es necesario crear dos instancias EC2, dichas instancias deben estar en dos regiones distintas.
2. Cada instancia debe poseer instalado un servidor web que muestre el nombre de la instancia y la región en la que se encuentra.
3. Agregar estas instancias a un target group.
4. Crear el balanceador de carga y agregar las instancias al balanceador.

### Entrega:
El codigo debera ser entregado como parte de un repositorio en github, el cual debera ser compartido con el usuario de github: **edgaregonzalez** y **FabianLucha**.