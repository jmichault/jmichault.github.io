---
lang: ar
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'تثبيت Domoticz.'
title: 'تثبيت Domoticz.'
---

هذا مثال على تثبيت Domoticz تحت نظام raspbian.

نبدأ بإنشاء مستخدم مخصص ، ثم نقوم بتثبيت domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
اضغط على Enter عند عرض العرض التقديمي (\<OK> هو الخيار الوحيد).  
اختيار الخدمات: اترك http و https محددًا ، وانتقل إلى موافق ، واضغط على Enter.  
_«HTTP Port number:»_ خروج 8080 ، انتقل إلى "موافق" ، واضغط على Enter.  
_«HTTPS Port number:»_ أدخل 8443 ، انتقل إلى موافق ، أدخل.  
_«Installation Folder:»_ اضبط _/home/domoticz/domoticz_، انتقل إلى OK ، Enter.  
_«Installation Complete!»_  ، أدخل.


الآن نقوم بإنشاء الخدمة _«systemd»_ ، والتي ستطلق domoticz:
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

domoticz مثبت ويمكن الوصول إليه:
* من pi: <http: // localhost: 8080> أو <https: // localhost: 8443>
* للشبكة: <http: // address_IP_من_pi:8080> ou <https://adresse_IP_du_pi: 844318 درجة) (19 درجة)

بعض التكوين:  
اذهب إلى _«Setup --> Settings»_  
تغيير اللغة وتحديد الموقع  
تعريف الأمان: اسم المستخدم وكلمة المرور  
حدد "شبكات المنطقة المحلية"، على سبيل المثال: _«127.0.0.\*;192.168.0.*»_  
تنشيط "حفظ تلقائي"  
الأجهزة / الأجهزة الجانبية: تعطيل "قبول الأجهزة الجديدة"  
انقر فوق "تطبيق المعلمات".  

الآن نحن بحاجة إلى إضافة الأجهزة.  
نرى <https://www.domoticz.com/wiki/Getting_started>


لمزيد من التفاصيل،
نرى <https://www.domoticz.com/wiki/Raspberry_Pi>

