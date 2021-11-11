---
komentoj_id: 4.
lang: it
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'installa raspbian'
title: 'installa _raspbian_ su _Raspberry_'
---

Scriveremo il sistema _raspbian_ sulla scheda micro-SD, quindi faremo alcune impostazioni di base del sistema. 


# Per preparare la scheda micro-SD.

In questo esempio, ho scelto di preparare la scheda micro-SD per il mio computer Debian Linux _raspberry pi 3_ e dalla riga di comando.

Se questo non soddisfa i tuoi desideri, troverai facilmente altri metodi su Internet, ad esempio sul web <https://howtoraspberrypi.com/>.

 1. **scarica l'ultima versione di _raspbian_ dal sito ufficiale:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
Annotare il nome del file estratto dal file zip.
    
 2. **identifica i dischi presenti:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
Annotare il risultato del comando.
3. **inserire la scheda nel computer**
    
    quindi identifica il percorso della carta:
    
    ```bash
    ls -lrt /dev/sd?
    ```
questa è solitamente l'ultima riga.  
    **ATTENZIONE** : controlla che questo dispositivo non fosse presente prima \(vedi cosa è stato mostrato al punto 2\) **!!!**

 4. **scrive un'immagine su una scheda**



    Eseguire il comando seguente, sostituendo _vojo\_raspbian_ con il nome annotato al passaggio 1 e _vojo\_karto_ con il nome annotato al passaggio 3.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (durata: ~40 minuti)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


# primo avvio di _raspberry_
Collega tastiera, mouse e display, inserisci la scheda micro-SD in _raspberry_.  
Collegare l'alimentazione a _raspberry_.

 _raspberry_ si avvia e si avvia l'utilità di configurazione. Lasciati guidare nella configurazione del paese, della password, della rete wifi.

Ti consiglio di dare un indirizzo IP fisso al tuo _raspberry_. Puoi farlo sul tuo server DHCP, se ne hai uno, o nella configurazione di _raspberry_.  
Per farlo a livello di _raspberry_, è sufficiente modificare il file _/etc/dhcpcp.conf_, ad esempio con _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

Quindi è necessario modificare o aggiungere la configurazione dell'interfaccia che ti interessa (eth0 per la rete cablata, wlan0 per la rete wifia). Ad esempio, per assegnare l'indirizzo IP 192.168.0.101 a una rete il cui router è 192.168.0.1:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
È inoltre possibile specificare i server dei nomi (DNS). 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
se vuoi accedere alla riga di comando da remoto, abilita ssh:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Per mantenere _raspberry_ puntuale, installa ntp:

```bash
sudo apt install ntp
```

Se non ne hai bisogno, rimozione di:
Purga Apt Wolfram-Motor WolframScript LibreOffice*
APT PURE ALL
