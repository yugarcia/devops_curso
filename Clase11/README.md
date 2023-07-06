## instalacion de la base de datos.

sudo apt install mysql-server

## crear la base de datos.

sudo mysql -u root

## Agregar una password al usuario root solo funciona en mysql.

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'educacionit2023!';

## comando para asignar una password al usuario de root en mariadb.

sudo mysql_secure_installation

## Crear la base de datos

CREATE DATABASE educacionit_wp DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

## Crear el usuario de la base de datos para wordpress.

CREATE USER 'educacionit_usr'@'%' IDENTIFIED WITH mysql_native_password BY 'educacionit2023!';

## Asignar permisos al usuario de la base de datos para wordpress.

GRANT ALL ON educacionit_wp.* TO 'educacionit_usr'@'%';

## refrescar los permisos nuevos.

FLUSH PRIVILEGES;