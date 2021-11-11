---
komentoj_id: 3
lang: de
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Installieren Sie domoticz.'
title: 'Installieren Sie domoticz.'
---

Hier ist ein Beispiel einer Domoticz-Installation unter Raspbian.

Wir erstellen zunächst einen dedizierten Benutzer und installieren dann domoticz:
```bash
sudo bash
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
Drücken Sie die Eingabetaste, wenn die Präsentation angezeigt wird ( _\<OK>_ estas la sola elekto).  
.  
  
Auswahl der Dienste: Lassen Sie _http_ und _https_ aktiviert, gehen Sie zu _OK_und drücken Sie die Eingabetaste.  
_«HTTP Port number:»_ 8080 verlassen, zu _OK_gehen, Enter drücken.  
_«HTTPS Port number:»_ geben Sie 8443 ein, gehen Sie zu _OK_, geben Sie ein.  
_«Installation Folder:»_   Setzen Sie   _/home/domotiko/domoticz_  GO   _OK_, INPUT.    
 _«Installation Complete!»_  , komm herein. 


Jetzt erstellen wir den Dienst _«systemd»_ , der domoticz startet:
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

_domoticz_ ist installiert und zugänglich:
* vom pi: <http: // localhost: 8080> oder <https: / / localhost: 8443>
* des Netzwerks: <http: // Adresse_IP_von_pi:8080> aŭ <https://adreso_IP_de_pi: 8443>

einige Konfiguration:  
gehe zu _«Setup --> Settings»_  
Sprache ändern, Ort definieren  
Sicherheit definieren: Benutzername und Passwort  
Definieren Sie die "lokalen Netzwerke", zum Beispiel: _«127.0.0.\*;192.168.0.*»_  
Aktivieren "Automatisches Speichern"  
Hardware / Nebengeräte: deaktivieren "Neue Geräte akzeptieren"  
Klicken Sie auf ". Übernehmen Sie die Parameter".  

Jetzt müssen wir die Hardware hinzufügen.  
sehen <https://www.domoticz.com/wiki/Getting_started>


Für mehr Details,
sehen <https://www.domoticz.com/wiki/Raspberry_Pi>

