---
lang: eo
lang-niv: homa
lang-ref: komenci
layout: page
title: 'Por debuti'
---

# enkonduko
Kiel ekzemplo de debuto, vi povas krei hejman aŭtomatan sistemon per nanokomputilo _raspberry Pi3 B+_, ekipante ĝin por povi administri 433 Mhz-ekipaĵojn kaj ekipaĵojn _zigbee_. Mi elektis la liberan programon domoticz por administri ĉion.

**La _raspberry Pi3 B+_ havas la jenajn avantaĝojn:**

 1. ĝia malalta prezo
 2. tre komforta komputila potenco por hejma aŭtomatigo.
 3. reduktita konsumo.
 4. neniu ventolilo bezonis.
 5. konektebleco provizita: ethernet-haveno, 4 USB-havenoj, Wifi, Bluetooth, GPIO-havenoj.


**La intereso de 433 Mhz estas:**

 1. ĝi estas rajtigita tutmonde de jardekoj.
 2. tial ekzistas tre malmultekosta materialo.

 
Ĝiaj malavantaĝoj estas:

 1. ne estas difinita protokolo, ĉiu fabrikanto faras tion, kion li volas.
 2. la uzata protokolo malofte estas dudirekta.


**La intereso de zigbee estas:**

 1. ĝi estis desegnita por ebligi konstrui malmultekostajn modulojn, do prezoj iom post iom falas.
 1. ĝi uzas malferman, sekuran kaj dudirektan protokolon.
 1. ĉiu modulo povas esti uzata kiel relajso por pliigi la sensodistancon.
 1. ĝi uzas internacian frekvencan gamon kaj ebligas administri grandan nombron da moduloj.
 1. ĝin elektis grandaj markoj kiel _Philips_ (sistemo _HUE_), Ikea (sistemo _TRÅDFRI_), Legrand, Xiaomi, kaj multaj aliaj ...


# Paŝoj:

* [akiru aparataron](_posts/2020-08-31-aparataro.md)
* [instali _raspbian_](_posts/2020-12-22-instali_raspbian.md)
* programu la firmvaron de la USB-ŝlosilo _CC2531_ : [github.com](https://github.com/jmichault/flash_cc2531)
* konstruu antenon por 433 Mhz.
* instali _domoticz_ : [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
* instali _zigbee_ : [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)
* instali _rf_gpio_ : [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
* malpermesi _sudo_ sen pasvorto
* instalu la rezervon: [borgbackup.readthedocs.io](https://borgbackup.readthedocs.io/en/stable/installation.html)
* Konekti viajn unuajn elementojn:  
  * konekti termometron
  * konekti ŝtopilon
  * konekti ampolon

