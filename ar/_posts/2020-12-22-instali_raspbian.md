---
lang: ar
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'تثبيت raspbian'
title: 'تثبيت _raspbian_ على _Raspberry_'
---

سنكتب النظام _raspbian_ إلى بطاقة micro-SD ، ثم سنقوم ببعض إعدادات النظام الأساسية. 


# لإعداد بطاقة Micro-SD.

في هذا المثال ، اخترت تجهيز بطاقة micro-SD لجهاز كمبيوتر _raspberry pi 3_ Debian Linux ، ومن سطر الأوامر.

إذا كان هذا لا يلبي رغباتك ، فستجد بسهولة طرقًا أخرى على الإنترنت ، على سبيل المثال على الويب <https://howtoraspberrypi.com/>.

 1. **احصل على أحدث نسخة من _raspbian_ من الموقع الرسمي:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
لاحظ اسم الملف المستخرج من الملف المضغوط.
    
 2. **تحديد الأقراص الحالية:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
لاحظ نتيجة الأمر. 3. **أدخل البطاقة في الحاسب**
    
    ثم حدد مسار البطاقة:
    
    ```bash
    ls -lrt /dev/sd?
    ```
عادة ما يكون هذا هو السطر الأخير.  
    **تحذير** : تحقق من عدم وجود هذا الجهاز من قبل \(انظر ما تم عرضه في الخطوة 2\) **!!!**

 4. **اكتب صورة إلى بطاقة**



    قم بتشغيل الأمر أدناه ، مع استبدال _vojo\_raspbian_ بالاسم المذكور في الخطوة 1 ، و _vojo\_karto_ بالاسم المذكور في الخطوة 3.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (المدة: ~40 دقيقة)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


# أول بداية لـ _raspberry_
قم بتوصيل لوحة المفاتيح والماوس والشاشة ، أدخل بطاقة micro-SD في _raspberry_.  
قم بتوصيل الطاقة بـ _raspberry_.

يبدأ _raspberry_ ، وتبدأ أداة التكوين المساعدة. دع نفسك يتم إرشادك لإعداد البلد وكلمة المرور وشبكة wifi.

أنصحك بإعطاء عنوان IP ثابت لـ _raspberry_الخاص بك. يمكنك القيام بذلك إما على خادم DHCP ، إذا كان لديك واحد ، أو في تكوين _raspberry_.  
للقيام بذلك على مستوى _raspberry_، ما عليك سوى تعديل الملف _/etc/dhcpcp.conf_، على سبيل المثال باستخدام _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

ثم تحتاج إلى تعديل أو إضافة تهيئة الواجهة التي تهمك (eth0 للشبكة السلكية ، wlan0 لشبكة wifia). على سبيل المثال ، لتعيين عنوان IP 192.168.0.101 لشبكة يكون جهاز التوجيه الخاص بها 192.168.0.1:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
يمكنك أيضًا تحديد خوادم الأسماء (DNS). 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
إذا كنت تريد الوصول إلى سطر الأوامر عن بعد ، فقم بتمكين ssh:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

للحفاظ على _raspberry_ في الوقت المحدد ، قم بتثبيت ntp:

```bash
sudo apt install ntp
```

إذا لم تكن بحاجة إليها، إزالة:
apt wolfram-motor wolframscript libreoffice*
APT Pure All
