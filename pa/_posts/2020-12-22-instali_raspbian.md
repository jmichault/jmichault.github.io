---
lang: pa
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'ਰਸਬੇਨੀਅਨ ਸਥਾਪਿਤ ਕਰੋ'
title: ' _Raspberry_ਤੇ _raspbian_ ਸਥਾਪਤ ਕਰੋ'
---

ਅਸੀਂ ਮਾਈਕ੍ਰੋ- SD ਕਾਰਡ ਨੂੰ ਸਿਸਟਮ _raspbian_ ਲਿਖਾਂਗੇ, ਫਿਰ ਅਸੀਂ ਕੁਝ ਮੁ someਲੀਆਂ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਕਰਾਂਗੇ. 


# ਮਾਈਕਰੋ- SD ਕਾਰਡ ਤਿਆਰ ਕਰੋ.

ਇਸ ਉਦਾਹਰਣ ਵਿੱਚ, ਮੈਂ ਆਪਣੇ _raspberry pi 3_ ਡੇਬੀਅਨ ਲੀਨਕਸ ਕੰਪਿ computerਟਰ ਲਈ, ਅਤੇ ਕਮਾਂਡ ਲਾਈਨ ਤੋਂ ਮਾਈਕਰੋ-ਐਸਡੀ ਕਾਰਡ ਤਿਆਰ ਕਰਨਾ ਚੁਣਿਆ.

ਜੇ ਇਹ ਤੁਹਾਡੀਆਂ ਇੱਛਾਵਾਂ ਨੂੰ ਪੂਰਾ ਨਹੀਂ ਕਰਦਾ ਹੈ, ਤਾਂ ਤੁਸੀਂ ਇੰਟਰਨੈਟ 'ਤੇ ਆਸਾਨੀ ਨਾਲ ਹੋਰ findੰਗਾਂ ਨੂੰ ਲੱਭ ਸਕੋਗੇ, ਉਦਾਹਰਣ ਲਈ ਵੈੱਬ' ਤੇ <https://howtoraspberrypi.com/>.

 1. **ਆਧਿਕਾਰਿਕ ਵੈਬਸਾਈਟ ਤੋਂ _raspbian_ ਦਾ ਨਵੀਨਤਮ ਸੰਸਕਰਣ ਪ੍ਰਾਪਤ ਕਰੋ:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
ਜ਼ਿਪ ਫਾਈਲ ਤੋਂ ਕੱractedੀ ਗਈ ਫਾਈਲ ਦਾ ਨਾਮ ਨੋਟ ਕਰੋ.
    
 2. **ਮੌਜੂਦਾ ਡਿਸਕਾਂ ਦੀ ਪਛਾਣ ਕਰੋ:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
ਕਮਾਂਡ ਦੇ ਨਤੀਜੇ ਨੂੰ ਨੋਟ ਕਰੋ.
3. **ਕੰਪਿ theਟਰ ਵਿਚ ਕਾਰਡ ਪਾਓ**
    
    ਫਿਰ ਕਾਰਡ ਦੇ ਮਾਰਗ ਦੀ ਪਛਾਣ ਕਰੋ:
    
    ```bash
    ls -lrt /dev/sd?
    ```
ਇਹ ਆਮ ਤੌਰ 'ਤੇ ਆਖਰੀ ਲਾਈਨ ਹੁੰਦੀ ਹੈ.  
    **ਚੇਤਾਵਨੀ** : ਜਾਂਚ ਕਰੋ ਕਿ ਇਹ ਉਪਕਰਣ ਪਹਿਲਾਂ ਮੌਜੂਦ ਨਹੀਂ ਸੀ \(ਵੇਖੋ ਕਿ ਕਦਮ 2\) **ਵਿੱਚ ਕੀ ਦਿਖਾਇਆ ਗਿਆ ਹੈ !!!**

 4. **ਇੱਕ ਕਾਰਡ ਤੇ ਇੱਕ ਚਿੱਤਰ ਲਿਖੋ**



    ਹੇਠਾਂ ਦਿੱਤੀ ਕਮਾਂਡ ਚਲਾਓ, _vojo\_raspbian_ ਨੂੰ ਪਗ਼ 1 ਵਿੱਚ ਦੱਸੇ ਗਏ ਨਾਮ ਨਾਲ ਤਬਦੀਲ ਕਰੋ, ਅਤੇ _vojo\_karto_ ਕਦਮ 3 ਵਿੱਚ ਦਿੱਤੇ ਨਾਮ ਨਾਲ.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (ਅਵਧੀ: ~40 ਮਿੰਟ)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


#  _raspberry_ਦੀ ਪਹਿਲੀ ਸ਼ੁਰੂਆਤ
ਕੀਬੋਰਡ, ਮਾ mouseਸ ਅਤੇ ਡਿਸਪਲੇਅ ਨਾਲ ਜੁੜੋ, _raspberry_ਵਿਚ ਮਾਈਕ੍ਰੋ- SD ਕਾਰਡ ਪਾਓ.  
ਪਾਵਰ ਨੂੰ _raspberry_ਨਾਲ ਕਨੈਕਟ ਕਰੋ.

 _raspberry_ ਸ਼ੁਰੂ ਹੁੰਦੀ ਹੈ, ਅਤੇ ਕੌਂਫਿਗਰੇਸ਼ਨ ਉਪਯੋਗਤਾ ਅਰੰਭ ਹੋ ਜਾਂਦੀ ਹੈ. ਆਪਣੇ ਆਪ ਨੂੰ ਦੇਸ਼, ਪਾਸਵਰਡ, ਫਾਈ ਨੈਟਵਰਕ ਸਥਾਪਤ ਕਰਨ ਲਈ ਅਗਵਾਈ ਦਿਉ.

ਮੈਂ ਤੁਹਾਨੂੰ ਸਲਾਹ ਦਿੰਦਾ ਹਾਂ ਕਿ ਤੁਸੀਂ ਆਪਣੇ zZ1 ਨੂੰ ਇੱਕ ਸਥਿਰ IP ਐਡਰੈੱਸ ਦਿਓ. ਤੁਸੀਂ ਇਹ ਆਪਣੇ DHCP ਸਰਵਰ ਤੇ ਕਰ ਸਕਦੇ ਹੋ, ਜੇ ਤੁਹਾਡੇ ਕੋਲ ਹੈ, ਜਾਂ _raspberry_ਦੀ ਸੰਰਚਨਾ ਵਿੱਚ ਹੈ.  
 _raspberry_ਦੇ ਪੱਧਰ 'ਤੇ ਅਜਿਹਾ ਕਰਨ ਲਈ, ਫਾਈਲ _/etc/dhcpcp.conf_ਨੂੰ ਸੋਧੋ, ਉਦਾਹਰਣ ਵਜੋਂ _nano_ ਨਾਲ:

```bash
sudo nano /etc/dhcpcd.conf
```

ਤਦ ਤੁਹਾਨੂੰ ਇੰਟਰਫੇਸ ਕੌਂਫਿਗਰੇਸ਼ਨ ਨੂੰ ਸੰਸ਼ੋਧਿਤ ਕਰਨ ਜਾਂ ਜੋੜਨ ਦੀ ਜ਼ਰੂਰਤ ਹੈ ਜੋ ਤੁਹਾਡੀ (zZ1) ਈਥ0 ਵਾਇਰਡ ਨੈਟਵਰਕ ਲਈ, wlan0 wifia ਨੈੱਟਵਰਕ)ਲਈ ਹੈ. ਉਦਾਹਰਣ ਦੇ ਲਈ, ਇੱਕ IP ਐਡਰੈੱਸ 192.168.0.101 ਨੂੰ ਇੱਕ ਨੈਟਵਰਕ ਨੂੰ ਨਿਰਧਾਰਤ ਕਰਨਾ ਜਿਸ ਦਾ ਰਾterਟਰ 192.168.0.1 ਹੈ:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
ਤੁਸੀਂ ਨਾਮ ਸਰਵਰ (DNS)ਵੀ ਦਰਸਾ ਸਕਦੇ ਹੋ. 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
ਜੇ ਤੁਸੀਂ ਕਮਾਂਡ ਲਾਈਨ ਨੂੰ ਰਿਮੋਟ ਤੋਂ ਐਕਸੈਸ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ, ਤਾਂ ssh ਨੂੰ ਸਮਰੱਥ ਕਰੋ:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

 _raspberry_ ਨੂੰ ਸਮੇਂ ਸਿਰ ਰੱਖਣ ਲਈ, ਐਨਟੀਪੀ:ਸਥਾਪਤ ਕਰੋ

```bash
sudo apt install ntp
```
