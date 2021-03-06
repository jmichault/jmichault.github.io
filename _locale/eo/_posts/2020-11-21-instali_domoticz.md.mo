��            )   �      �  #   �  W   �  ^     +   l     �  H   �  J   �  S   @  /   �  I   �  8     �   G  M   �  @   L  )   �  W   �  $     ,   4  <   a  H   �     �     �     �        �    S   �
     .  5   J    �  $   �  N   �  O         W     x  =   �  B   �  D     '   P  G   x  1   �  �   �  B   �  :   �  '   *  Q   R  "   �      �  +   �  D        Y     \     a     r  �  w  S   L     �  6   �                                                                       
                                     	                              Activer "Sauvegarde automatique"  
 Appuyez sur Entrée lorsque la présentation s'affiche ( _\<OK>_ est le seul choix).  
 Choix des services: laissez _http_ et _https_ cochés, allez sur _OK_, appuyez sur Entrée.  
 Cliquez sur "Appliquer les paramètres".  
 Installer domoticz. Maintenant, nous créons le service _«systemd»_ qui lancera domoticz:
 Matériel/Périphériques: désactiver "Accepter de nouveaux appareils"  
 Nous commençons par créer un utilisateur dédié, puis nous installons domoticz:
 Nous devons maintenant ajouter le matériel.  
 Pour plus de détails,
voir <https://www.domoticz.com/wiki/Raspberry_Pi>
 Voici un exemple d'installation domoticz sous raspbian.
 _domoticz_ est installé et accessible :
* du pi: <http://localhost:8080> ou <https://localhost:8443>
* du réseau: <http://adresse_IP_du_pi:8080> ou <https://adresse_IP_du_pi:8443>
 _«HTTP Port number:»_ laissez 8080, allez sur _OK_, appuyez sur Entrée.  
 _«HTTPS Port number:»_ mettez 8443, allez à _OK_, Entrée.  
 _«Installation Complete!»_  , Entrée.
 _«Installation Folder:»_ mettre _/home/domoticz/domoticz_, allez à _OK_, Entrée.  
 aller à _«Setup --> Settings»_  
 changer de langue, définir l'emplacement  
 définir la sécurité: nom d'utilisateur et mot de passe  
 définir les "Réseaux locaux", exemple: _«127.0.0.\*;192.168.0.*»_  
 fr homa instali-domoticz post service domoticz stop
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
 sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
 un peu de configuration:  
 voir <https://www.domoticz.com/wiki/Getting_started>
 Project-Id-Version: 
PO-Revision-Date: 2021-02-13 13:09+0100
Last-Translator: jean <>
Language: eo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Generator: Poedit 2.2.1
Language-Team: 
 Aktivigi "Aŭtomatan konservadon"  
 Premu Enter kiam la prezento montriĝas ( _\<OK>_ estas la sola elekto).  
  
 Elekto de servoj: lasu _http_ kaj _https_ markajn, iru al _OK_, premu Enter.  
 Alklaku "Apliki parametrojn".  
 Instalu domoticz. Nun ni kreas la servon _«systemd»_ , kiu lanĉos domoticz:
 Aparataro/Flankaparatoj: malaktivigi "Akcepti novajn aparatojn"  
 Ni komencas kreante dediĉitan uzanton, poste ni instalas domoticz:
 Nun ni bezonas aldoni la aparataron.  
 Por pli da detaloj,
vidu <https://www.domoticz.com/wiki/Raspberry_Pi>

 Jen ekzemplo de domoticz-instalado sub raspbian.
 _domoticz_ estas instalita kaj alirebla:
* de la pi: <http://localhost:8080> aŭ <https://localhost:8443>
* de la reto: <http://adreso_IP_de_pi:8080> aŭ <https://adreso_IP_de_pi:8443>
 _«HTTP Port number:»_ forlasu 8080, iru al _OK_, premu Enter.  
 _«HTTPS Port number:»_ metu 8443, iru al _OK_, Enigu.  
 _«Installation Complete!»_  , Eniru.
 _«Installation Folder:»_ metu _/home/domoticz/domoticz_, iru al _OK_, Enigu.  
 iru al _«Setup --> Settings»_  
 ŝanĝi lingvon, difini lokon  
 difini sekurecon: uzantnomo kaj pasvorto  
 difini la "Lokajn retojn", ekzemple: _«127.0.0.\*;192.168.0.*»_  
 eo auto instali-domoticz post service domoticz stop
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
 sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
 iom da agordo:  
 vidu <https://www.domoticz.com/wiki/Getting_started>

 