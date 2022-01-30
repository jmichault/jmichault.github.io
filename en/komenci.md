---
komentoj_id: 1
lang: en
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 'To start'
---

# introduction
As a start example, you can make a home domain system with a nano computer   _raspberry Pi3 B+_, equipping it to manage 433 MHz equipment and equipment   _zigbee_. I chose the Martiaticz Marketball software to handle the set.  

**  The   _raspberry Pi3 B+_   has for benefits:  **  

 1. Its low price  


 2. Very comfortable computer power for home automation.  


 3. reduced consumption.  


 4. No need for a fan.  


 5. Connectability provided: Ethernet Port, 4 USB ports, WiFi, Bluetooth, GPI ports.  




**  The interest of the 433 MHz is:  **  

 1. We have allowed us worldwide for decades.  


 2. As a result, there are very cheap material.  



 
His disadvantages are:  

 1. There is no defined protocol, each manufacturer does what he wants.  


 2. The protocol used is rarely bidirect.  




**  ZigBee's interest is:  **  

 1. It was designed to enable the construction of cheap modules, as a result the prices gradually fall.  


 1. It uses an open, secure and bidirectional protocol.  


 1. Each module can serve as a relay to increase the scope.  


 1. It uses a range of international frequency and to manage a large number of modules.  


 1. It was chosen by important brands such as   _Philips_   (  System   _HUE_  ), IKEA   (  System   _TRÅDFRI_  ), LeGrand, Xiaomi, and many more ...  




# Steps:

* [  Get the material  ](_posts/2020-08-31-aparataro.md)  


* [  Install   _raspbian_  ](_posts/2020-12-22-instali_raspbian.md)  


*  Program The   _CC2531_    USB key with ZigBee coordinator:   [    _flash\_cc2531_  ](https://jmichault.github.io/flash_cc2531-dok/)  

* Build an antenna for 433 MHz.  


* Install   _domoticz_    [   _domoticz.com_  ](https://www.domoticz.com/wiki/Raspberry_Pi)  


* Install   _zigbee_    [   _zigbee2mqtt.io_  ](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)  


* Install   _rf\_gpio_    [   _github.com_  ](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)  


* Connect your first items:    


  * Connect a thermometer   _433Mhz_  


  * Connect A   _433Mhz_   Socket 


  * Connect bulb   _zigbee_  



