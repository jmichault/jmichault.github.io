---
lang: fr
lang-niv: fonto
layout: post
lang-ref: instali_raspbian
slug: installer raspbian
title: installer raspbian sur le raspberry
---

Nous allons écrire le système raspbian sur la carte micro-SD, puis faire quelques configurations de base du système.


# Préparer la carte _micro-SD_.

Dans cet exemple, j'ai choisi de préparer la carte micro-SD pour mon _raspberry pi 3_ depuis un PC sous linux debian, et en ligne de commande.

Si ça ne correspond pas à vos souhaits, vous trouverez facilement d'autres méthodes sur internet, par exemple sur le site <https://howtoraspberrypi.com/>.

1.  récupérer la dernière version de raspbian sur le site officiel :

    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
    Notez le nom du fichier extrait du fichier zip.

2.  identifier les disques présents :  

    ```bash
    ls -lrt /dev/sd?
    ```
	Notez le résultat de la commande.
3. insérez la carte dans l'ordinateur  
    puis identifier le chemin d'accès de la carte :
    
    ```bash
    ls -lrt /dev/sd?
    ```
	c'est normalement la dernière ligne.  
	**ATTENTION** : bien vérifier que ce périphérique n'était pas présent avant \(voyez ce qui avait été affiché à l'étape 2\) **!!!**

4. écrire l'image sur la carte

	Exécutez la commande ci-dessous, en remplaçant chemin_vers_le_img_de_raspbian par le nom noté à l'étape 1, et chemin_vers_votre_carte par le nom noté à l'étape 3.
	```bash
	sudo dd bs=1M if=chemin_vers_le_img_de_raspbian of=chemin_vers_votre_carte status=progress conv=fsync
	```
	(durée : ~40 minutes)
	
	```bash
	sync
	eject chemin_vers_votre_carte
	``` 


# premier démarrage du raspberry
Connectez un clavier, une souris et un écran, mettez la carte micro-SD dans le raspberry.  
Branchez l'alimentation du raspberry.

Configurez le réseau et le nom d'hôte.


activer ssh :

```bash
service ssh start
update-rc.d ssh enable
```

Sécurisez le pi :
changez le mot de passe de l'utilisateur pi.

outils divers :
apt install ntp




installer passerelle alexia : habridge

configurer habridge ou récupérer la config

