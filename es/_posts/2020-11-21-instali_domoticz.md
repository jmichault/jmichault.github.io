---
komentoj_id: 3
lang: es
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Instale domoticz.'
title: 'Instale domoticz.'
---

A continuación se muestra un ejemplo de una instalación de domoticz en raspbian.

Comenzamos creando un usuario dedicado, luego instalamos domoticz:
```bash
sudo bash
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
Presione Enter cuando se muestre la presentación ( _\<OK>_ estas la sola elekto).  
  
  
Selección de servicios: deje _http_ y _https_ marcados, vaya a _OK_, presione Enter.  
_«HTTP Port number:»_ deje 8080, vaya a _OK_, presione Enter.  
_«HTTPS Port number:»_ ingrese 8443, vaya a _OK_, ingrese.  
_«Installation Folder:»_   PUT   _/home/domotiko/domoticz_  IR   _OK_, tecla de entrada.    
 _«Installation Complete!»_  , entra. 


Ahora creamos el servicio _«systemd»_ , que lanzará domoticz:
```bash
service domoticz stop
rm /etc/*.d/*domoticz*
echo "[Unit]
Description=domoticz

[Service]
ExecStart=/home/domotiko/domoticz/domoticz -daemon -www 8080 -sslwww 8443 -pidfile /var/run/domotiko/domoticz.pid
User=domotiko
RuntimeDirectory=domotiko
LogsDirectory=domotiko
Restart=on-abort
PIDFile=/var/run/domotiko/domoticz.pid

[Install]
WantedBy=multi-user.target
" >/etc/systemd/system/domoticz.service
echo "domotiko ALL=(root) NOPASSWD: /usr/sbin/service domoticz.sh *,/bin/systemctl stop domoticz.service,/bin/systemctl start domoticz.service
" >/etc/sudoers.d/010_domoticz
chmod 440 /etc/sudoers.d/010_domoticz
systemctl daemon-reload
chown -R domotiko.domotiko domoticz
systemctl enable domoticz
systemctl start domoticz
```

_domoticz_ está instalado y accesible:
* desde el pi: <http: // localhost: 8080> o <https: / / localhost: 8443>
* de la red: <http: // dirección_IP_de_pi:8080> aŭ <https://adreso_IP_de_pi: 8443>

alguna configuración:  
ir _«Setup --> Settings»_  
cambiar idioma, definir ubicación  
definir seguridad: nombre de usuario y contraseña  
definir las "Redes de área local", por ejemplo: _«127.0.0.\*;192.168.0.*»_  
Activar "Guardado automático"  
Hardware / dispositivos laterales: deshabilitar "Aceptar nuevos dispositivos"  
Haga clic en "Aplicar parámetros".  

Ahora necesitamos agregar el hardware.  
ver <https://www.domoticz.com/wiki/Getting_started>


Para más detalles,
ver <https://www.domoticz.com/wiki/Raspberry_Pi>

