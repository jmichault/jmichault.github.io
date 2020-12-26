---
lang: eo
lang-niv: homa
lang-ref: instali_raspbian
layout: post
slug: 'instali raspbian'
title: 'instalu _raspbian_ sur la _Raspberry_'
---

Ni skribos la sistemon _raspbian_ al la mikro-SDa karto, tiam ni faros iujn bazajn sistemajn agordojn. 


# prepari la mikro-SD-karton.

En ĉi tiu ekzemplo, mi elektis prepari la mikro-SD-karton por mia _raspberry pi 3_ de Debian Linux-komputilo, kaj de la komandlinio.

Se ĉi tio ne respondas al viaj deziroj, vi facile trovos aliajn metodojn en la interreto, ekzemple en la retejo <https://howtoraspberrypi.com/>.

 1. **akiru la plej novan version de _raspbian_ de la oficiala retejo:**


    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
Notu la nomon de la dosiero ĉerpita de la zip-dosiero.
    
 2. **identigu la ĉeestantajn diskojn:**

    
    ```bash
    ls -lrt /dev/sd?
    ```
Notu la rezulton de la komando.
3. **enmetu la karton en la komputilon**
    
    tiam identigu la vojon de la karto:
    
    ```bash
    ls -lrt /dev/sd?
    ```
ĉi tio estas kutime la lasta linio.  
    **AVERTO** : kontrolu, ke ĉi tiu aparato ne ĉeestis antaŭe \(vidu, kio montriĝis en paŝo 2\) **!!!**

 4. **skribu bildon al karto**


    Rulu la suban komandon, anstataŭigante _vojo\_raspbian_ per la nomo notita en paŝo 1, kaj _vojo\_karto_ kun la nomo notita en paŝo 3.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (daŭro: ~40 minutoj)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


# unua komenco de _raspberry_
Konekti klavaron, muson kaj ekranon, enmeti mikro-SD-karton en _raspberry_.  
Konekti la potencon al la _raspberry_.

La _raspberry_ ekfunkciigas, kaj la agorda utileco startas. Lasu vin gvidi por agordi la landon, la pasvorton, la vifian reton.

Mi konsilas al vi doni fiksan IP-adreson al via _raspberry_. Vi povas fari tion aŭ ĉe via DHCP-servilo, se vi havas, aŭ en la agordo de _raspberry_.  
Por fari ĝin je la nivelo de _raspberry_, simple modifu la dosieron _/etc/dhcpcp.conf_, ekzemple per _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

Poste vi devas modifi aŭ aldoni la agordon de la interfaco, kiu interesas vin (eth0 por la kabligita reto, wlan0 por la vifia-reto). Ekzemple, por atribui la IP-adreson 192.168.0.101 al reto kies enkursigilo estas 192.168.0.1:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
Vi ankaŭ povas specifi la nomajn servilojn (DNS). 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
se vi volas aliri la komandlinion malproksime, aktivigu ssh:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Por teni la _raspberry_ ĝustatempe, instalu ntp:

```bash
sudo apt install ntp
```

