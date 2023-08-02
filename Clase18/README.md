# Virtual Private Cloud.
En esta clase vamos a hablar de un elemento muy importante y cross a todos los servicios de cualquier proveedor cloud. Este elemento es la red virtual privada o VPC.

## ¿Qué es una VPC?

Una VPC es un componenete vital de cualquier servicio cloud, permite crear redes privadas completamente aislada de otros clietnes.
Las VPC nos ofrece la posibilidad de connectar y ofrecer la posibilidad de interconectar servicios y otras redes.

## Elementos de una VPC.

- **Subredes**: Son redes privadas dentro de una VPC, estas redes pueden ser publicas o privadas.
-  **Route Tables**: Son tablas de rutas que nos permiten enrutar el trafico entre las subredes.
-  **Internet Gateway**: Es un gateway que nos permite conectar nuestra VPC a internet.
-  **NAT Gateway**: Nos permite conectar nuestra VPC, las siglas NAT provienen de Network Address Translation y ofrece la posibilidad de que una subnet privada pueda acceder a recursos de internet con una unica IP Publica.
-  **Security Groups**: Los SG son similares a las reglas de firewall, en AWS es el componente que nos permiten controlar el trafico de entrada y salida de las instancias.
-  **Network Access Control List**: Son listas de control de acceso que nos permiten controlar el trafico de entrada y salida de las subredes.
-  **Private Endpoint**: Nos permiten acceder a servicios de AWS sin necesidad de una IP publica.