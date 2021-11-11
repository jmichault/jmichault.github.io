---
komentoj_id: 4.
lang: de
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'installiere raspbian'
title: 'installiere _raspbian_ auf dem _Raspberry_'
---

Wir werden das System _raspbian_ auf die Micro-SD-Karte schreiben und dann einige grundlegende Systemeinstellungen vornehmen. 


# Die Micro-SD-Karte vorbereiten.

In diesem Beispiel habe ich die Micro-SD-Karte für meinen _raspberry pi 3_ Debian Linux-Computer und über die Befehlszeile vorbereitet.

Wenn dies nicht Ihren Wünschen entspricht, finden Sie im Internet leicht andere Methoden, beispielsweise im Internet <https://howtoraspberrypi.com/>.

 1. **Holen Sie sich die neueste Version von _raspbian_ von der offiziellen Website:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
Notieren Sie den Namen der aus der Zip-Datei extrahierten Datei.
    
 2. **identifiziere die vorhandenen Platten:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
Notieren Sie das Ergebnis des Befehls.
3. **Legen Sie die Karte in den Computer ein**
    
    identifiziere dann den Pfad der Karte:
    
    ```bash
    ls -lrt /dev/sd?
    ```
Dies ist normalerweise die letzte Zeile.  
    **WARNUNG** : Überprüfen Sie, ob dieses Gerät vorher nicht vorhanden war \(. Sehen Sie, was in Schritt 2\) **gezeigt wurde !!!**

 4. **schreibe ein Bild auf eine Karte**



    Führen Sie den folgenden Befehl aus und ersetzen Sie _vojo\_raspbian_ durch den in Schritt 1 angegebenen Namen und _vojo\_karto_ durch den in Schritt 3 angegebenen Namen.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (Dauer: ~40 Minuten)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


# erster Start von _raspberry_
Schließen Sie Tastatur, Maus und Display an und legen Sie die Micro-SD-Karte in _raspberry_ein.  
Schließen Sie die Stromversorgung an _raspberry_an.

Das _raspberry_ wird gestartet und das Konfigurationsdienstprogramm wird gestartet. Lassen Sie sich von der Einrichtung des Landes, des Passworts und des WLAN-Netzwerks leiten.

Ich rate Ihnen, Ihrem _raspberry_eine feste IP-Adresse zu geben. Sie können dies entweder auf Ihrem DHCP-Server (falls vorhanden) oder in der Konfiguration von _raspberry_tun.  
Um dies auf der Ebene von _raspberry_zu tun, ändern Sie einfach die Datei _/etc/dhcpcp.conf_, zum Beispiel mit _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

Dann müssen Sie die Schnittstellenkonfiguration ändern oder hinzufügen, die Sie interessiert (eth0 für das kabelgebundene Netzwerk, wlan0 für das WLAN-Netzwerk). So weisen Sie beispielsweise einem Netzwerk mit dem Router 192.168.0.1 die IP-Adresse 192.168.0.101 zu:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
Sie können auch die DNS-Nameserver ()angeben. 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
Wenn Sie remote auf die Befehlszeile zugreifen möchten, aktivieren Sie ssh:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Installieren Sie ntp:, um _raspberry_ pünktlich zu halten.

```bash
sudo apt install ntp
```

Wenn Sie es nicht brauchen, Entfernung von:
PURGE APT Wolfram-Motor Wolframscript libreOffice*
apt rein
