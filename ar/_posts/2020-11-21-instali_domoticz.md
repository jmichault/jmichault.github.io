---
lang: ar
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'تثبيت domoticz.'
title: 'تثبيت domoticz.'
---

هذا مثال على تثبيت Domoticz تحت نظام raspbian.

نبدأ بإنشاء مستخدم مخصص ، ثم نقوم بتثبيت domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
اضغط على Enter عند تقديمها (\<OK> estas la sola elekto).  
اختيار الخدمات: اترك http و https محددًا ، وانتقل إلى موافق ، ثم أدخل.  
_«HTTP Port number:»_ خروج 8080 ، انتقل إلى "موافق" ، واضغط على Enter.  
_«HTTPS Port number:»_ ضع 8443 ، اذهب إلى موافق ، أدخل.  
_«Installation Folder:»_ ميتو _/home/domoticz/domoticz_، اذهب إلى "موافق" ، أدخل.  
_«Installation Complete!»_  ، أدخل.


الآن نقوم بإنشاء ملف _«systemd»_ الخدمة التي ستطلق Domoticz:
```bash
service domoticz stop
rm /etc/*.d/*domoticz*
echo "[Unit]
Description=domoticz

[Service]
ExecStart=/home/domoticz/domoticz/domoticz -daemon -www 8080 -sslwww 8443 -pidfile /var/run/domoticz/domoticz.pid
User=domoticz
RuntimeDirectory=domoticz
LogsDirectory=domoticz
Restart=on-abort
PIDFile=/var/run/domoticz/domoticz.pid

[Install]
WantedBy=multi-user.target
" >/etc/systemd/system/domoticz.service
echo "domoticz ALL=(root) NOPASSWD: /usr/sbin/service domoticz.sh *,/bin/systemctl stop domoticz.service,/bin/systemctl start domoticz.service
" >/etc/sudoers.d/010_domoticz
chmod 440 /etc/sudoers.d/010_domoticz
systemctl daemon-reload
chown -R domoticz.domoticz domoticz
systemctl enable domoticz
systemctl start domoticz
```

domoticz مثبت ويمكن الوصول إليه على:
* من بي: <http://localhost:8080> أو <https://localhost:8443>
* من الشبكة: <http://ip-adreso_de_la_pi:8080> أو <https://ip-adreso_de_la_pi:8443>

أي تكوين:  
اذهب إلى _«Setup --> Settings»_  
تغيير اللغة وتحديد الموقع  
تعريف الأمان: اسم المستخدم وكلمة المرور  
تحديد ال "الشبكات المحلية"، مثال: _«127.0.0.\*;192.168.0.*»_  
تفعيل "النسخ الاحتياطي التلقائي"  
الأجهزة / الأجهزة: تعطيل "قبول الأجهزة الجديدة"  
انقر "تطبيق إعدادات".  

الآن نحن بحاجة إلى إضافة الأجهزة.  
نرى <https://www.domoticz.com/wiki/Getting_started>

لمزيد من التفاصيل،
نرى <https://www.domoticz.com/wiki/Raspberry_Pi>
