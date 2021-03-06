---
komentoj_id: 1.
lang: ar
lang-niv: auto
lang-ref: 000-komenci
layout: page
title: 'لاول مرة'
---

# المقدمة
كمثال على الظهور لأول مرة ، يمكنك إنشاء نظام أتمتة منزلي باستخدام كمبيوتر نانوي _raspberry Pi3 B+_، وتجهيزه ليكون قادرًا على إدارة معدات 433 ميجا هرتز ومعدات _zigbee_. اخترت برنامج domoticz المجاني لإدارة كل شيء.

** _raspberry Pi3 B+_ له المزايا التالية:**

 1. سعره المنخفض


 2. طاقة كمبيوتر مريحة للغاية لأتمتة المنزل.


 3. انخفاض الاستهلاك.


 4. لا حاجة لمروحة.


 5. الاتصال المقدم: منفذ إيثرنت ، 4 منافذ USB ، واي فاي ، بلوتوث ، منافذ GPIO.




**فائدة 433 ميجا هرتز هي:**

 1. تم ترخيصه في جميع أنحاء العالم منذ عقود.


 2. لذلك هناك مواد رخيصة جدا.



 
عيوبه:

 1. لا يوجد بروتوكول محدد ، كل مصنع يفعل ما يريد.


 2. نادرا ما يكون البروتوكول المستخدم ثنائي الاتجاه.




**مصلحة الزيجبي هي:**

 1. تم تصميمه لجعل من الممكن بناء وحدات رخيصة ، بحيث تنخفض الأسعار تدريجيًا.


 1. يستخدم بروتوكول مفتوح وآمن وثنائي الاتجاه.


 1. يمكن استخدام كل وحدة كمرحل لزيادة مسافة الاستشعار.


 1. يستخدم نطاق تردد دولي ويجعل من الممكن إدارة عدد كبير من الوحدات.


 1. تم اختياره من قبل العلامات التجارية الكبرى مثل _Philips_ (نظام _HUE_)، Ikea (نظام _TRÅDFRI_)، Legrand ، Xiaomi ، وغيرها الكثير .... °)




# خطوات:

* [أكيرو أباراتارون](_posts/2020-08-31-aparataro.md)


* [تثبيت _راسبيان_](_posts/2020-12-22-instali_raspbian.md)


* قم ببرمجة مفتاح USB _CC2531_  مع منسق zigbee: [ موقع _flash_cc2531_](https://jmichault.github.io/flash_cc2531-dok/)


* بناء هوائي 433 ميجا هرتز.


* تثبيت _domoticz_ : [domoticz.com](https://www.domoticz.com/wiki/Raspberry_Pi)
  


* تثبيت _zigbee_ : [zigbee2mqtt.io](https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html)


* تثبيت _rf_gpio_ : [github.com](https://github.com/jmichault/rf_gpio/blob/master/LeguMin.md)
  


* قم بتوصيل العناصر الأولى الخاصة بك:  


  * توصيل ميزان الحرارة _433Mhz_


  * توصيل المكونات _433Mhz_


  * لمبة توصيل _zigbee_



