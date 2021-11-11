---
komentoj_id: 2.
lang: pt
lang-niv: auto
lang-ref: aparataro
layout: post
slug: Equipamento
title: 'Material para começar.'
---
   
# Materiais para o sistema de automação residencial

Aqui está o material que usei para construir meu sistema de automação residencial, permitindo controlar equipamentos de 433 Mhz e equipamentos zigbee.

| tipo | imagem | marca | modelo | preço indicativo | Por que |
| --- | --- | --- | --- | --- | --- | 
| computador |![](/public/pi.jpg) | _raspberry_ | pi3b + | 35 € | sem ventilador, barato, tem gpio, wi-fi, LAN RJ45 |
| caixa do computador |![](/public/loĝejo.jpg) | _Aukru_ | | 7 € | qualquer caixa de computador para _raspberry-pi3_ é adequada. Escolha o que você preferir.
| fonte atual |![](/public/elektroprovizo.jpg) | _Konky_ | | 10 € | Quando meu especial " _raspberry-pi3_"acabou ficando muito fraco, substituí-o com sucesso por este. Muitos outros modelos são adequados.
| Cabo USB | | | USB para micro USB | 2 € | conectar o _raspberry-pi3_ à fonte de alimentação |
| Cartão Micro SD |![](/public/SD.jpg) | _sandisk_ | SDSQUAR-032G-GN6MA | 11 € | o pi precisa de um cartão de qualidade, é altamente recomendável usar um cartão de uma marca bem conhecida. |
| Cabos duplex |![](/public/dupont.jpg) | _SODIAL_ | Cabos Duplex fêmea-fêmea. 068187 | 2 € | conectar dispositivos de 433 MHz e uma chave USB flash zigbee |
| transmissor + receptor |![](/public/dissendilo-ricevilo-433Mhz.jpg) | | wl101-341 + wl102-341 | 2 € | Transmissor + receptor superheteródino 433 MHz |
| cabo | | || 0 € | um pedaço de cabo para criar uma antena. Por exemplo, um antigo cabo de rede de 3 metros.
| blindagem | | | Uma folha de papel alumínio inserida em uma folha de papel dobrada ao meio | 0 € | para proteger o receptor 433 Mhz da interferência gerada pelo _raspberry-pi3_. |
| Pen drive USB _Zigbee_ e cabo |![](/public/cc2531+kablo.jpg) | | CC2531 | 6 € | _zigbee_ e download do cabo para CC |
| | | | **Preço total** | **75 €** | 



# Os dispositivos de controle.

Muitos dispositivos podem ser controlados. Em primeiro lugar, esses três elementos me parecem particularmente interessantes:

| tipo | tecnologia | imagem | marca | modelo | preço indicativo | Por que |
| --- | --- | --- | --- | --- | --- | --- |
| termômetro | 433 MHz | ![](/public/fanju.jpeg)| _Fanju_ | de fj3378 | 7,50 € | termômetro com tela a um preço razoável. |
| tomadas elétricas | 433 MHz |![](/public/KYG.jpg)| _KYG_ | 4315 | 33 € | 5 tomadas de controle remoto a um preço razoável. |
| lâmpada | _zigbee_ |![](/public/tradfri.jpg)| _Ikea_ | _TRÅDFRI_ LED E27 806 lumens | 10 € | lâmpada ajustável a um preço razoável. |
| | | | | **Preço total** | **50,5 €** | |

