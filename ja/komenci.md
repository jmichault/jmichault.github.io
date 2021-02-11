---
lang: ja
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: デビューする
---

# 前書き
デビューの例として、ナノコンピューター _raspberry Pi3 B+_を備えたホームオートメーションシステムを作成し、433 Mhzの機器とデバイス _zigbee_を管理できるように装備することができます。私はすべてを管理するために無料のプログラムdomoticzを選びました。

** _raspberry Pi3 B+_ には次の利点があります：**

 1. その低価格


 2. ホームオートメーションのための非常に快適なコンピュータパワー。


 3. 消費量の削減。


 4. ファンは必要ありません。


 5. 提供される接続：イーサネットポート、4つのUSBポート、Wifi、Bluetooth、GPIOポート。




**433 Mhzの関心は次のとおりです：**

 1. それは何十年もの間世界中で認可されてきました。


 2. したがって、非常に安価な材料があります。



 
その欠点は次のとおりです。

 1. 定義されたプロトコルはありません、各メーカーは彼が望むことをします。


 2. 使用されるプロトコルが双方向になることはめったにありません。




**zigbeeの関心は次のとおりです：**

 1. 安価なモジュールを構築できるように設計されているため、価格は徐々に下がります。


 1. オープンで安全な双方向プロトコルを使用します。


 1. 各モジュールは、検出距離を伸ばすためのリレーとして使用できます。


 1. 国際的な周波数範囲を使用し、多数のモジュールの管理を可能にします。


 1.  _Philips_ (システム _HUE_)、Ikea (システム _TRÅDFRI_)、Legrand、Xiaomi、その他多くの主要ブランドによって選出されています...。 °）




# 手順：

* [アキルアパラタロン](_posts/2020-08-31-aparataro.md)


* [インストール _raspbian_](_posts/2020-12-22-instali_raspbian.md)


* ジグビーコーディネーターでUSBキー _CC2531_  をプログラムします： [  _flash_cc2531_](https://jmichault.github.io/flash_cc2531-dok/)の位置


* 433Mhzの​​アンテナを構築します。


* インストール _domoticz_ ：( zzz3）domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
  


* インストール _zigbee_ ：( zzz3）zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)


* インストール _rf_gpio_ ：( zzz4）github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
  


* 最初のアイテムを接続します：  


  * 温度計を接続する _433Mhz_


  * プラグを接続します _433Mhz_


  * バルブを接続する _zigbee_



