---
komentoj_id: 1
lang: ja
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 始めること
---

# 前書き
スタート例として、433 MHz機器と機器  _zigbee_を管理するために、ナノコンピュータ  _raspberry Pi3 B+_を使用してホームドメインシステムを作ることができます。私はセットを処理するためにMartiaticz Marketballソフトウェアを選びました。  

**    _raspberry Pi3 B+_  は利点のために持っています： **  

 1. その低価格 


 2. ホームオートメーションのための非常に快適なコンピュータ電力。  


 3. 消費量の削減 


 4. ファンは必要ありません。  


 5. 接続可能性：イーサネットポート、4 USBポート、WiFi、Bluetooth、GPIポート。  




**  433 MHzの関心は次のとおりです。 **  

 1. 私達は私達が何十年もの間世界的に許可されています。  


 2. その結果、非常に安価な材料があります。  



 
彼の欠点は次のとおりです。 

 1. 定義されたプロトコルはありません、各製造業者は彼が望むものをします。  


 2. 使用されているプロトコルはめったにないことです。  




**  ZigBeeの関心は次のとおりです。 **  

 1. 結果として、安価なモジュールの構築を可能にするように設計されていました。  


 1. オープンで安全で双方向のプロトコルを使用します。  


 1. 各モジュールは、スコープを増やすための中継として機能することができます。  


 1. それはさまざまな国際周波数を使い、多数のモジュールを管理します。  


 1. それは  _Philips_   (    _HUE_  )、IKEA   (  System   _TRÅDFRI_ 、Legrand、Xiaomi、そしてもっと多くのものなどの重要なブランドによって選択されました...  




# 手順：

* [ 素材を入手する ](_posts/2020-08-31-aparataro.md)  


* [    _raspbian_  ](_posts/2020-12-22-instali_raspbian.md)  


*  ZigBee Coordinatorを搭載した  _CC2531_    USBキー：  [    _flash\_cc2531_  ](https://jmichault.github.io/flash_cc2531-dok/)  

* 433 MHz用のアンテナを構築します。  


*   _domoticz_    [   _domoticz.com_  ](https://www.domoticz.com/wiki/Raspberry_Pi)  


*   _zigbee_    [   _zigbee2mqtt.io_  ](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)  


*   _rf\_gpio_    [   _github.com_  ](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)  


* 最初の項目を接続してください：   


  * 温度計  _433Mhz_  を接続してください


  *   _433Mhz_  ソケットを接続します


  * 電球  _zigbee_  を接続します



