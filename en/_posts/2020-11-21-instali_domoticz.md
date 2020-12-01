---
lang: en
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Install domoticz.'
title: 'Install domoticz.'
---

Here is an example of a domoticz installation under raspbian.

We start by creating a dedicated user, then we install domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Press Enter when presented (\<OK> estas la sola elekto).  
Choice of services: leave http and https checked, go to OK, enter.  
_«HTTP Port number:»_ exit 8080, go to OK, press Enter.  
_«HTTPS Port number:»_ put 8443, go to OK, enter.  
_«Installation Folder:»_ metu _/home/domoticz/domoticz_, go to OK, enter.  
_«Installation Complete!»_  , Enter.


Now we create the _«systemd»_ service that will launch domoticz:
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

domoticz is installed and accessible at:
* of the pi: <http://localhost:8080> or <https://localhost:8443>
* of the network: <http://ip-adreso_de_la_pi:8080> or <https://ip-adreso_de_la_pi:8443>

any configuration:  
go to _«Setup --> Settings»_  
change language, set location  
define security: username and password  
define the "Local Area Networks", example: _«127.0.0.\*;192.168.0.*»_  
activate "Automatic Backup"  
Hardware / Devices: disable "Accept new Devices"  
click "Apply Settings".  

Now we need to add the hardware.  
see <https://www.domoticz.com/wiki/Getting_started>

For more details,
see <https://www.domoticz.com/wiki/Raspberry_Pi>
