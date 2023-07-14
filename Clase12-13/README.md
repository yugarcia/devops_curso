## Proceso de instalacion de MySQL en debian.

### descargar el repositorio para debian

curl -O /tmp/mysql-apt-config_0.8.25-1_all.deb https://dev.mysql.com/get/mysql-apt-config_0.8.25-1_all.deb

wget https://dev.mysql.com/get/mysql-apt-config_0.8.25-1_all.deb

### instalar el paquete descargado

sudo apt install ./mysql-apt-config_0.8.25-1_all.deb

### actualizar los repositorios

sudo apt update
sudo apt install mysql-server mysql-client

### verificar el servicio

sudo service mysql status

### ejecutar el proceso de seguridad

sudo mysql_secure_installation

### crear usuario de base de datos admin

CREATE USER 'adminuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'adminuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

### [resolver] que no esta funcionando.
* (ok) el sitio de wordpress no responde con la pagina de inicio esperada.
* (ok) es necesario lograr que el contenido del comprimido de wordpress se descomprima en el directorio /var/www/sitio/public_html.
* (ok) no se logra deshabilitar el sitio default (mejora de seguridad).