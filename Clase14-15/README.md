# Instalacion y configuracion de Prometheus y Grafana.

## Instalacion y configurar de Grafana.

### configuracion de repositorios.

sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common
sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key

### Agregar repositorio de grafana version estable.

echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

### Updates the list of available packages

sudo apt-get update

### comando para operar el servicio de grafana.

sudo service grafana-server start
sudo service grafana-server status

### iniciar el servicio luego de un reinicio del server.

sudo systemctl enable grafana-server.service

sudo service grafana-server stop
sudo service grafana-server restart

### Links grafana
https://grafana.com/grafana/download?pg=oss-graf&plcmt=resources
https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/#2-start-the-server
https://prometheus.io/docs/guides/node-exporter/

## Instalacion y configurar de Prometheus.

### Crear usuario prometheus.

sudo useradd --no-create-home --shell /bin/false prometheus

### Crear directorios para prometheus.

sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

sudo chown prometheus:prometheus /var/lib/prometheus

### Descargar prometheus.

mkdir downloads
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.45.0/prometheus-2.45.0.linux-amd64.tar.gz

sha256sum prometheus-2.45.0.linux-amd64.tar.gz

tar xvf prometheus-2.45.0.linux-amd64

sudo cp downloads/prometheus-2.45.0.linux-amd64/prometheus /usr/local/bin/
sudo cp downloads/prometheus-2.45.0.linux-amd64/promtool /usr/local/bin/

sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

sudo cp -r downloads/prometheus-2.45.0.linux-amd64/consoles /etc/prometheus
sudo cp -r downloads/prometheus-2.45.0.linux-amd64/console_libraries /etc/prometheus

sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries

sudo cp  downloads/prometheus-2.45.0.linux-amd64/prometheus.yml /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus/prometheus.yml


### Ejecutar prometheus (testear no esta en playbook)

sudo -u prometheus /usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

### ejecutar prometheus como servicio.

sudo nano /etc/systemd/system/prometheus.service

### contenido del archivo prometheus.service

[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target

### cargar/iniciar el servicio de prometheus.

sudo systemctl daemon-reload
sudo systemctl start prometheus

### cargar el servicio cada vez que se reinicie el server.

sudo systemctl enable prometheus

## Instalar y configurar node exporter.

curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz

sha256sum node_exporter-1.6.1.linux-amd64.tar.gz

tar xvf node_exporter-1.6.1.linux-amd64.tar.gz

cp node_exporter-1.6.1.linux-amd64/node_exporter /usr/local/bin/

sudo useradd -rs --create-home /nonexistent /bin/false node_exporter

sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

sudo nano /etc/systemd/system/node_exporter.service

### contenido del archivo node_exporter.service

[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target

### recargar los servicios

sudo systemctl daemon-reload

### iniciar el servicio

sudo systemctl start node_exporter
sudo systemctl status node_exporter

### activar el servicio

sudo systemctl enable node_exporter

### Links

https://github.com/prometheus/node_exporter
https://prometheus.io/docs/guides/node-exporter/
https://prometheus.io/download/

### configurar prometheus con el exporter.

sudo nano /etc/prometheus/prometheus.yml

### agregar el siguiente contenido al archivo de configuracion prometheus.yml

- job_name: 'node_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['192.168.1.13:9100']

### reiniciar el servicio de prometheus.

sudo systemctl restart prometheus
sudo systemctl status prometheus


## Instalar jenkins

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins

sudo systemctl start jenkins.service

sudo systemctl status jenkins

### Acceder a la interfaz web de jenkins para configuralo.

### obtener el password de jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

sudo apt install openjdk-17-jre

### En caso de fallo
Si encuentran una falla cuando intentan iniciar el servicio de jenkins reinicien la VM.

### instalar sshpass
apt-get install sshpass
## prueba de carga apache benchmark

sudo apt install apache2-utils

ab -n 1000 -c 100 http://wordpress.educacionit.local

https://httpd.apache.org/docs/2.4/programs/ab.html