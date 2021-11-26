---
lang: fr
lang-niv: homa
lang-ref: aparataro
layout: post
slug: Matériel
title: 'Matériel pour débuter.'
komentoj_id: 2
---
   
# Les matériels pour le système domotique

Voici le matériel que j'ai utilisé pour construire mon système domotique, permettant de contrôler des équipements 433 Mhz et des équipements zigbee.

|type|image|marque|modèle|prix indicatif|Pourquoi|
| --- | --- | --- | --- | --- | --- | 
|ordinateur|![](/public/pi.jpg) | _raspberry_ |pi3b+| 35€ |pas de ventilateur, pas cher, a gpio, wifi, LAN RJ45|
|boîtier d'ordinateur|![](/public/loĝejo.jpg) | _Aukru_ | | 7€ |tout boîtier d'ordinateur pour _raspberry-pi3_ convient. Choisissez celui que vous préférez.|
|source de courant|![](/public/elektroprovizo.jpg) | _Konky_ | | 10€ |Quand mon alimentation "spéciale _raspberry-pi3_" s'est avérée trop faible, je l'ai remplacée avec succès par celle-ci. De nombreux autres modèles conviennent.|
|câble USB|  |  |USB vers micro USB| 2€ |pour connecter le _raspberry-pi3_ à l'alimentation|
|carte Micro SD|![](/public/SD.jpg) | _sandisk_ | SDSQUAR-032G-GN6MA | 11€ |le pi a besoin d'une carte de qualité, il est fortement recommandé d'utiliser une carte d'une marque bien connue.|
|Câbles Dupont|![](/public/dupont.jpg) | _SODIAL_ |Câbles Dupont femelle-femelle. 068187| 2€|pour connecter des appareils 433 Mhz et flasher une clé USB zigbee|
|émetteur + récepteur|![](/public/dissendilo-ricevilo-433Mhz.jpg) | |wl101-341 + wl102-341| 2€ |Émetteur + récepteur superhétérodyne 433mhz|
|câble| | || 0€ |un morceau de câble pour faire une antenne. Par exemple, un vieux câble réseau de 3 mètres.|
|blindage| | |Feuille de papier alu insérée dans une feuille de papier pliée en deux| 0€ |pour protéger le récepteur 433 Mhz des interférences générées par le _raspberry-pi3_.|
| Clé USB _Zigbee_ et câble|![](/public/cc2531+kablo.jpg) |  | CC2531|6€ | clé _zigbee_ et câble de téléchargement pour CC|
| | | | **prix total** | **75€** | 



# Les dispositifs à piloter.

De nombreux appareils peuvent être contrôlés. Pour commencer, ces trois éléments me semblent particulièrement intéressants :

|type|technologie|image|marque|modèle|prix indicatif|Pourquoi|
| --- | --- | --- | --- | --- | --- | --- |
| thermomètre |433 Mhz| ![](/public/fanju.jpeg)| _Fanju_ |par fj3378| 7.50€|un thermomètre avec écran à un prix raisonnable.|
| prises électriques |433 Mhz|![](/public/KYG.jpg)| _KYG_ | 4315 | 33€ |5 prises télécommandées à un prix raisonnable.|
|ampoule| _zigbee_ |![](/public/tradfri.jpg)| _Ikea_ | _TRÅDFRI_ LED E27 806 lumens| 10€ |ampoule réglable à un prix raisonnable.|
| | | | | **prix total** | **50,5€** | |

