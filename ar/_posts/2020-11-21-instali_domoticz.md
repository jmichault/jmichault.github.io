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
اضغط على Enter عند عرض العرض التقديمي ( _\<OK>_ estas la sola elekto).  
  
  
اختيار الخدمات: اترك _http_ و _https_ محددًا ، انتقل إلى _OK_، اضغط على Enter.  
_«HTTP Port number:»_ اترك 8080 ، انتقل إلى _OK_، اضغط على Enter.  
_«HTTPS Port number:»_ أدخل 8443 ، انتقل إلى _OK_، أدخل.  
_«Installation Folder:»_ اضبط _/home/domoticz/domoticz_، انتقل إلى _OK_، أدخل.  
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

_domoticz_ مثبت ويمكن الوصول إليه:
* من pi: <http: // localhost: 8080> أو <https: / / المضيف المحلي: 8443>
* من الشبكة: <http: // address_IP_لـ_pi:8080> aŭ <https://adreso_IP_de_بي: 8443 (درجة 20 درجة) (21 درجة)

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

