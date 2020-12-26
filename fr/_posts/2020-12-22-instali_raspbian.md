---
lang-niv: fonto
layout: post
lang-ref: instali_raspbian
slug: installer raspbian
title: installer _raspbian_ sur le _Raspberry_
lang: fr
---

Nous allons écrire le système _raspbian_ sur la carte micro-SD, puis faire quelques configurations de base du système. 


# Préparer la carte micro-SD.

Dans cet exemple, j'ai choisi de préparer la carte micro-SD pour mon _raspberry pi 3_ depuis un PC sous linux debian, et en ligne de commande.

Si ça ne correspond pas à vos souhaits, vous trouverez facilement d'autres méthodes sur internet, par exemple sur le site <https://howtoraspberrypi.com/>.

 1. **récupérer la dernière version de _raspbian_ sur le site officiel :**

    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
    Notez le nom du fichier extrait du fichier zip.
    
 2. **identifier les disques présents :**
    
    ```bash
    ls -lrt /dev/sd?
    ```
    Notez le résultat de la commande.
 3. **insérez la carte dans l'ordinateur**
    
    puis identifiez le chemin d'accès de la carte :
    
    ```bash
    ls -lrt /dev/sd?
    ```
    c'est normalement la dernière ligne.  
    **ATTENTION** : bien vérifier que ce périphérique n'était pas présent avant \(voyez ce qui avait été affiché à l'étape 2\) **!!!**

 4. **écrire l'image sur la carte**

    Exécutez la commande ci-dessous, en remplaçant _chemin\_raspbian_ par le nom noté à l'étape 1, et _chemin\_carte_ par le nom noté à l'étape 3.
    
    ```bash
    sudo dd bs=1M if=chemin_raspbian of=chemin_carte status=progress conv=fsync
    ```
    (durée : ~40 minutes)
    
    ```bash
    sync
    eject chemin_carte
    ``` 


# premier démarrage du _raspberry_
Connectez un clavier, une souris et un écran, mettez la carte micro-SD dans le _raspberry_.  
Branchez l'alimentation du _raspberry_.

Le _raspberry_ démarre, et l'utilitaire de configuration se lance. Laissez vous guider pour configurer le pays, le mot de passe, le réseau wifi.

Je vous conseille de donner une adresse IP fixe à votre _raspberry_. Vous pouvez le faire soit au niveau de votre serveur DHCP si vous en avez un, soit dans la configuration du _raspberry_.  
Pour le faire au niveau du _raspberry_, il suffit de modifier le fichier _/etc/dhcpcp.conf_, par exemple avec _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

Puis il faut modifier ou ajouter la configuration de l'interface qui vous intéresse (eth0 pour le réseau filaire, wlan0 pour le réseau wifi). Par exemple pour attribuer l'adresse IP 192.168.0.101 sur un réseau dont le routeur est 192.168.0.1 :

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
Vous pouvez également préciser les serveurs de nom (DNS). 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
si vous désirez accéder à distance à la ligne de commande, activez ssh :

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Pour que le _raspberry_ reste à l'heure, installez ntp :

```bash
sudo apt install ntp
```

