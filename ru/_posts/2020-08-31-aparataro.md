---
komentoj_id: 2.
lang: ru
lang-niv: auto
lang-ref: aparataro
layout: post
slug: Оборудование
title: 'Материал для начала.'
---
   
# Материалы для системы домашней автоматизации

Вот материал, который я использовал для создания моей системы домашней автоматизации, позволяющей управлять оборудованием 433 МГц и оборудованием для зигби.

| тип | изображение | отметка | модель | ориентировочная цена | Почему |
| --- | --- | --- | --- | --- | --- | 
| компьютер |![](/public/pi.jpg) | _raspberry_ | pi3b + | 35 € | без вентилятора, дешево, есть gpio, wifi, LAN RJ45 |
| корпус компьютера |![](/public/loĝejo.jpg) | _Aukru_ | | 7 € | Подходит любой компьютерный корпус для _raspberry-pi3_ . Выберите тот, который вам больше нравится.
| текущий источник |![](/public/elektroprovizo.jpg) | _Konky_ | | 10 € | Когда мой специальный " _raspberry-pi3_"оказался слишком слабым, я успешно заменил его на этот. Подойдут многие другие модели.
| USB-кабель | | | USB на micro USB | 2 € | подключить _raspberry-pi3_ к источнику питания |
| Карта Micro SD |![](/public/SD.jpg) | _sandisk_ | SDSQUAR-032G-GN6MA | 11 € | Пи нужна качественная карта, настоятельно рекомендуется использовать карту известного бренда. |
| Дуплексные кабели |![](/public/dupont.jpg) | _SODIAL_ | Дуплексные кабели «мама-мама». 068187 | 2 € | подключить устройства 433 МГц и прошить USB-накопитель zigbee |
| передатчик + приемник |![](/public/dissendilo-ricevilo-433Mhz.jpg) | | wl101-341 + wl102-341 | 2 € | 433 МГц супергетеродинный передатчик + приемник |
| кабель | | || 0 € | кусок кабеля для создания антенны. Например, старый 3-х метровый сетевой кабель.
| экранирование | | | Лист алюминиевой фольги вставлен в сложенный пополам лист бумаги | 0 € | для защиты приемника 433 МГц от помех, создаваемых _raspberry-pi3_. |
| USB-накопитель _Zigbee_ и кабель |![](/public/cc2531+kablo.jpg) | | CC2531 | 6 € | ключ _zigbee_ и кабель загрузки для CC |
| | | | **общая цена** | **75 €** | 



# Устройства управления.

Можно управлять многими устройствами. Во-первых, эти три элемента кажутся мне особенно интересными:

| тип | технология | изображение | отметка | модель | ориентировочная цена | Почему |
| --- | --- | --- | --- | --- | --- | --- |
| термометр | 433 МГц | ![](/public/fanju.jpeg)| _Fanju_ | de fj3378 | 7.50 € | термометр с экраном по разумной цене. |
| электрические розетки | 433 МГц |![](/public/KYG.jpg)| _KYG_ | 4315 | 33 € | 5 розеток с дистанционным управлением по разумной цене. |
| лампочка | _zigbee_ |![](/public/tradfri.jpg)| _Ikea_ | _TRÅDFRI_ LED E27 806 люмен | 10 € | регулируемая лампочка по разумной цене. |
| | | | | **общая цена** | **50.5 €** | |

