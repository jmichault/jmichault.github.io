---
lang: es
lang-niv: auto
lang-ref: komenci
layout: page
title: Debutar
---

# Introducción
Como ejemplo de debut, se puede crear un sistema domótico con un nanoordenador _raspberry Pi3 B+_, equipándolo para poder gestionar equipos y dispositivos de 433 Mhz _zigbee_. Elegí el programa gratuito domoticz para gestionarlo todo.

**El _raspberry Pi3 B+_ tiene las siguientes ventajas:**

 1. su bajo precio

 2. Computadora eléctrica muy cómoda para domótica.

 3. consumo reducido.

 4. no se necesita ventilador.

 5. conectividad proporcionada: puerto ethernet, 4 puertos USB, Wifi, Bluetooth, puertos GPIO.



**El interés de 433 Mhz es:**

 1. tiene licencia en todo el mundo durante décadas.

 2. por eso hay material muy barato.


 
Sus desventajas son:

 1. no hay un protocolo definido, cada fabricante hace lo que quiere.

 2. el protocolo utilizado rara vez es bidireccional.



**El interés de zigbee es:**

 1. fue diseñado para permitir la construcción de módulos baratos, por lo que los precios están cayendo gradualmente.

 1. utiliza un protocolo abierto, seguro y bidireccional.

 1. cada módulo se puede utilizar como relé para aumentar la distancia de detección.

 1. utiliza un rango de frecuencia internacional y permite gestionar un gran número de módulos.

 1. ha sido elegido por grandes marcas como _Philips_ (system _HUE_), Ikea (system _TRÅDFRI_), Legrand, Xiaomi, y muchas otras ...



# Pasos:

* [akiru aparataron](_posts/2020-08-31-aparataro.md)

* [instalar _raspbian_](_posts/2020-12-22-instali_raspbian.md)

* programa el firmware de la llave USB _CC2531_ : [github.com](https://github.com/jmichault/flash_cc2531)
  

* construye una antena para 433 Mhz.

* instalar _domoticz_ : [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
  

* instalar _zigbee_ : [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)

* instalar _rf_gpio_ : [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
  

* ban _sudo_ sin contraseña

* instalar la reserva: [borgbackup.readthedocs.io](https://borgbackup.readthedocs.io/en/stable/installation.html)

* Conecte sus primeros elementos:  

  * conectar termómetro

  * conectar el enchufe

  * conectar bombilla


