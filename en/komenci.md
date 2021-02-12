---
lang: en
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 'To debut'
---

# introduction
As an example of a debut, you can create a home automation system with a nanocomputer _raspberry Pi3 B+_, equipping it to be able to manage 433 Mhz equipment and _zigbee_equipment. I chose the free program domoticz to manage everything.

**The _raspberry Pi3 B+_ has the following advantages:**

 1. its low price


 2. very comfortable computer power for home automation.


 3. reduced consumption.


 4. no fan needed.


 5. connectivity provided: ethernet port, 4 USB ports, Wifi, Bluetooth, GPIO ports.




**The interest of 433 Mhz is:**

 1. it has been licensed worldwide for decades.


 2. therefore there is very cheap material.



 
Its disadvantages are:

 1. there is no defined protocol, each manufacturer does what he wants.


 2. the protocol used is rarely bidirectional.




**The interest of zigbee is:**

 1. was designed to make it possible to build cheap modules, so that prices gradually fall.


 1. it uses an open, secure and two-way protocol.


 1. each module can be used as a relay to increase the sensing distance.


 1. it uses an international frequency range and makes it possible to manage a large number of modules.


 1. it has been elected by major brands such as _Philips_ (system _HUE_), Ikea (system _TRÅDFRI_), Legrand, Xiaomi, and many others .... °)




# Steps:

* [akiru aparataron](_posts/2020-08-31-aparataro.md)


* [install _raspbian_](_posts/2020-12-22-instali_raspbian.md)


* program the USB key _CC2531_  with the zigbee coordinator: [ the location of _flash_cc2531_](https://jmichault.github.io/flash_cc2531-dok/)


* build an antenna for 433 Mhz.


* install _domoticz_ : [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
  


* install _zigbee_ : [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)


* install _rf_gpio_ : [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
  


* Connect your first items:  


  * connect thermometer _433Mhz_


  * connect plug _433Mhz_


  * connect bulb _zigbee_



