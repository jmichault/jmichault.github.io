---
lang: bn
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'রাস্পবিয়ান ইনস্টল করুন'
title: ' _Raspberry_এ _raspbian_ ইনস্টল করুন'
---

আমরা মাইক্রো এসডি কার্ডে সিস্টেম _raspbian_ লিখব, তারপরে আমরা কয়েকটি বেসিক সিস্টেম সেটিংস করব। 


# মাইক্রো এসডি কার্ড প্রস্তুত করুন।

এই উদাহরণে, আমি আমার _raspberry pi 3_ ডেবিয়ান লিনাক্স কম্পিউটারের জন্য এবং কমান্ড লাইন থেকে মাইক্রো-এসডি কার্ড প্রস্তুত করতে পছন্দ করেছি।

এটি যদি আপনার ইচ্ছা পূরণ না করে তবে আপনি সহজেই ইন্টারনেটে অন্যান্য পদ্ধতিগুলি খুঁজে পাবেন, উদাহরণস্বরূপ ওয়েবে <https://howtoraspberrypi.com/>।

 1. **সরকারী ওয়েবসাইট থেকে _raspbian_ এর সর্বশেষ সংস্করণটি পান:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
জিপ ফাইল থেকে নেওয়া ফাইলটির নামটি নোট করুন।
    
 2. **বর্তমান ডিস্কগুলি সনাক্ত করুন:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
কমান্ডের ফলাফলটি নোট করুন।
3. **কম্পিউটারে কার্ডটি প্রবেশ করুন**
    
    এর পরে কার্ডের পথটি সনাক্ত করুন:
    
    ```bash
    ls -lrt /dev/sd?
    ```
এটি সাধারণত শেষ লাইন।  
    **সতর্কতা** : পরীক্ষা করুন যে এই ডিভাইসটি আগে উপস্থিত ছিল না \(দেখুন পদক্ষেপ 2\) **এ কী দেখানো হয়েছে !!!**

 4. **একটি কার্ডে একটি চিত্র লিখুন**



    নীচের কমান্ডটি চালান, (ধাপ 1) এ উল্লিখিত নামের সাথে _vojo\_raspbian_ প্রতিস্থাপন করুন এবং _vojo\_karto_ step নং পদক্ষেপে উল্লিখিত নামের সাথে
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (সময়কাল: ~40 মিনিট)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


#  _raspberry_এর প্রথম শুরু
কীবোর্ড, মাউস এবং প্রদর্শন সংযোগ করুন, _raspberry_এ মাইক্রো এসডি কার্ড .োকান।  
পাওয়ারটিকে _raspberry_সাথে সংযুক্ত করুন।

 _raspberry_ শুরু হয় এবং কনফিগারেশন ইউটিলিটি শুরু হয়। নিজেকে দেশ, পাসওয়ার্ড, ওয়াইফাই নেটওয়ার্ক সেট আপ করতে গাইড করুন।

আমি আপনাকে _raspberry_একটি নির্দিষ্ট আইপি ঠিকানা দেওয়ার পরামর্শ দিচ্ছি। আপনি আপনার ডিএইচসিপি সার্ভারে এটি করতে পারেন, যদি আপনার একটি থাকে বা _raspberry_কনফিগারেশনে থাকে।  
 _raspberry_এর স্তরে এটি করতে, কেবল ফাইল _/etc/dhcpcp.conf_পরিবর্তন করুন, উদাহরণস্বরূপ _nano_ সহ:

```bash
sudo nano /etc/dhcpcd.conf
```

তারপরে আপনার ইন্টারফেস কনফিগারেশনটি সংশোধন বা যুক্ত করতে হবে যা ওয়্যার্ড নেটওয়ার্কের জন্য আপনার (eth0, ওয়াইফিয়া নেটওয়ার্কের জন্য wlan0)আগ্রহী। উদাহরণস্বরূপ, একটি নেটওয়ার্কের আইপি ঠিকানা 192.168.0.101 নির্ধারণ করতে যার রাউটারটি 192.168.0.1:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
আপনি নাম সার্ভারগুলি (ডিএনএস)নির্দিষ্ট করতে পারেন। 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
আপনি যদি কমান্ড লাইনটি দূর থেকে অ্যাক্সেস করতে চান তবে ssh সক্ষম করুন:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

 _raspberry_ সময়মতো রাখতে, এনটিপি:ইনস্টল করুন

```bash
sudo apt install ntp
```
