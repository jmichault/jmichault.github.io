---
lang: it
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Installa domoticz.'
title: 'Installa domoticz.'
---

Ecco un esempio di installazione di domoticz sotto raspbian.

Iniziamo creando un utente dedicato, poi installiamo domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Premere Invio quando viene visualizzata la presentazione (\<OK> è l'unica scelta).  
Scelta dei servizi: lasciare spuntati http e https, andare su OK, premere Invio.  
_«HTTP Port number:»_ esci da 8080, vai su OK, premi Invio.  
_«HTTPS Port number:»_ inserisci 8443, vai su OK, Invio.  
_«Installation Folder:»_ impostato _/home/domoticz/domoticz_, vai su OK, Invio.  
_«Installation Complete!»_  , Accedere.


Ora creiamo il servizio _«systemd»_ , che lancerà domoticz:
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

domoticz è installato e accessibile:
* da pi: <http: // localhost: 8080> o <https: // localhost: 8443>
* della rete: <http: // indirizzo_IP_di_pi:8080> ou <https://adresse_IP_du_pi: 8443>

alcune configurazioni:  
vai a _«Setup --> Settings»_  
cambia lingua, definisci posizione  
definire la sicurezza: nome utente e password  
definire le "reti locali", ad esempio: _«127.0.0.\*;192.168.0.*»_  
Attiva "Salvataggio automatico"  
Dispositivi hardware / laterali: disabilita "Accetta nuovi dispositivi"  
Fare clic su "Applica parametri".  

Ora dobbiamo aggiungere l'hardware.  
vedere <https://www.domoticz.com/wiki/Getting_started>


Per ulteriori dettagli,
vedere <https://www.domoticz.com/wiki/Raspberry_Pi>

