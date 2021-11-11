---
komentoj_id: 2.
lang: de
lang-niv: auto
lang-ref: aparataro
layout: post
slug: Ausrüstung
title: 'Material zu Beginn.'
---
   
# Materialien für das Hausautomationssystem

Hier ist das Material, aus dem ich mein Hausautomationssystem gebaut habe, mit dem 433-MHz-Geräte und ZigBee-Geräte gesteuert werden können.

| Typ | Bild | markieren | Modell | Richtpreis | Warum |
| --- | --- | --- | --- | --- | --- | 
| Computer |![](/public/pi.jpg) | _raspberry_ | pi3b + | 35 € | Kein Lüfter, billig, hat GPIO, WLAN, LAN RJ45 |
| Computergehäuse |![](/public/loĝejo.jpg) | _Aukru_ | | 7 € | Jedes Computergehäuse für _raspberry-pi3_ ist geeignet. Wählen Sie die, die Sie bevorzugen.
| Stromquelle |![](/public/elektroprovizo.jpg) | _Konky_ | | 10 € | Als sich herausstellte, dass mein Spezial " _raspberry-pi3_"zu schwach war, habe ich es erfolgreich durch dieses ersetzt. Viele andere Modelle sind geeignet.
| USB-Kabel | | | USB zu Micro USB | 2 € | um die _raspberry-pi3_ an die Stromversorgung anzuschließen |
| Micro SD Karte |![](/public/SD.jpg) | _sandisk_ | SDSQUAR-032G-GN6MA | 11 € | Der Pi benötigt eine Qualitätskarte. Es wird dringend empfohlen, eine Karte einer bekannten Marke zu verwenden. |
| Duplexkabel |![](/public/dupont.jpg) | _SODIAL_ | Duplexkabel weiblich-weiblich. 068187 | 2 € | zum Anschließen von 433-MHz-Geräten und eines Flash-ZigBee-USB-Sticks |
| Sender + Empfänger |![](/public/dissendilo-ricevilo-433Mhz.jpg) | | wl101-341 + wl102-341 | 2 € | 433 MHz Überlagerungssender + Empfänger |
| Kabel | | || 0 € | ein Stück Kabel, um eine Antenne zu erstellen. Zum Beispiel ein altes 3 Meter langes Netzwerkkabel.
| Abschirmung | | | Ein Blatt Aluminiumfolie, das in ein in zwei Hälften gefaltetes Blatt Papier eingelegt ist 0 € | zum Schutz des 433-MHz-Empfängers vor Störungen durch _raspberry-pi3_. |
| USB-Stick _Zigbee_ und Kabel |![](/public/cc2531+kablo.jpg) | | CC2531 | 6 € | Taste _zigbee_ und Kabel für CC | herunterladen
| | | | **Gesamtpreis** | **75 €** | 



# Die Steuergeräte.

Viele Geräte können gesteuert werden. Erstens scheinen mir diese drei Elemente besonders interessant zu sein:

| Typ | Technologie | Bild | markieren | Modell | Richtpreis | Warum |
| --- | --- | --- | --- | --- | --- | --- |
| Thermometer | 433 MHz | ![](/public/fanju.jpeg)| _Fanju_ | de fj3378 | 7,50 € | Thermometer mit Bildschirm zu einem vernünftigen Preis. |
| Steckdosen | 433 MHz |![](/public/KYG.jpg)| _KYG_ | 4315 | 33 € | 5 ferngesteuerte Steckdosen zu einem vernünftigen Preis. |
| Glühbirne | _zigbee_ |![](/public/tradfri.jpg)| _Ikea_ | _TRÅDFRI_ LED E27 806 Lumen | 10 € | verstellbare Glühbirne zu einem vernünftigen Preis. |
| | | | | **Gesamtpreis** | **50,5 €** | |

