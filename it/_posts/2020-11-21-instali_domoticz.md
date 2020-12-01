---
lang: it
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Installare domoticz.'
title: 'Installare domoticz.'
---

Ecco un esempio di installazione di domoticz sotto raspbian.

Iniziamo creando un utente dedicato, poi installiamo domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Premere Invio quando viene presentato (\<OK> estas la sola elekto).  
Scelta dei servizi: lasciare spuntati http e https, andare su OK, entrare.  
_«HTTP Port number:»_ esci da 8080, vai su OK, premi Invio.  
_«HTTPS Port number:»_ metti 8443, vai su OK, entra.  
_«Installation Folder:»_ metu _/home/domoticz/domoticz_, vai su OK, entra.  
_«Installation Complete!»_  , Accedere.


Ora creiamo il file _«systemd»_ servizio che lancerà domoticz:
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

domoticz è installato e accessibile a:
* del pi: <http://localhost:8080> o <https://localhost:8443>
* della rete: <http://ip-adreso_de_la_pi:8080> o <https://ip-adreso_de_la_pi:8443>

qualsiasi configurazione:  
vai a _«Setup --> Settings»_  
cambia lingua, imposta posizione  
definire la sicurezza: nome utente e password  
definire il "Reti locali", esempio: _«127.0.0.\*;192.168.0.*»_  
attivare "Backup automatico"  
Hardware / dispositivi: disabilita "Accetta nuovi dispositivi"  
clic "Applica le impostazioni".  

Ora dobbiamo aggiungere l'hardware.  
vedere <https://www.domoticz.com/wiki/Getting_started>

Per ulteriori dettagli,
vedere <https://www.domoticz.com/wiki/Raspberry_Pi>
