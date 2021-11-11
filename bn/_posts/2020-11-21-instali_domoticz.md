---
komentoj_id: 3.
lang: bn
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'ডোমোটিক ইনস্টল করুন।'
title: 'ডোমোটিক ইনস্টল করুন।'
---

এখানে রাস্পবিয়ানের অধীনে ডোমোটিক ইনস্টলেশন করার উদাহরণ।

আমরা একটি উত্সর্গীকৃত ব্যবহারকারী তৈরি করে শুরু করি, তারপরে আমরা ডোমোটিক্স ইনস্টল করি:
```bash
sudo bash
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
উপস্থাপনা প্রদর্শিত হলে এন্টার টিপুন ( _\<OK>_ estas la sola elekto).  
  
  
পরিষেবার বাছাই: ছুটি _http_ এবং _https_ চেক করা হয়েছে, _OK_এ যান, এন্টার টিপুন।  
_«HTTP Port number:»_ 8080 ছেড়ে যান, _OK_এ যান, এন্টার টিপুন।  
_«HTTPS Port number:»_ 8443 প্রবেশ করান, _OK_এ যান, প্রবেশ করুন।  
_«Installation Folder:»_   রাখুন   _/home/domotiko/domoticz_  যান   _OK_, ইনপুট।    
 _«Installation Complete!»_  , আসা। .


এখন আমরা পরিষেবাটি _«systemd»_ তৈরি করি যা ডোমোটিক্স চালু করবে:
```bash
service domoticz stop
rm /etc/*.d/*domoticz*
echo "[Unit]
Description=domoticz

[Service]
ExecStart=/home/domotiko/domoticz/domoticz -daemon -www 8080 -sslwww 8443 -pidfile /var/run/domotiko/domoticz.pid
User=domotiko
RuntimeDirectory=domotiko
LogsDirectory=domotiko
Restart=on-abort
PIDFile=/var/run/domotiko/domoticz.pid

[Install]
WantedBy=multi-user.target
" >/etc/systemd/system/domoticz.service
echo "domotiko ALL=(root) NOPASSWD: /usr/sbin/service domoticz.sh *,/bin/systemctl stop domoticz.service,/bin/systemctl start domoticz.service
" >/etc/sudoers.d/010_domoticz
chmod 440 /etc/sudoers.d/010_domoticz
systemctl daemon-reload
chown -R domotiko.domotiko domoticz
systemctl enable domoticz
systemctl start domoticz
```

_domoticz_ ইনস্টল করা এবং অ্যাক্সেসযোগ্য: (পাইপ থেকে
* : <http: // লোকালহস্ত: 8080> বা <https: / / লোকালহোস্ট: নেটওয়ার্কের 8443>
* :_pi:8080> aŭ <https://adreso_আইপি_de_এর http: // ঠিকানা_IP_পাই: 8443>

কিছু কনফিগারেশন:  
যাও _«Setup --> Settings»_  
ভাষা পরিবর্তন করুন, অবস্থান নির্ধারণ করুন  
সুরক্ষা সংজ্ঞায়িত করুন: ব্যবহারকারীর নাম এবং পাসওয়ার্ড  
 "স্থানীয় অঞ্চল নেটওয়ার্কগুলি"সংজ্ঞা দিন, উদাহরণস্বরূপ: _«127.0.0.\*;192.168.0.*»_  
সক্রিয় করুন "অটো সেভ"  
হার্ডওয়্যার / সাইড ডিভাইস: অক্ষম করুন "নতুন ডিভাইস গ্রহণ করুন"  
 "ক্লিক করুন প্যারামিটার প্রয়োগ করুন"।  

এখন আমাদের হার্ডওয়্যার যুক্ত করতে হবে।  
দেখা <https://www.domoticz.com/wiki/Getting_started>


আরো বিস্তারিত জানার জন্য,
দেখা <https://www.domoticz.com/wiki/Raspberry_Pi>

