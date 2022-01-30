---
komentoj_id: 3.
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
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
Premere Invio quando viene visualizzata la presentazione ( _\<OK>_ estas la sola elekto).  
  
  
Selezione dei servizi: lasciare _http_ e _https_ spuntati, andare su _OK_, premere Invio.  
_«HTTP Port number:»_ lasciare 8080, andare a _OK_, premere Invio.  
_«HTTPS Port number:»_ immettere 8443, andare a _OK_, entrare.  
_«Installation Folder:»_   Put   _/home/domotiko/domoticz_  Vai   _OK_, Tasto Input.    
 _«Installation Complete!»_  , entra. .


Ora creiamo il servizio _«systemd»_ , che lancerà domoticz:
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

_domoticz_ è installato e accessibile:
* da pi: <http: // localhost: 8080> o <https: / / localhost: 8443>
* della rete: <http: // indirizzo_IP_di_pi:8080> aŭ <https://adreso_IP_de_pi: 8443>

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

