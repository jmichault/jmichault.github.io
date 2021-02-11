---
lang: ms
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 'Untuk memulakan debutnya'
---

# pengenalan
Sebagai contoh debut, anda dapat membuat sistem automasi rumah dengan nanocomputer _raspberry Pi3 B+_, melengkapkannya untuk dapat menguruskan peralatan dan peranti 433 Mhz _zigbee_. Saya memilih domoticz program percuma untuk menguruskan semuanya.

**The _raspberry Pi3 B+_ mempunyai kelebihan berikut:**

 1. harganya rendah


 2. kuasa komputer yang sangat selesa untuk automasi rumah.


 3. pengurangan penggunaan.


 4. tidak perlu kipas.


 5. penyambungan yang disediakan: port ethernet, 4 port USB, Wifi, Bluetooth, port GPIO.




**Minat 433 Mhz adalah:**

 1. ia telah dilesenkan di seluruh dunia selama beberapa dekad.


 2. oleh itu terdapat bahan yang sangat murah.



 
Kelemahannya adalah:

 1. tidak ada protokol yang ditentukan, setiap pengeluar melakukan apa yang dia mahukan.


 2. protokol yang digunakan jarang dua arah.




**Minat zigbee adalah:**

 1. dirancang untuk memungkinkan untuk membina modul yang murah, sehingga harga turun secara beransur-ansur.


 1. ia menggunakan protokol terbuka, selamat dan dua hala.


 1. setiap modul boleh digunakan sebagai geganti untuk meningkatkan jarak penginderaan.


 1. ia menggunakan julat frekuensi antarabangsa dan memungkinkan untuk menguruskan sebilangan besar modul.


 1. ia telah dipilih oleh jenama utama seperti sistem _Philips_ ( _HUE_), sistem Ikea ( _TRÅDFRI_), Legrand, Xiaomi, dan banyak lagi yang lain .... °)




# Langkah-langkah:

* [akiru aparataron](_posts/2020-08-31-aparataro.md)


* [pasang _raspbian_](_posts/2020-12-22-instali_raspbian.md)


* atur kunci USB _CC2531_  dengan koordinator zigbee: [ lokasi _flash_cc2531_](https://jmichault.github.io/flash_cc2531-dok/)


* bina antena untuk 433 Mhz.


* pasang _domoticz_ : [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
  


* pasang _zigbee_ : [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)


* pasang _rf_gpio_ : [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
  


* Sambungkan item pertama anda:  


  * sambungkan termometer _433Mhz_


  * sambungkan palam _433Mhz_


  * sambungkan mentol _zigbee_



