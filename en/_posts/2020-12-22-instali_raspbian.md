---
lang: en
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'install raspbian'
title: 'install _raspbian_ on the _Raspberry_'
---

We will write the system _raspbian_ to the micro-SD card, then we will do some basic system settings. 


# prepare the micro-SD card.

In this example, I chose to prepare the micro-SD card for my _raspberry pi 3_ Debian Linux computer, and from the command line.

If this does not meet your wishes, you will easily find other methods on the internet, for example on the web <https://howtoraspberrypi.com/>.

 1. **get the latest version of _raspbian_ from the official website:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
Note the name of the file extracted from the zip file.
    
 2. **identify the present disks:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
Note the result of the command.
3. **insert the card into the computer**
    
    then identify the path of the card:
    
    ```bash
    ls -lrt /dev/sd?
    ```
this is usually the last line.  
    **WARNING** : check that this device was not present before \(see what was shown in step 2\) **!!!**

 4. **write an image to a card**



    Run the command below, replacing _vojo\_raspbian_ with the name noted in step 1, and _vojo\_karto_ with the name noted in step 3.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (duration: ~40 minutes)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


# first start of _raspberry_
Connect keyboard, mouse and display, insert micro SD card in _raspberry_.  
Connect the power to the _raspberry_.

The _raspberry_ starts up, and the configuration utility starts. Let yourself be guided to set up the country, the password, the wifi network.

I advise you to give a fixed IP address to your _raspberry_. You can do this either on your DHCP server, if you have one, or in the configuration of _raspberry_.  
To do this at the level of _raspberry_, simply modify the file _/etc/dhcpcp.conf_, for example with _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

Then you need to modify or add the interface configuration that interests you (eth0 for the wired network, wlan0 for the wifia network). For example, to assign the IP address 192.168.0.101 to a network whose router is 192.168.0.1:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
You can also specify the name servers (DNS). 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
if you want to access the command line remotely, enable ssh:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

To keep the _raspberry_ on time, install ntp:

```bash
sudo apt install ntp
```

If you do not need it, removal of:
Purge Apt Wolfram-Motor Wolframscript LibreOffice*
Apt pure All
