---
lang: it
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 'Per debuttare'
---

# introduzione
A titolo di esempio di debutto, è possibile realizzare un impianto domotico con nanocomputer _raspberry Pi3 B+_, dotandolo per poter gestire apparecchiature e dispositivi a 433 Mhz _zigbee_. Ho scelto il programma gratuito domoticz per gestire il tutto.

**Il _raspberry Pi3 B+_ presenta i seguenti vantaggi:**

 1. il suo prezzo basso


 2. alimentazione del computer molto confortevole per la domotica.


 3. consumi ridotti.


 4. nessun ventilatore necessario.


 5. connettività fornita: porta ethernet, 4 porte USB, Wifi, Bluetooth, porte GPIO.




**L'interesse di 433 Mhz è:**

 1. è stato concesso in licenza in tutto il mondo per decenni.


 2. quindi c'è materiale molto economico.



 
I suoi svantaggi sono:

 1. non esiste un protocollo definito, ogni produttore fa quello che vuole.


 2. il protocollo utilizzato è raramente bidirezionale.




**L'interesse di zigbee è:**

 1. è stato progettato per rendere possibile la costruzione di moduli economici, in modo che i prezzi scendano gradualmente.


 1. utilizza un protocollo aperto, sicuro e bidirezionale.


 1. ogni modulo può essere utilizzato come relè per aumentare la distanza di rilevamento.


 1. utilizza una gamma di frequenze internazionale e permette di gestire un gran numero di moduli.


 1. è stato scelto da grandi marchi come _Philips_ (sistema _HUE_), Ikea (sistema _TRÅDFRI_), Legrand, Xiaomi e molti altri .... °)




# Passaggi:

* [akiru aparataron](_posts/2020-08-31-aparataro.md)


* [installa _raspbian_](_posts/2020-12-22-instali_raspbian.md)


* programmare il firmware della chiave USB _CC2531_ : [github.com](https://github.com/jmichault/flash_cc2531)
  


* costruire un'antenna per 433 Mhz.


* installa _domoticz_ : [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
  


* installa _zigbee_ : [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)


* installa _rf_gpio_ : [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
  


* Collega i tuoi primi elementi:  


  * collegare termometro _433Mhz_


  * collegare la spina _433Mhz_


  * collegare la lampadina _zigbee_



