---
komentoj_id: 1.
lang: pt
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 'Para estrear'
---

# introdução
A título de exemplo de estreia, pode-se criar um sistema domótico com nanocomputador _raspberry Pi3 B+_, equipando-o para gerir equipamentos de 433 MHz e _zigbee_equipamentos. Escolhi o programa gratuito domoticz para gerenciar tudo.

**O _raspberry Pi3 B+_ tem as seguintes vantagens:**

 1. seu preço baixo


 2. poder de computador muito confortável para automação residencial.


 3. consumo reduzido.


 4. nenhum ventilador necessário.


 5. conectividade fornecida: porta Ethernet, 4 portas USB, Wifi, Bluetooth, portas GPIO.




**O interesse de 433 Mhz é:**

 1. ele foi autorizado em todo o mundo por décadas.


 2. portanto, há material muito barato.



 
Suas desvantagens são:

 1. não existe um protocolo definido, cada fabricante faz o que quer.


 2. o protocolo usado raramente é bidirecional.




**O interesse de zigbee é:**

 1. foi projetado para possibilitar a construção de módulos baratos, para que os preços caiam gradativamente.


 1. ele usa um protocolo aberto, seguro e bidirecional.


 1. cada módulo pode ser usado como um relé para aumentar a distância de detecção.


 1. ele usa uma faixa de frequência internacional e torna possível gerenciar um grande número de módulos.


 1. foi eleito por grandes marcas como _Philips_ (sistema _HUE_), sistema Ikea ( _TRÅDFRI_), Legrand, Xiaomi e muitos outros .... °)




# Passos:

* [akiru aparataron](_posts/2020-08-31-aparataro.md)


* [instalar _raspbian_](_posts/2020-12-22-instali_raspbian.md)


* programe a chave USB _CC2531_  com o coordenador zigbee: [ a localização de _flash_cc2531_](https://jmichault.github.io/flash_cc2531-dok/)


* construir uma antena para 433 Mhz.


* instalar _domoticz_ : [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
  


* instalar _zigbee_ : [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)


* instalar _rf_gpio_ : [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
  


* Conecte seus primeiros itens:  


  * conectar termômetro _433Mhz_


  * conecte o plugue _433Mhz_


  * conectar lâmpada _zigbee_



