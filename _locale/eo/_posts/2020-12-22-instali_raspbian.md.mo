��    &      L  5   |      P  �   Q  �   �  |     U   �     R  5   �  �     5   �  '   �  J     !   ^  (   �  _   �  �   	  �   �  �   \	  {   �	  w   l
  :   �
       �   <  �   5  �   �  =   U     �     �     �  '   �     �  M   �  |   6     �  !   �  M   �     (     >  3   Z  �   �  n   o  �   �  r   l  P   �  z   0  3   �  �   �  (   �  &   �  E   �     &  '   B  N   j  �   �  �   @  �   �  h   \  o   �  2   5     h  �   �  q   i  �   �  4   n     �     �     �  %   �     �  M   �  |   A     �     �  =   �          3  3   O                            %      
                         #                                              "                             !   $       &         	                             **ATTENTION** : bien vérifier que ce périphérique n'était pas présent avant \(voyez ce qui avait été affiché à l'étape 2\) **!!!**
     Exécutez la commande ci-dessous, en remplaçant _chemin\_raspbian_ par le nom noté à l'étape 1, et _chemin\_carte_ par le nom noté à l'étape 3.
     ```bash
    ls -lrt /dev/sd?
    ```
    Notez le résultat de la commande.
 3. **insérez la carte dans l'ordinateur**
     ```bash
    ls -lrt /dev/sd?
    ```
    c'est normalement la dernière ligne.  
     ```bash
    sudo dd bs=1M if=chemin_raspbian of=chemin_carte status=progress conv=fsync
    ```
    (durée : ~40 minutes)
     ```bash
    sync
    eject chemin_carte
    ``` 
     ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
    Notez le nom du fichier extrait du fichier zip.
     puis identifiez le chemin d'accès de la carte :
 **identifier les disques présents :**
 **récupérer la dernière version de _raspbian_ sur le site officiel :**
 **écrire l'image sur la carte**
 Branchez l'alimentation du _raspberry_.
 Connectez un clavier, une souris et un écran, mettez la carte micro-SD dans le _raspberry_.  
 Dans cet exemple, j'ai choisi de préparer la carte micro-SD pour mon _raspberry pi 3_ depuis un PC sous linux debian, et en ligne de commande.
 Je vous conseille de donner une adresse IP fixe à votre _raspberry_. Vous pouvez le faire soit au niveau de votre serveur DHCP si vous en avez un, soit dans la configuration du _raspberry_.  
 Le _raspberry_ démarre, et l'utilitaire de configuration se lance. Laissez vous guider pour configurer le pays, le mot de passe, le réseau wifi.
 Nous allons écrire le système _raspbian_ sur la carte micro-SD, puis faire quelques configurations de base du système. 
 Pour le faire au niveau du _raspberry_, il suffit de modifier le fichier _/etc/dhcpcp.conf_, par exemple avec _nano_ :
 Pour que le _raspberry_ reste à l'heure, installez ntp :
 Préparer la carte micro-SD. Puis il faut modifier ou ajouter la configuration de l'interface qui vous intéresse (eth0 pour le réseau filaire, wlan0 pour le réseau wifi). Par exemple pour attribuer l'adresse IP 192.168.0.101 sur un réseau dont le routeur est 192.168.0.1 :
 Si vous n'en avez pas besoin, suppression de :
apt purge wolfram-engine wolframscript libreoffice*
apt autoremove
apt clean all
 Si ça ne correspond pas à vos souhaits, vous trouverez facilement d'autres méthodes sur internet, par exemple sur le site <https://howtoraspberrypi.com/>.
 Vous pouvez également préciser les serveurs de nom (DNS). 
 fonto fr instali_raspbian installer _raspbian_ sur le _Raspberry_ installer raspbian interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
 interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
 post premier démarrage du _raspberry_ si vous désirez accéder à distance à la ligne de commande, activez ssh :
 sudo apt install ntp
 sudo nano /etc/dhcpcd.conf
 sudo systemctl start ssh
sudo systemctl enable ssh
 Project-Id-Version: 
PO-Revision-Date: 2021-09-23 21:49+0200
Language: eo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Last-Translator: 
Language-Team: 
X-Generator: Poedit 2.4.2
     **AVERTO** : kontrolu, ke ĉi tiu aparato ne ĉeestis antaŭe \(vidu, kio montriĝis en paŝo 2\) **!!!**
     Rulu la suban komandon, anstataŭigante _vojo\_raspbian_ per la nomo notita en paŝo 1, kaj _vojo\_karto_ kun la nomo notita en paŝo 3.
     ```bash
    ls -lrt /dev/sd?
    ```
Notu la rezulton de la komando.
3. **enmetu la karton en la komputilon**
     ```bash
    ls -lrt /dev/sd?
    ```
ĉi tio estas kutime la lasta linio.  
     ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (daŭro: ~40 minutoj)
     ```bash
    sync
    eject vojo_karto
    ``` 
     ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
Notu la nomon de la dosiero ĉerpita de la zip-dosiero.
     tiam identigu la vojon de la karto:
 **identigu la ĉeestantajn diskojn:**
 **akiru la plej novan version de _raspbian_ de la oficiala retejo:**
 **skribu bildon al karto**
 Konekti la potencon al la _raspberry_.
 Konekti klavaron, muson kaj ekranon, enmeti mikro-SD-karton en _raspberry_.  
 En ĉi tiu ekzemplo, mi elektis prepari la mikro-SD-karton por mia _raspberry pi 3_ de Debian Linux-komputilo, kaj de la komandlinio.
 Mi konsilas al vi doni fiksan IP-adreson al via _raspberry_. Vi povas fari tion aŭ ĉe via DHCP-servilo, se vi havas, aŭ en la agordo de _raspberry_.  
 La _raspberry_ ekfunkciigas, kaj la agorda utileco startas. Lasu vin gvidi por agordi la landon, la pasvorton, la vifian reton.
 Ni skribos la sistemon _raspbian_ al la mikro-SDa karto, tiam ni faros iujn bazajn sistemajn agordojn. 
 Por fari ĝin je la nivelo de _raspberry_, simple modifu la dosieron _/etc/dhcpcp.conf_, ekzemple per _nano_ :
 Por teni la _raspberry_ ĝustatempe, instalu ntp:
 Prepari la mikro-SD-karton. Poste vi devas modifi aŭ aldoni la agordon de la interfaco, kiu interesas vin (eth0 por la kabligita reto, wlan0 por la vifia-reto). Ekzemple, por atribui la IP-adreson 192.168.0.101 al reto kies enkursigilo estas 192.168.0.1:
 Se vi ne bezonas ĝin, forigo de:
Purga APT Wolfram-motoro Wolframscript LibreOffice*
APT autémove
APT Pura All
 Se ĉi tio ne respondas al viaj deziroj, vi facile trovos aliajn metodojn en la interreto, ekzemple en la retejo <https://howtoraspberrypi.com/>.
 Vi ankaŭ povas specifi la nomajn servilojn (DNS). 
 auto eo instali_raspbian instalu _raspbian_ sur la _Raspberry_ instali raspbian interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
 interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
 post unua komenco de _raspberry_ se vi volas aliri la komandlinion malproksime, aktivigu ssh:
 sudo apt install ntp
 sudo nano /etc/dhcpcd.conf
 sudo systemctl start ssh
sudo systemctl enable ssh
 