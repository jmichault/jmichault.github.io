---
lang: de
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 'Zum Debüt'
---

# Einführung
Als Beispiel für ein Debüt können Sie ein Hausautomationssystem mit einem Nanocomputer _raspberry Pi3 B+_erstellen, mit dem 433-MHz-Geräte und _zigbee_Geräte verwaltet werden können. Ich habe das kostenlose Programm domoticz gewählt, um alles zu verwalten.

**Das _raspberry Pi3 B+_ hat die folgenden Vorteile:**

 1. sein niedriger Preis


 2. Sehr komfortable Computerleistung für die Heimautomation.


 3. reduzierter Verbrauch.


 4. Kein Lüfter erforderlich.


 5. Konnektivität bereitgestellt: Ethernet-Port, 4 USB-Ports, Wifi, Bluetooth, GPIO-Ports.




**Das Interesse von 433 MHz ist:**

 1. Es ist seit Jahrzehnten weltweit lizenziert.


 2. Daher gibt es sehr billiges Material.



 
Seine Nachteile sind:

 1. Es gibt kein definiertes Protokoll, jeder Hersteller macht, was er will.


 2. Das verwendete Protokoll ist selten bidirektional.




**Das Interesse von zigbee ist:**

 1. wurde entwickelt, um den Bau billiger Module zu ermöglichen, so dass die Preise allmählich fallen.


 1. Es verwendet ein offenes, sicheres und bidirektionales Protokoll.


 1. Jedes Modul kann als Relais verwendet werden, um den Erfassungsabstand zu vergrößern.


 1. Es verwendet einen internationalen Frequenzbereich und ermöglicht die Verwaltung einer großen Anzahl von Modulen.


 1. Es wurde von großen Marken wie _Philips_ (System _HUE_), Ikea (System _TRÅDFRI_), Legrand, Xiaomi und vielen anderen ...gewählt. °)




# Schritte:

* [akiru aparataron](_posts/2020-08-31-aparataro.md)


* [installiere _raspbian_](_posts/2020-12-22-instali_raspbian.md)


* Programmieren Sie den USB-Stick _CC2531_  mit dem ZigBee-Koordinator: [ die Position von _flash_cc2531_](https://jmichault.github.io/flash_cc2531-dok/)


* baue eine Antenne für 433 MHz.


* install _domoticz_ : [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
  


* install _zigbee_ : [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)


* installiere _rf_gpio_ : [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
  


* Verbinde deine ersten Gegenstände:  


  * Thermometer anschließen _433Mhz_


  * Stecker anschließen _433Mhz_


  * Glühlampe anschließen _zigbee_



