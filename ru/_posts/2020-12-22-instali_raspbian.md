---
komentoj_id: 4.
lang: ru
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'установить raspbian'
title: 'установить _raspbian_ на _Raspberry_'
---

Мы запишем систему _raspbian_ на карту micro-SD, а затем произведем некоторые базовые настройки системы. 


# Чтобы подготовить карту Micro-SD.

В этом примере я решил подготовить карту micro-SD для моего компьютера Debian Linux _raspberry pi 3_ и из командной строки.

Если это не соответствует вашим пожеланиям, вы легко найдете другие методы в Интернете, например, в Интернете <https://howtoraspberrypi.com/>.

 1. **загрузите последнюю версию _raspbian_ с официального сайта:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
Обратите внимание на имя файла, извлеченного из zip-файла.
    
 2. **определить существующие диски:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
Обратите внимание на результат выполнения команды.
3. **вставьте карту в компьютер**
    
    затем определите путь карты:
    
    ```bash
    ls -lrt /dev/sd?
    ```
обычно это последняя строка.  
    **ВНИМАНИЕ** : убедитесь, что этого устройства не было раньше \(, посмотрите, что было показано на шаге 2\) **!!!**

 4. **записать изображение на карту**



    Выполните команду ниже, заменив _vojo\_raspbian_ именем, указанным на шаге 1, и _vojo\_karto_ именем, указанным на шаге 3.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (продолжительность: ~40 минут)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


# первое начало _raspberry_
Подключите клавиатуру, мышь и дисплей, вставьте карту micro-SD в _raspberry_.  
Подключите питание к _raspberry_.

 _raspberry_ запускается, и запускается утилита настройки. Позвольте себе настроить страну, пароль и сеть Wi-Fi.

Советую давать фиксированный IP-адрес своему _raspberry_. Вы можете сделать это либо на своем DHCP-сервере, если он у вас есть, либо в конфигурации _raspberry_.  
Чтобы сделать это на уровне _raspberry_, просто измените файл _/etc/dhcpcp.conf_, например, с помощью _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

Затем вам нужно изменить или добавить интересующую вас конфигурацию интерфейса (eth0 для проводной сети, wlan0 для сети wifia). Например, чтобы назначить IP-адрес 192.168.0.101 сети с маршрутизатором 192.168.0.1:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
Вы также можете указать серверы имен (DNS). 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
если вы хотите получить доступ к командной строке удаленно, включите ssh:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Чтобы _raspberry_ оставался вовремя, установите ntp:

```bash
sudo apt install ntp
```

Если вам это не нужно, удаление: 
 Purge APT Wolfram Motor Wolframscript LibreOffice * 
 APT Autémove 
 APT Pure All All 
