---
komentoj_id: 1
lang: eo
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: Komenci
---

# enkonduko
Kiel komenco ekzemplo, vi povas fari hejmon Domotikan sistemon per nano-komputilo  _raspberry Pi3 B+_, dotante ĝin por administri 433 MHz-ekipaĵon kaj ekipaĵon  _zigbee_. Mi elektis la marferfkodan programaron Domoticz por pritrakti la aron. 

** La  _raspberry Pi3 B+_  havas por avantaĝoj: ** 

 1. lia malalta prezo 

 2. tre komforta komputila potenco por hejma aŭtomatigo. 

 3. konsumo reduktita. 

 4. neniu bezono de ventumilo. 

 5. konektebleco provizita: Ethernet Haveno, 4 USB-havenoj, WiFi, Bluetooth, GPIO-havenoj. 



** La intereso de la 433 MHz estas: ** 

 1. oni permesis al ni tutmonde dum jardekoj. 

 2. Rezulte, estas tre malmultekosta materialo. 


 
Liaj malavantaĝoj estas: 

 1. Ne estas difinita protokolo, ĉiu fabrikanto faras tion, kion li volas. 

 2. La protokolo uzata estas malofte bidirekta. 



** La intereso de ZigBee estas: ** 

 1. I estis desegnita por ebligi la konstruadon de malmultekostaj moduloj, kiel rezulto la prezoj iom post iom falas. 

 1. Ĝi uzas malfermitan, sekura kaj bidireccional protokolo. 

 1. Ĉiu modulo povas servi kiel relajso por pliigi la amplekson. 

 1. I uzas gamon de internacia frekvenco kaj por administri grandan nombron da moduloj. 

 1. I estis elektita de gravaj markoj kiel  _Philips_  ( System  _HUE_ ), IKEA  ( System  _TRÅDFRI_ ), Legrand, Xiaomi, kaj multaj pli ... 



# Paŝoj:

* [ Akiru la materialon ](_posts/2020-08-31-aparataro.md) 

* [ Instalu  _raspbian_ ](_posts/2020-12-22-instali_raspbian.md) 

* Programo La  _CC2531_   USB-ŝlosilo kun ZigBee-kunordiganto:  [   _flash\_cc2531_ ](https://jmichault.github.io/flash_cc2531-dok/) 

* Konstrui antenon por 433 MHz. 

* Instalu  _domoticz_ :  [  _domoticz.com_ ](https://www.domoticz.com/wiki/Raspberry_Pi) 

* Instalu  _zigbee_ :  [  _zigbee2mqtt.io_ ](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html) 

* Instalu  _rf\_gpio_ :  [  _github.com_ ](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md) 

* Konekti viajn unuajn erojn:   

  * Konekti termometron  _433Mhz_ 

  * Konekti a  _433Mhz_  socket

  * Konekti bulbon  _zigbee_ 


