---
komentoj_id: 1.
lang: ms
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 'Untuk mula'
---

# Pengenalan
Sebagai contoh permulaan, anda boleh membuat sistem domain rumah dengan komputer nano   _raspberry Pi3 B+_, melengkapkannya untuk menguruskan 433 MHz peralatan dan peralatan   _zigbee_. Saya telah memilih program percuma Hosticz untuk mengendalikan set.  

**    _raspberry Pi3 B+_   mempunyai faedah:  **  

 1. Harga yang rendah  


 2. Kuasa komputer yang sangat selesa untuk automasi rumah.  


 3. Mengurangkan penggunaan.  


 4. Tidak perlu peminat.  


 5. Hubungan yang disediakan: Pelabuhan Ethernet, 4 port USB, WiFi, Bluetooth, pelabuhan GPI.  




**  Kepentingan 433 MHz adalah:  **  

 1. Kami telah membenarkan kami di seluruh dunia selama beberapa dekad.  


 2. Akibatnya, terdapat bahan yang sangat murah.  



 
Kelemahannya adalah:  

 1. Tidak ada protokol yang ditakrifkan, setiap pengeluar melakukan apa yang dia mahu.  


 2. Protokol yang digunakan jarang bidirect.  




**  Kepentingan Zigbee ialah:  **  

 1. Ia direka untuk membolehkan pembinaan modul murah, akibatnya harga secara beransur-ansur jatuh.  


 1. Ia menggunakan protokol terbuka, selamat dan bidirectional.  


 1. Setiap modul boleh berfungsi sebagai relay untuk meningkatkan skop.  


 1. Ia menggunakan pelbagai frekuensi antarabangsa dan menguruskan sejumlah besar modul.  


 1. Ia dipilih oleh jenama penting seperti   _Philips_   (    _HUE_  ), IKEA   (  Sistem   _TRÅDFRI_  ), Legrand, Xiaomi, dan banyak lagi ...  




# Langkah-langkah:

* [  Dapatkan bahan  ](_posts/2020-08-31-aparataro.md)  


* [  Pasang   _raspbian_  ](_posts/2020-12-22-instali_raspbian.md)  


*  Program   _CC2531_    Key USB dengan Penyelaras ZigBee:   [    _flash\_cc2531_  ](https://jmichault.github.io/flash_cc2531-dok/)  

* Bina antena untuk 433 MHz.  


* Pasang   _domoticz_    [   _domoticz.com_  ](https://www.domoticz.com/wiki/Raspberry_Pi)  


* Pasang   _zigbee_    [   _zigbee2mqtt.io_  ](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)  


* Pasang   _rf\_gpio_    [   _github.com_  ](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)  


* Sambungkan item pertama anda:    


  * Sambungkan termometer   _433Mhz_  


  * Sambungkan soket   _433Mhz_   


  * Sambungkan mentol   _zigbee_  



