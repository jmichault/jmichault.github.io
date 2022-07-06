---
lang: fr
lang-niv: fonto
layout: post
lang-ref: 
slug:
title: 
---

# installation

pré-requis :
  utilisateur domotiko créé et membre du groupe dialout.

## installer mosquitto :
  sudo apt install mosquitto
## installer zigbee2mqtt
 voir la procédure détaillée sur https://www.zigbee2mqtt.io/guide/installation/01_linux.html 
  se connecter pi
  sudo curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
  sudo apt-get install -y nodejs git make g++ gcc
  node --version  # Should output v18.X  or later
  npm --version  # Should output 8.X or later
  sudo git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt
  sudo chown -R domotiko:domotiko /opt/zigbee2mqtt
  cd /opt/zigbee2mqtt
  npm ci
  nano /opt/zigbee2mqtt/data/configuration.yaml
   # vérifier les deux lignes :
   ## base_topic: zigbee2mqtt
   ## server: 'mqtt://localhost'
  echo -e  "\n\nadvanced:\n    network_key: GENERATE" >> /opt/zigbee2mqtt/data/configuration.yaml
  sudo nano /etc/systemd/system/zigbee2mqtt.service
## y mettre :
[Unit]
Description=zigbee2mqtt
After=network.target

[Service]
ExecStart=/usr/bin/npm start
WorkingDirectory=/opt/zigbee2mqtt
StandardOutput=inherit
StandardError=inherit
Restart=always
User=domotiko

[Install]
WantedBy=multi-user.target
##########################
  sudo systemctl start zigbee2mqtt
  sudo systemctl enable zigbee2mqtt

## configuration initiale
nano /opt/zigbee2mqtt/data/configuration.yaml

si on a un CC2531, rajouter :
serial:
  disable_led: true
  port: /dev/ttyACM0
frontend:
  port: 8083


## mise à jour :
  se logger pi
  mettre à jour nodejs : à tester : 
	```curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
	sudo apt-get install -y nodejs git make g++ gcc
	```
  cd /opt/zigbee2mqtt
  ./update.sh

## migration vers un nouveau serveur : récupérer l'état zigbee :
  
  sudo systemctl stop zigbee2mqtt
  scp -p xxx:/opt/zigbee2mqtt/data/* /opt/zigbee2mqtt/data
  sudo systemctl start zigbee2mqtt
   
# plugin domoticz zigbee2mqtt 
## installation
se logger root (ou se logger pi, puis `sudo bash`)
su - domotiko
cd ~/domoticz/plugins
git clone https://github.com/stas-demydiuk/domoticz-zigbee2mqtt-plugin.git zigbee2mqtt
sudo systemctl restart domoticz
dans domoticz : ajouter un matériel de type zigbee2mqtt
activer le pairing au niveau du matériel domoticz quand on veut ajouter des dispositifs.
note : si les interrupteurs de volet sont reconnus à tort comme «Blind Percentage», il faut les modifier en «Venetian Blinds EU».
## mise à jour :
su - domotiko
cd ~/domoticz/plugins/zigbee2mqtt
git pull
exit
sudo systemctl restart domoticz
