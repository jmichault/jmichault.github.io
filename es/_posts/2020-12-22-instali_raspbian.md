---
lang: es
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'instalar raspbian'
title: 'instalar _raspbian_ en el _Raspberry_'
---

Escribiremos el sistema _raspbian_ en la tarjeta micro-SD, luego haremos algunas configuraciones básicas del sistema. 


# Para preparar la tarjeta Micro-SD.

En este ejemplo, elegí preparar la tarjeta micro-SD para mi computadora Debian Linux _raspberry pi 3_ y desde la línea de comandos.

Si esto no satisface sus deseos, encontrará fácilmente otros métodos en Internet, por ejemplo, en la web <https://howtoraspberrypi.com/>.

 1. **obtenga la última versión de _raspbian_ del sitio web oficial:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
Anote el nombre del archivo extraído del archivo zip.
    
 2. **identifica los discos actuales:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
Tenga en cuenta el resultado del comando.
3. **inserte la tarjeta en la computadora**
    
    luego identifique la ruta de la tarjeta:
    
    ```bash
    ls -lrt /dev/sd?
    ```
esta suele ser la última línea.  
    **ADVERTENCIA** : compruebe que este dispositivo no estaba presente antes \(vea lo que se mostró en el paso 2\) **!!!**

 4. **escribir una imagen en una tarjeta**



    Ejecute el siguiente comando, reemplazando _vojo\_raspbian_ con el nombre anotado en el paso 1 y _vojo\_karto_ con el nombre anotado en el paso 3.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (duración: ~40 minutos)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


# primer inicio de _raspberry_
Conecte el teclado, el mouse y la pantalla, inserte la tarjeta micro-SD en _raspberry_.  
Conecte la alimentación al _raspberry_.

Se inicia _raspberry_ y se inicia la utilidad de configuración. Déjese guiar para configurar el país, la contraseña, la red wifi.

Le aconsejo que le dé una dirección IP fija a su _raspberry_. Puede hacer esto en su servidor DHCP, si tiene uno, o en la configuración de _raspberry_.  
Para hacer esto en el nivel de _raspberry_, simplemente modifique el archivo _/etc/dhcpcp.conf_, por ejemplo con _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

Luego, debe modificar o agregar la configuración de interfaz que le interese (eth0 para la red cableada, wlan0 para la red wifia). Por ejemplo, para asignar la dirección IP 192.168.0.101 a una red cuyo enrutador es 192.168.0.1:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
También puede especificar los servidores de nombres (DNS). 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
si desea acceder a la línea de comando de forma remota, habilite ssh:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Para mantener el _raspberry_ a tiempo, instale ntp:

```bash
sudo apt install ntp
```

Si no lo necesita, eliminación de:
Purge apt wolfram-motor wolframscript libreoffice*
Apt Pure all
