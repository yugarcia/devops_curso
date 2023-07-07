## Proceso de instalacion de MySQL en debian.

### descargar el repositorio para debian

curl -O /tmp/mysql-apt-config_0.8.25-1_all.deb https://dev.mysql.com/get/mysql-apt-config_0.8.25-1_all.deb

wget https://dev.mysql.com/get/mysql-apt-config_0.8.25-1_all.deb

### instalar el paquete descargado

sudo apt install ./mysql-apt-config_0.8.25-1_all.deb

### actualizar los repositorios

sudo apt update
sudo apt install mysql-server

### verificar el servicio

sudo service mysql status

### ejecutar el proceso de seguridad

sudo mysql_secure_installation