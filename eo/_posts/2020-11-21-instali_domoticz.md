---
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
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Premu Enter kiam la prezento montriĝas (\<Bone> estas la sola elekto).  
Elekto de servoj: lasu http kaj https kontrolitajn, iru al OK, premu Enter.  
_«HTTP Port number:»_ forlasu 8080, iru al OK, premu Enter.  
_«HTTPS Port number:»_ metu 8443, iru al OK, Enigu.  
_«Installation Folder:»_ metu _/home/domoticz/domoticz_, iru al OK, Enigu.  
_«Installation Complete!»_  , Eniru.


Nun ni kreas la servon _«systemd»_ , kiu lanĉos domoticz:
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

domoticz estas instalita kaj alirebla:
* de pi: <http: // localhost: 8080> aŭ <https: // localhost: 8443>
* de la reto: <http: // adreso_IP_de_pi:8080> ou <https://adresse_IP_du_pi: 8443>

iom da agordo:  
iru al _«Setup --> Settings»_  
ŝanĝi lingvon, difini lokon  
difini sekurecon: uzantnomo kaj pasvorto  
difini la "Lokajn retojn", ekzemple: _«127.0.0.\*;192.168.0.*»_  
Aktivigi "Aŭtomatan konservadon"  
Aparataro / Flankaparatoj: malaktivigi "Akcepti novajn aparatojn"  
Alklaku "Apliki parametrojn".  

Nun ni bezonas aldoni la aparataron.  
vidu <https://www.domoticz.com/wiki/Getting_started>


Por pli da detaloj,
vidu <https://www.domoticz.com/wiki/Raspberry_Pi>

