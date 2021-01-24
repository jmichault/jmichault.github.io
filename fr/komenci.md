---
lang: fr
lang-niv: homa
lang-ref: 000-komenci
layout: page
title: 'Pour débuter'
---

# introduction
Comme exemple de début, vous pouvez réaliser un système domotique fait maison avec un nano-ordinateur _raspberry Pi3 B+_, en l’équipant pour pouvoir gérer des équipements 433 Mhz et des équipements _zigbee_. J’ai choisi le logiciel libre domoticz pour gérer l’ensemble.

**Le _raspberry Pi3 B+_ a pour avantages :**

 1. son bas prix
 2. une puissance de calcul trés confortable pour la domotique.
 3. une consommation réduite.
 4. pas besoin de ventilateur.
 5. une connectivité fournie : un port éthernet, 4 ports USB, le Wifi, le Bluetooth, des ports GPIO.


**L'intérêt du 433 Mhz est:**

 1. il est autorisé au niveau mondial depuis des décennies.
 2. de ce fait il existe du matériel très bon marché.

 
Ses inconvénients sont:

 1. il n’y a pas de protocole défini, chaque constructeur fait ce qu’il veut.
 2. le protocole utilisé est rarement bidirectionnel.


**L'intérêt du zigbee est:**

 1. il a été conçu pour rendre possible la construction de modules bon marché, de ce fait les prix sont en train de baisser progressivement.
 1. il utilise un protocole ouvert, sécurisé et bidirectionnel.
 1. chaque module peut servir comme relais pour augmenter la portée.
 1. il utilise une gamme de fréquence internationale et permettant de gérer un grand nombre de modules.
 1. il a été choisi par de grandes marques telles que _Philips_ (système _HUE_), Ikea (système _TRÅDFRI_), Legrand, Xiaomi, et bien d'autres ...


# Les étapes :

* [obtenir le matériel](_posts/2020-08-31-aparataro.md)
* [installer _raspbian_](_posts/2020-12-22-instali_raspbian.md)
* programmer le firmware de la clé USB _CC2531_ : [github.com](https://github.com/jmichault/flash_cc2531)
* construire une antenne pour 433 Mhz.
* installer _domoticz_ : [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
* installer _zigbee_ : [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)
* installez _rf_gpio_ : [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
* Connectez vos premiers éléments:  
  * connecter un thermomètre _433Mhz_
  * connecter une prise _433Mhz_
  * connecter une ampoule _zigbee_

