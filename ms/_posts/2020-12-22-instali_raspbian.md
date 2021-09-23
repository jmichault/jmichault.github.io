---
lang: ms
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'pasang raspbian'
title: 'pasang _raspbian_ pada _Raspberry_'
---

Kami akan menulis sistem _raspbian_ ke kad micro-SD, kemudian kami akan melakukan beberapa tetapan sistem asas. 


# Untuk menyediakan kad mikro-sd.

Dalam contoh ini, saya memilih untuk menyediakan kad mikro-SD untuk komputer saya _raspberry pi 3_ Debian Linux, dan dari baris arahan.

Sekiranya ini tidak memenuhi kehendak anda, anda akan dengan mudah mencari kaedah lain di internet, contohnya di web <https://howtoraspberrypi.com/>.

 1. **dapatkan versi terbaru dari _raspbian_ dari laman web rasmi:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
Perhatikan nama fail yang diekstrak dari fail zip.
    
 2. **kenal pasti cakera yang ada:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
Perhatikan hasil arahan.
3. **masukkan kad ke dalam komputer**
    
    kemudian kenal pasti jalur kad:
    
    ```bash
    ls -lrt /dev/sd?
    ```
biasanya ini adalah baris terakhir.  
    **PERINGATAN** : pastikan peranti ini tidak ada sebelumnya \(lihat apa yang ditunjukkan pada langkah 2\) **!!!**

 4. **tulis gambar ke kad**



    Jalankan perintah di bawah, ganti _vojo\_raspbian_ dengan nama yang dicatat pada langkah 1, dan _vojo\_karto_ dengan nama yang dicatat pada langkah 3.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (tempoh: ~40 minit)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


# permulaan pertama _raspberry_
Sambungkan papan kekunci, tetikus dan paparan, masukkan kad mikro-SD ke dalam _raspberry_.  
Sambungkan kuasa ke _raspberry_.

 _raspberry_ dimulakan, dan utiliti konfigurasi bermula. Biarkan diri anda dibimbing untuk mengatur negara, kata laluan, rangkaian wifi.

Saya menasihati anda untuk memberikan alamat IP tetap ke _raspberry_anda. Anda boleh melakukan ini sama ada di pelayan DHCP, jika ada, atau dalam konfigurasi _raspberry_.  
Untuk melakukan ini pada tahap _raspberry_, cukup ubah fail _/etc/dhcpcp.conf_, misalnya dengan _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

Kemudian anda perlu mengubah atau menambahkan konfigurasi antara muka yang menarik bagi anda (eth0 untuk rangkaian berwayar, wlan0 untuk rangkaian wifia). Sebagai contoh, untuk menetapkan alamat IP 192.168.0.101 ke rangkaian yang penghala 192.168.0.1:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
Anda juga boleh menentukan DNS pelayan nama (). 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
jika anda ingin mengakses baris perintah dari jauh, aktifkan ssh:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Untuk memastikan _raspberry_ tepat pada masanya, pasang ntp:

```bash
sudo apt install ntp
```

Jika anda tidak memerlukannya, Pembuangan:
4 ° 4 ° 4 ° 4 ° 4 ° 4 ° 4 ° 4) Apt Pure All
