---
komentoj_id: 1
lang: zh
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 首次亮相
---

# 介绍
作为首次亮相的示例，您可以创建一个带有纳米计算机 _raspberry Pi3 B+_的家庭自动化系统，使其能够管理433 Mhz设备和 _zigbee_设备。我选择了免费程序domoticz来管理所有内容。

** _raspberry Pi3 B+_ 具有以下优点：**

 1. 低价


 2. 用于家庭自动化的非常舒适的计算机功能。


 3. 减少消耗。


 4. 不需要风扇。


 5. 提供的连接性：以太网端口，4个USB端口，Wifi，蓝牙，GPIO端口。




**433 Mhz的利息是：**

 1. 它已在全球范围内获得许可数十年。


 2. 因此，有非常便宜的材料。



 
它的缺点是：

 1. 没有定义的协议，每个制造商都按照自己的意愿做。


 2. 使用的协议很少是双向的。




**zigbee的兴趣是：**

 1. 旨在使构建廉价模块成为可能，从而使价格逐渐下降。


 1. 它使用开放，安全和双向协议。


 1. 每个模块都可以用作继电器以增加感应距离。


 1. 它使用国际频率范围，因此可以管理大量模块。


 1. 它已被主要品牌（例如 _Philips_ (系统 _HUE_)，宜家 (系统 _TRÅDFRI_)，罗格朗（Legrand），小米




# 脚步：

* [akiru aparataron](_posts/2020-08-31-aparataro.md)


* [安装 _raspbian_](_posts/2020-12-22-instali_raspbian.md)


* 使用Zigbee协调器对USB密钥 _CC2531_  进行编程： [ cc2531 _flash__](https://jmichault.github.io/flash_cc2531-dok/)的位置


* 为433 Mhz制造天线。


* 安装 _domoticz_ ： [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
  


* 安装 _zigbee_ ： [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)


* 安装 _rf_gpio_ ： [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
  


* 连接您的第一个项目：  


  * 连接温度计 _433Mhz_


  * 连接插头 _433Mhz_


  * 连接灯泡 _zigbee_



