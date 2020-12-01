---
lang: es
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Instalar en pc domoticz.'
title: 'Instalar en pc domoticz.'
---

A continuación se muestra un ejemplo de una instalación de domoticz en raspbian.

Comenzamos creando un usuario dedicado, luego instalamos domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Presione Enter cuando se presente (\<OK> estas la sola elekto).  
Elección de servicios: deje http y https marcados, vaya a OK, ingrese.  
_«HTTP Port number:»_ salga de 8080, vaya a OK, presione Enter.  
_«HTTPS Port number:»_ poner 8443, ir a OK, entrar.  
_«Installation Folder:»_ metu _/home/domoticz/domoticz_, vaya a OK, ingrese.  
_«Installation Complete!»_  , Entrar.


Ahora creamos el _«systemd»_ servicio que lanzará domoticz:
```bash
service domoticz stop
rm /etc/*.d/*domoticz*
echo "[Unit]
Description=domoticz

[Service]
ExecStart=/home/domoticz/domoticz/domoticz -daemon -www 8080 -sslwww 8443 -pidfile /var/run/domoticz/domoticz.pid
User=domoticz
RuntimeDirectory=domoticz
LogsDirectory=domoticz
Restart=on-abort
PIDFile=/var/run/domoticz/domoticz.pid

[Install]
WantedBy=multi-user.target
" >/etc/systemd/system/domoticz.service
echo "domoticz ALL=(root) NOPASSWD: /usr/sbin/service domoticz.sh *,/bin/systemctl stop domoticz.service,/bin/systemctl start domoticz.service
" >/etc/sudoers.d/010_domoticz
chmod 440 /etc/sudoers.d/010_domoticz
systemctl daemon-reload
chown -R domoticz.domoticz domoticz
systemctl enable domoticz
systemctl start domoticz
```

domoticz está instalado y accesible en:
* del pi: <http://localhost:8080> o <https://localhost:8443>
* de la red: <http://ip-adreso_de_la_pi:8080> o <https://ip-adreso_de_la_pi:8443>

cualquier configuración:  
ir _«Setup --> Settings»_  
cambiar idioma, establecer ubicación  
definir seguridad: nombre de usuario y contraseña  
definir el "Redes de área local", ejemplo: _«127.0.0.\*;192.168.0.*»_  
activar "Copia de seguridad automática"  
Hardware / Dispositivos: deshabilitar "Aceptar nuevos dispositivos"  
hacer clic "Aplicar configuraciones".  

Ahora necesitamos agregar el hardware.  
ver <https://www.domoticz.com/wiki/Getting_started>

Para más detalles,
ver <https://www.domoticz.com/wiki/Raspberry_Pi>
