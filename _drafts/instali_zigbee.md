---
lang: fr
lang-niv: fonto
layout: post
lang-ref: 
slug:
title: 
---


installer mosquitto
  sudo apt install mosquitto
installer zigbee2mqtt
 # suivre https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html :
  sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  sudo apt-get install -y nodejs git make g++ gcc
  node --version  # Should output v12.X or v10.X
  npm --version  # Should output 6.X
  sudo git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt
  sudo chown -R pi:pi /opt/zigbee2mqtt
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
User=pi

[Install]
WantedBy=multi-user.target
##########################
  sudo systemctl start zigbee2mqtt
  sudo systemctl enable zigbee2mqtt
## si migration : récupérer l'état zigbee :
  sudo systemctl stop zigbee2mqtt
  scp -p xxx:xxx/* /opt/zigbee2mqtt/data
  sudo systemctl start zigbee2mqtt
   
installer plugin zigbee
cd ~/domoticz/plugins
git clone https://github.com/stas-demydiuk/domoticz-zigbee2mqtt-plugin.git zigbee2mqtt
sudo systemctl restart domoticz
dans domoticz : ajouter un matériel de type zigbee2mqtt
activer le pairing au niveau du matériel domoticz quand on veut ajouter des dispositifs.
note : les interrupteurs de volet sont reconnus à tort comme «Blind Percentage», il faut les modifier en «Venetian Blinds EU».
