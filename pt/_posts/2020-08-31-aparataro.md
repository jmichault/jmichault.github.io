---
lang: pt
lang-ref: aparataro
layout: post
slug: Hardware
title: 'Hardware para começar.'
---
   
# Os materiais para o sistema de automação residencial

Aqui está o material que usei para construir meu sistema de automação residencial, permitindo controlar equipamentos de 433 Mhz e equipamentos zigbee.

|tipo|cenário|marca|modelo|preço indicado|porque|
| --- | --- | --- | --- | --- | --- | 
|computador|![](/public/pi.jpg) | _raspberry_ |pi3b +| 35€ |sem ventilador, barato, tem gpio, wi-fi, LAN RJ45|
||![](/public/loĝejo.jpg) | _Aukru_ | | 7€ |qualquer caso de computador para _raspberry-pi3_ apropriado. Escolha o que você preferir.|
|fonte de energia|![](/public/elektroprovizo.jpg) | _Konky_ | | 10€ |Quando meu" _raspberry-pi3_ especial"a corrente revelou-se muito fraca, substituí-a com sucesso por esta. Muitos outros modelos são adequados.|
|cabo USB|  |  |USB para micro USB| 2€ |para conectar o _raspberry-pi3_ para a fonte de alimentação|
|cartão micro SD|![](/public/SD.jpg) | _sandisk_ | SDSQUAR-032G-GN6MA | 11€ |o pi precisa de um cartão de qualidade, é altamente recomendável usar um cartão de uma marca bem conhecida.|
|Cabos duplex|![](/public/dupont.jpg) | _SODIAL_ |Cabos Duplex fêmea-fêmea. 068187| 2€|para conectar dispositivos de 433 Mhz e instalar um stick USB Zigbee|
|transmissor + receptor|![](/public/dissendilo-ricevilo-433Mhz.jpg) | |wl101-341 + wl102-341| 2€ |Transmissor + receptor super-heteródino 433mhz|
|cabo| | || 0€ |um pedaço de cabo para fazer uma antena. Por exemplo, um antigo cabo de rede de 3 metros.|
|blindagem| | |Folha de alumínio inserida em uma folha de papel dobrada pela metade| 0€ |para proteger o receptor de 433 Mhz da interferência gerada pelo _raspberry-pi3_.|
|  _Zigbee_ Stick e cabo USB|![](/public/cc2531+kablo.jpg) |  | CC2531|6€ | _zigbee_ stick e download de cabo para CC|
| | | | **preço total** | **75€** | 



# Os materiais a serem testados.

Muitos dispositivos podem ser controlados. Para começar, esses três parecem particularmente interessantes para mim:

|tipo|tecnologia|cenário|marca|modelo|preço indicado|porque|
| --- | --- | --- | --- | --- | --- | --- |
| termometro |433Mhz| ![](/public/fanju.jpeg)| _Fanju_ |por fj3378| 7.50€||
| ingoj |433Mhz|![](/public/KYG.jpg)| _KYG_ | 4315 | 33€ |5 tomadas de controle remoto a um preço razoável.|
|lâmpada| _zigbee_ |![](/public/tradfri.jpg)| _Ikea_ | _TRÅDFRI_LED E27 806 lumens| 10€ |lâmpada ajustável a um preço razoável.|
| | | | | **preço total** | **50,5€** | |

