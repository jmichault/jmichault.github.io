---
komentoj_id: 1
lang: es
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 'Para comenzar'
---

# Introducción
Como ejemplo de inicio, puede hacer un sistema de dominio de casa con una computadora nano   _raspberry Pi3 B+_, equipándola para administrar equipo y equipo de 433 MHz   _zigbee_. He elegido el programa gratuito Hosticz para manejar el conjunto.  

**  El   _raspberry Pi3 B+_   tiene beneficios:  **  

 1. Su bajo precio  


 2. Muy cómodo poder de computadora para la automatización del hogar.  


 3. Consumo reducido.  


 4. No hay necesidad de un fan.  


 5. Conexión proporcionada: Puerto Ethernet, 4 puertos USB, WiFi, Bluetooth, puertos GPI.  




**  El interés de los 433 MHz es:  **  

 1. Nos hemos permitido a todo el mundo durante décadas.  


 2. Como resultado, hay material muy barato.  



 
Sus desventajas son:  

 1. No hay un protocolo definido, cada fabricante hace lo que quiere.  


 2. El protocolo utilizado rara vez es bidirecto.  




El interés de **  Zigbee es:  **  

 1. Fue diseñado para permitir la construcción de módulos baratos, como resultado, los precios caen gradualmente.  


 1. Utiliza un protocolo abierto, seguro y bidireccional.  


 1. Cada módulo puede servir como relé para aumentar el alcance.  


 1. Utiliza una gama de frecuencias internacionales y para administrar un gran número de módulos.  


 1. Fue elegido por marcas importantes como el sistema   _Philips_   ( , IKEA   (  Sistema   _TRÅDFRI_  ), Legrand, Xiaomi y muchos más ...  




# Pasos:

* [  Obtenga el material  ](_posts/2020-08-31-aparataro.md)  


* [  Instalar   _raspbian_  ](_posts/2020-12-22-instali_raspbian.md)  


*  Programe la tecla USB   _CC2531_    con el coordinador de Zigbee:   [    _flash\_cc2531_  ](https://jmichault.github.io/flash_cc2531-dok/)  

* Construir una antena para 433 MHz.  


* Instale   _domoticz_    [   _domoticz.com_  ](https://www.domoticz.com/wiki/Raspberry_Pi)  


* Instale   _zigbee_    [   _zigbee2mqtt.io_  ](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)  


* Instale   _rf\_gpio_    [   _github.com_  ](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)  


* Conecte sus primeros elementos:    


  * Conecte un termómetro   _433Mhz_  


  * Conecte un socket   _433Mhz_   


  * Conectar Bulb   _zigbee_  



