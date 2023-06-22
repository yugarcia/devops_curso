# Comandos que ya hemos visto.
### Listar archivos.
```bash
ls
```
### Listar archivos con detalles.
```bash
ls -l
```
### Listar archivos con detalles y archivos ocultos.
```bash
ls -la
```
### Crear un archivo.
```bash
touch archivo.txt
```
### Crear un directorio.
```bash
mkdir directorio
```
### Eliminar un archivo.
```bash
rm archivo.txt
```
### Eliminar un directorio.
```bash
rm -r directorio
```

# Comandos para gestion de procesos.
### Listar procesos.
```bash
ps
```
### Listar procesos con detalles.
```bash
ps -l
```
### Listar procesos con detalles y procesos de todos los usuarios.
```bash
ps -aux
```
### Listar procesos con detalles y procesos de todos los usuarios y con el nombre del proceso completo.
```bash
ps -auxf
```

### Listar procesos y filtrar con grep.
```bash
ps -auxf | grep firefox
```
### Listar procesos y filtrar con grep y eliminar el proceso.
```bash
ps -auxf | grep firefox | kill -9
```

## montar y formatear un disco.
### Listar UUID de los discos.
```bash
lsblk -f
```
### Formatear un disco.
```bash
sudo mkfs.ext4 /dev/sdbX
```
### Montar un disco.
```bash
sudo mount /dev/sdbX /mnt
```
### Desmontar un disco.
```bash
sudo umount /dev/sdbX
```

### uso de fstab para montar un disco.
```bash
sudo blkid
```
```bash
sudo nano /etc/fstab
```
```bash
UUID=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX /mnt ext4 defaults 0 0
```
### Montar todos los discos que estan en fstab.
```bash
sudo mount -a
```
# Comandos basicos git
### Iniciar un repositorio.
```bash
git init
```
### Agregar archivos al repositorio.
```bash
git add .
``` 
### Agregar un commit.
```bash
git commit -m "mensaje"
```
### Agregar un repositorio remoto.
```bash
git remote add origin
```
### Subir cambios al repositorio remoto.
```bash
git push -u origin master
```
### Clonar un repositorio.
```bash
git clone
```
### Ver el estado de los archivos.
```bash
git status
```
### Ver el historial de commits.
```bash
git log
```
### Ver el historial de commits de forma grafica.
```bash
git log --graph
```
