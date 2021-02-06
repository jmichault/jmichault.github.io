---
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
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Drücken Sie die Eingabetaste, wenn die Präsentation angezeigt wird (\<. OK> ist die einzige Option).  
Auswahl der Dienste: Lassen Sie http und https aktiviert, gehen Sie zu OK und drücken Sie die Eingabetaste.  
_«HTTP Port number:»_ Beenden Sie 8080, gehen Sie zu OK und drücken Sie die Eingabetaste.  
_«HTTPS Port number:»_ geben Sie 8443 ein, gehen Sie zu OK, geben Sie ein.  
_«Installation Folder:»_ einstellen _/home/domoticz/domoticz_, gehen Sie zu OK, Enter.  
_«Installation Complete!»_  , Eingeben.


Jetzt erstellen wir den Dienst _«systemd»_ , der domoticz startet:
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

domoticz ist installiert und zugänglich:
* von pi: <http: // localhost: 8080> oder <https: // localhost: 8443>
* des Netzwerks: <http: // Adresse_IP_von_pi:8080> ou <https://adresse_IP_du_pi: 8443>

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

