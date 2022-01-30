---
komentoj_id: 3
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
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
Press Enter when the presentation is displayed ( _\<OK>_ estas la sola elekto).  
  
  
Selection of services: leave _http_ and _https_ checked, go to _OK_, press Enter.  
_«HTTP Port number:»_ leave 8080, go to _OK_, press Enter.  
_«HTTPS Port number:»_ enter 8443, go to _OK_, Enter.  
_«Installation Folder:»_   Put   _/home/domotiko/domoticz_  Go   _OK_, input key.    
 _«Installation Complete!»_  , come in. 


Now we create the service _«systemd»_ , which will launch domoticz:
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

_domoticz_ is installed and accessible:
* from the pi: <http: // localhost: 8080> or <https: / / localhost: 8443>
* of the network: <http: // address_IP_of_pi:8080> aŭ <https://adreso_IP_de_pi: 8443>

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

