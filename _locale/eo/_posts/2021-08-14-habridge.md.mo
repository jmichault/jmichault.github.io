��          �      |      �  �  �  [   �  ^   .  #   �  �   �  E   5  �   {  !     �  ;               (     .     1     :     V  \   [  \   �  d  	  �   z  W      �   x  �  Y  Z   :  H   �  %   �  b     6   g  �   �  !   7  �  Y     #     /     B     G     J     S     l  [   q  \   �  d  *  �   �  W   5                  
         	                                                                              ProxyPass         /api  http://localhost:8082/api nocanon
        ProxyPassReverse  /api  http://localhost:8082/api
        ProxyRequests     Off
        AllowEncodedSlashes NoDecode

        # Local reverse proxy authorization override
        # Most unix distribution deny proxy by default (ie /etc/apache2/mods-enabled/proxy.conf in Ubuntu)
        <Proxy http://localhost:8082/api*>
                  Order deny,allow
                  Allow from all
        </Proxy>
  _ha-bridge_ est un logiciel qui simule sur votre ordinateur un pont _zigbee Philips Hue_.
 Après migration du _pi_ vers _bullseye_, _apache_ ne démarrait pas au démarrage.
Erreurs :
 Lien _Domoticz-Alexa_ : _ha-bridge_ Maintenant le premier démarrage d' _apache_ échoue, mais une deuxième tentative réussit automatiquement 10 secondes plus tard.
 On va installer avec l'utilisateur _domoticz_ précédemment créé.
 Par défaut _ha-bridge_ écoute sur le port 80, déjà utilisé par _apache_, on va le faire écouter sur le port 8082 pour réduire les risques de conflit.
 Restart=on-failure
RestartSec=10
 Sep 23 17:45:24 localhost apachectl[500]: (99)Cannot assign requested address: AH00072: make_sock: could not bind to address 192.168.24.103:80
Sep 23 17:45:24 localhost apachectl[500]: no listening sockets available, shutting down
Sep 23 17:45:24 localhost apachectl[500]: AH00015: Unable to open logs
Sep 23 17:45:24 localhost apachectl[449]: Action 'start' failed.
Sep 23 17:45:24 localhost apachectl[449]: The Apache error log may have more information.
 _ha-bridge_ création du service : fonto fr habridge installation de _ha-bridge_ post pré-requis : 
* l'utilisateur _domoticz_ doit exister.
* _java_ >=8 doit être installé.
 sudo a2enmod proxy proxy_http headers
sudo nano /etc/apache2/sites-enabled/000-default.conf
 sudo bash
cat > /etc/systemd/system/ha-bridge.service <<!

[Unit]
Description=HA Bridge
Wants=network.target
After=network.target

[Service]
Type=simple

WorkingDirectory=/home/domoticz/ha-bridge
ExecStart=/usr/bin/java -jar -Dserver.port=8082 -Dconfig.file=/home/domoticz/ha-bridge/data/habridge.config /home/domoticz/ha-bridge/ha-bridge.jar
User=domoticz
RuntimeDirectory=domoticz
LogsDirectory=domoticz
Restart=on-abort
PIDFile=/var/run/domoticz/ha-bridge.pid

[Install]
WantedBy=multi-user.target
!

sudo systemctl daemon-reload
sudo systemctl start ha-bridge.service
sudo systemctl enable ha-bridge.service
 sudo su - domoticz
mkdir ha-bridge
cd ha-bridge
wget https://github.com/bwssytems/ha-bridge/releases/download/v5.4.1RC1/ha-bridge-5.4.1RC1.jar -O ha-bridge.jar
exit
 sudo systemctl enable apache2
sudo systemctl stop apache2
sudo systemctl start apache2
 Project-Id-Version: 
PO-Revision-Date: 2021-09-23 22:27+0200
Last-Translator: 
Language-Team: 
Language: eo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Poedit 2.4.2
         ProxyPass         /api  http://localhost:8082/api nocanon
        ProxyPassReverse  /api  http://localhost:8082/api
        ProxyRequests     Off
        AllowEncodedSlashes NoDecode

        # Local reverse proxy authorization override
        # Most unix distribution deny proxy by default (ie /etc/apache2/mods-enabled/proxy.conf in Ubuntu)
        <Proxy http://localhost:8082/api*>
                  Order deny,allow
                  Allow from all
        </Proxy>
  _ha-bridge_ estas programaro, kiu simulas ponton _zigbee Philips Hue_ en via  komputilo.
 Post migrado de _pi_ al _bullseye_, _apache_ ne komenciĝis ĉe lanĉo.
 Ligilo _Domoticz-Alexa_ : _ha-bridge_ Nun la unua komenco de _apache_ malsukcesas, sed dua provo aŭtomate sukcesas 10 sekundojn poste.
 Ni instalos kun la antaŭe kreita uzanto _domoticz_ .
 Defaŭlte _ha-bridge_ aŭskultas ĉe la haveno 80, jam uzata de _apache_, ni igos ĝin aŭskulti ĉe la haveno 8082 por redukti la riskon de konflikto.
 Restart=on-failure
RestartSec=10
 Sep 23 17:45:24 localhost apachectl[500]: (99)Cannot assign requested address: AH00072: make_sock: could not bind to address 192.168.24.103:80
Sep 23 17:45:24 localhost apachectl[500]: no listening sockets available, shutting down
Sep 23 17:45:24 localhost apachectl[500]: AH00015: Unable to open logs
Sep 23 17:45:24 localhost apachectl[449]: Action 'start' failed.
Sep 23 17:45:24 localhost apachectl[449]: The Apache error log may have more information.
 _ha-bridge_ kreante la servon: auto eo habridge instalado de _ha-bridge_ post antaŭkondiĉoj:
* la uzanto _domoticz_ devas ekzisti.
* _java_ >= 8 devas esti instalita.
 sudo a2enmod proxy proxy_http headers
sudo nano /etc/apache2/sites-enabled/000-default.conf
 sudo bash
cat > /etc/systemd/system/ha-bridge.service <<!

[Unit]
Description=HA Bridge
Wants=network.target
After=network.target

[Service]
Type=simple

WorkingDirectory=/home/domoticz/ha-bridge
ExecStart=/usr/bin/java -jar -Dserver.port=8082 -Dconfig.file=/home/domoticz/ha-bridge/data/habridge.config /home/domoticz/ha-bridge/ha-bridge.jar
User=domoticz
RuntimeDirectory=domoticz
LogsDirectory=domoticz
Restart=on-abort
PIDFile=/var/run/domoticz/ha-bridge.pid

[Install]
WantedBy=multi-user.target
!

sudo systemctl daemon-reload
sudo systemctl start ha-bridge.service
sudo systemctl enable ha-bridge.service
 sudo su - domoticz
mkdir ha-bridge
cd ha-bridge
wget https://github.com/bwssytems/ha-bridge/releases/download/v5.4.1RC1/ha-bridge-5.4.1RC1.jar -O ha-bridge.jar
exit
 sudo systemctl enable apache2
sudo systemctl stop apache2
sudo systemctl start apache2
 