---
lang: de
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Installieren domoticz.'
title: 'Installieren domoticz.'
---

Hier ist ein Beispiel einer Domoticz-Installation unter Raspbian.

Wir erstellen zunächst einen dedizierten Benutzer und installieren dann domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Drücken Sie bei der Eingabe die Eingabetaste (\<OK> estas la sola elekto).  
Auswahl der Dienste: Lassen Sie http und https aktiviert, gehen Sie zu OK und geben Sie ein.  
_«HTTP Port number:»_ Beenden Sie 8080, gehen Sie zu OK und drücken Sie die Eingabetaste.  
_«HTTPS Port number:»_ 8443 setzen, auf OK gehen, eingeben.  
_«Installation Folder:»_ metu _/home/domoticz/domoticz_, gehe zu OK, gib ein.  
_«Installation Complete!»_  , Eingeben.


Jetzt erstellen wir die _«systemd»_ Dienst, der domoticz startet:
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

domoticz ist installiert und zugänglich unter:
* des pi: <http://localhost:8080> oder <https://localhost:8443>
* des Netzwerks: <http://ip-adreso_de_la_pi:8080> oder <https://ip-adreso_de_la_pi:8443>

Beliebige Konfiguration:  
gehe zu _«Setup --> Settings»_  
Sprache ändern, Ort einstellen  
Sicherheit definieren: Benutzername und Passwort  
definiere das "Lokale Netzwerke"Beispiel: _«127.0.0.\*;192.168.0.*»_  
aktivieren Sie "Automatische Sicherung"  
Hardware / Geräte: deaktivieren "Akzeptiere neue Geräte"  
klicken "Einstellungen übernehmen".  

Jetzt müssen wir die Hardware hinzufügen.  
sehen <https://www.domoticz.com/wiki/Getting_started>

Für mehr Details,
sehen <https://www.domoticz.com/wiki/Raspberry_Pi>
