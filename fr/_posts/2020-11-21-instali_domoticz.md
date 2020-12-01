---
lang: fr
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Installer domoticz.'
title: 'Installer domoticz.'
---

Voici un exemple d'installation domoticz sous raspbian.

Nous commençons par créer un utilisateur dédié, puis nous installons domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Appuyez sur Entrée lorsque la présentation s'affiche (\<OK> est le seul choix).  
Choix des services: laissez http et https cochés, allez sur OK, appuyez sur Entrée.  
_«HTTP Port number:»_ laissez 8080, allez sur OK, appuyez sur Entrée.  
_«HTTPS Port number:»_ mettez 8443, allez à OK, Entrée.  
_«Installation Folder:»_ mettre _/home/domoticz/domoticz_, allez à OK, Entrée.  
_«Installation Complete!»_  , Entrée.


Maintenant, nous créons le service _«systemd»_ qui lancera domoticz:
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

domoticz est installé et accessible :
* du pi: <http://localhost:8080> ou <https://localhost:8443>
* du réseau: <http://adresse_IP_du_pi:8080> ou <https://adresse_IP_du_pi:8443>

un peu de configuration:  
aller à _«Setup --> Settings»_  
changer de langue, définir l'emplacement  
définir la sécurité: nom d'utilisateur et mot de passe  
définir la "Réseaux locaux", exemple: _«127.0.0.\*;192.168.0.*»_  
Activer "Sauvegarde automatique"  
Matériel/Périphériques: désactiver "Accepter de nouveaux appareils"  
Cliquez sur "Appliquer les paramètres".  

Nous devons maintenant ajouter le matériel.  
voir <https://www.domoticz.com/wiki/Getting_started>

Pour plus de détails,
voir <https://www.domoticz.com/wiki/Raspberry_Pi>
