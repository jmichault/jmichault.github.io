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
Press Enter when the presentation is displayed (\<OK> is the only choice).  
Choice of services: leave http and https checked, go to OK, press Enter.  
_«HTTP Port number:»_ exit 8080, go to OK, press Enter.  
_«HTTPS Port number:»_ enter 8443, go to OK, Enter.  
_«Installation Folder:»_ set _/home/domoticz/domoticz_, go to OK, Enter.  
_«Installation Complete!»_  , Enter.


Now we create the service _«systemd»_ , which will launch domoticz:
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

domoticz is installed and accessible:
* from pi: <http: // localhost: 8080> or <https: // localhost: 8443>
* of the network: <http: // address_IP_of_pi:8080> ou <https://adresse_IP_du_pi: 8443>

some configuration:  
go to _«Setup --> Settings»_  
change language, define location  
define security: username and password  
define the "Local Area Networks", for example: _«127.0.0.\*;192.168.0.*»_  
Activate "Auto save"  
Hardware / Side devices: disable "Accept new devices"  
Click "Apply parameters".  

Now we need to add the hardware.  
see <https://www.domoticz.com/wiki/Getting_started>


For more details,
see <https://www.domoticz.com/wiki/Raspberry_Pi>

