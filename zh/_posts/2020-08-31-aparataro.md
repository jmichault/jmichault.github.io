---
komentoj_id: 2
lang: zh
lang-niv: auto
lang-ref: aparataro
layout: post
slug: 设备
title: 开始的材料。
---
   
# 家庭自动化系统的材料

这是我用来构建家庭自动化系统的材料，可以控制433 Mhz设备和Zigbee设备。

|类型图片标记|型号参考价|为什么
| --- | --- | --- | --- | --- | --- | 
|电脑|![](/public/pi.jpg) | _raspberry_ | pi3b + | 35€|没有风扇，便宜，有gpio，wifi，LAN RJ45 |
|电脑机箱|![](/public/loĝejo.jpg) | _Aukru_ | | 7€|适用于 _raspberry-pi3_ 的任何计算机机箱。选择您喜欢的一种。
|当前来源|![](/public/elektroprovizo.jpg) | _Konky_ | | 10€|当我的特殊 " _raspberry-pi3_"太弱时，我成功地用了它。许多其他型号也适用。
| USB电缆| | | USB转micro USB | 2€|将 _raspberry-pi3_ 连接到电源|
|微型SD卡|![](/public/SD.jpg) | _sandisk_ | SDSQUAR-032G-GN6MA | 11€| pi需要高质量的卡，强烈建议使用知名品牌的卡。 |
|双工电缆|![](/public/dupont.jpg) | _SODIAL_ |雌雄双工电缆。 068187 | 2€|连接433 Mhz设备和Flash Zigbee USB闪存|
|发射器+接收器|![](/public/dissendilo-ricevilo-433Mhz.jpg) | | wl101-341 + wl102-341 | 2€| 433MHz超外差发射机和接收机|
|电缆| | || 0€|用一根电缆制成天线。例如，一条旧的3米长的网络电缆。
|屏蔽| | |将铝箔插入一张对折的纸中| 0€|保护433 Mhz接收器免受 _raspberry-pi3_产生的干扰。 |
| USB记忆棒 _Zigbee_ 和电缆|![](/public/cc2531+kablo.jpg) | | CC2531 | 6€|键 _zigbee_ 和CC的下载电缆|
| | | | **总价** | **75€** | 



# 控制设备。

许多设备都可以控制。首先，这三个元素对我而言尤其有趣：

|类型技术|图片标记|型号参考价|为什么
| --- | --- | --- | --- | --- | --- | --- |
|温度计| 433 Mhz | ![](/public/fanju.jpeg)| _Fanju_ | de fj3378 | 7.50€|欧元带屏幕的温度计，价格合理。 |
|电源插座| 433 Mhz |![](/public/KYG.jpg)| _KYG_ | 4315 | 33€| 5个遥控插座，价格合理。 |
|灯泡| _zigbee_ |![](/public/tradfri.jpg)| _Ikea_ | _TRÅDFRI_ LED E27 806流明| 10€|价格合理的可调式灯泡。 |
| | | | | **总价格** | **50.5€** | |

