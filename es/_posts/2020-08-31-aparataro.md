---
komentoj_id: 2
lang: es
lang-niv: auto
lang-ref: aparataro
layout: post
slug: Equipo
title: 'Material para empezar.'
---
   
# Materiales para el sistema domótico

Aquí está el material que utilicé para construir mi sistema de domótica, que permite controlar equipos de 433 Mhz y equipos zigbee.

| tipo | imagen | marca | modelo | precio indicativo | ¿Por qué?
| --- | --- | --- | --- | --- | --- | 
| computadora |![](/public/pi.jpg) | _raspberry_ | pi3b + | 35 € | sin ventilador, barato, tiene gpio, wifi, LAN RJ45 |
| caja de la computadora |![](/public/loĝejo.jpg) | _Aukru_ | | 7 € | cualquier carcasa de ordenador para _raspberry-pi3_ es adecuada. Elige el que prefieras.
| fuente actual |![](/public/elektroprovizo.jpg) | _Konky_ | | 10 € | Cuando mi especial " _raspberry-pi3_"resultó ser demasiado débil, lo reemplacé con éxito con este. Muchos otros modelos son adecuados.
| Cable USB | | | USB a micro USB | 2 € | conectar el _raspberry-pi3_ a la fuente de alimentación |
| Tarjeta micro SD |![](/public/SD.jpg) | _sandisk_ | SDSQUAR-032G-GN6MA | 11 € | pi necesita una tarjeta de calidad, se recomienda encarecidamente utilizar una tarjeta de una marca conocida. |
| Cables dúplex |![](/public/dupont.jpg) | _SODIAL_ | Cables duplex hembra-hembra. 068187 | 2 € | conectar dispositivos de 433 Mhz y flash zigbee USB key |
| transmisor + receptor |![](/public/dissendilo-ricevilo-433Mhz.jpg) | | wl101-341 + wl102-341 | 2 € | Transmisor + receptor superheterodino 433 mhz |
| cable | | || 0 € | un trozo de cable para crear una antena. Por ejemplo, un viejo cable de red de 3 metros.
| blindaje | | | Una hoja de papel de aluminio insertada en una hoja de papel doblada por la mitad | 0 € | para proteger el receptor de 433 Mhz de las interferencias generadas por el _raspberry-pi3_. |
| Memoria USB _Zigbee_ y cable |![](/public/cc2531+kablo.jpg) | | CC2531 | 6 € | clave _zigbee_ y cable de descarga para CC |
| | | | **precio total** | **75 €** | 



# Los dispositivos de control.

Se pueden controlar muchos dispositivos. Primero, estos tres elementos me parecen particularmente interesantes:

| tipo | tecnologia | imagen | marca | modelo | precio indicativo | ¿Por qué?
| --- | --- | --- | --- | --- | --- | --- |
| termómetro | 433 Mhz | ![](/public/fanju.jpeg)| _Fanju_ | de fj3378 | 7,50 € | termómetro con pantalla a un precio razonable. |
| enchufes eléctricos | 433 Mhz |![](/public/KYG.jpg)| _KYG_ | 4315 | 33 € | 5 enchufes con mando a distancia a un precio razonable. |
| bombilla | _zigbee_ |![](/public/tradfri.jpg)| _Ikea_ | _TRÅDFRI_ LED E27 806 lúmenes | 10 € | bombilla de luz ajustable a un precio razonable. |
| | | | | **precio total** | **50,5 €** | |

