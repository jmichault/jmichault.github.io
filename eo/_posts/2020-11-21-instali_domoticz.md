---
komentoj_id: 3
lang: eo
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Instalu domoticz.'
title: 'Instalu domoticz.'
---

Jen ekzemplo de domoticz-instalado sub raspbian.

Ni komencas kreante dediĉitan uzanton, poste ni instalas domoticz:
```bash
sudo bash
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
Premu Enter kiam la prezento montriĝas ( _\<OK>_ estas la sola elekto).  
  
Elekto de servoj: lasu _http_ kaj _https_ markajn, iru al _OK_, premu Enter.  
_«HTTP Port number:»_ forlasu 8080, iru al _OK_, premu Enter.  
_«HTTPS Port number:»_ metu 8443, iru al _OK_, Enigu.  
_«Installation Folder:»_  metu  _/home/domotiko/domoticz_ iru  _OK_, eniga klavo.   
_«Installation Complete!»_  , Eniru.


Nun ni kreas la servon _«systemd»_ , kiu lanĉos domoticz:
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

_domoticz_ estas instalita kaj alirebla:
* de la pi: <http://localhost:8080> aŭ <https://localhost:8443>
* de la reto: <http://adreso_IP_de_pi:8080> aŭ <https://adreso_IP_de_pi:8443>

iom da agordo:  
iru al _«Setup --> Settings»_  
ŝanĝi lingvon, difini lokon  
difini sekurecon: uzantnomo kaj pasvorto  
difini la "Lokajn retojn", ekzemple: _«127.0.0.\*;192.168.0.*»_  
Aktivigi "Aŭtomatan konservadon"  
Aparataro/Flankaparatoj: malaktivigi "Akcepti novajn aparatojn"  
Alklaku "Apliki parametrojn".  

Nun ni bezonas aldoni la aparataron.  
vidu <https://www.domoticz.com/wiki/Getting_started>


Por pli da detaloj,
vidu <https://www.domoticz.com/wiki/Raspberry_Pi>

