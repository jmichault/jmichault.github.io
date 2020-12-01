---
lang: bn
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'ইনস্টল করুন domoticz.'
title: 'ইনস্টল করুন domoticz.'
---

এখানে রাস্পবিয়ানের অধীনে ডোমোটিক ইনস্টলেশন করার উদাহরণ।

আমরা একটি উত্সর্গীকৃত ব্যবহারকারী তৈরি করে শুরু করি, তারপরে আমরা ডোমোটিক ইনস্টল করি:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
উপস্থাপিত হলে এন্টার টিপুন (\<OK> estas la sola elekto).  
পরিষেবাদির পছন্দ: HTTP এবং https চেক করুন, ঠিক আছে যান, প্রবেশ করান।  
_«HTTP Port number:»_ 8080 প্রস্থান করুন, ওকে যান, এন্টার টিপুন।  
_«HTTPS Port number:»_ 8443 রাখুন, ঠিক আছে যান, প্রবেশ করুন।  
_«Installation Folder:»_ আমিও _/home/domoticz/domoticz_, ওকে যান, প্রবেশ করুন।  
_«Installation Complete!»_  , প্রবেশ করান।


এখন আমরা তৈরি _«systemd»_ পরিষেবা যা ডোমোটিক্স চালু করবে:
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

ডোমোটিক্স ইনস্টল করা আছে এবং এতে অ্যাক্সেসযোগ্য:
* পাই এর: <http://localhost:8080> বা <https://localhost:8443>
* নেটওয়ার্কের: <http://ip-adreso_de_la_pi:8080> বা <https://ip-adreso_de_la_pi:8443>

যে কোনও কনফিগারেশন:  
যাও _«Setup --> Settings»_  
ভাষা পরিবর্তন করুন, অবস্থান নির্ধারণ করুন  
সুরক্ষা সংজ্ঞা: ব্যবহারকারীর নাম এবং পাসওয়ার্ড  
সংজ্ঞায়িত "স্থানীয় অঞ্চল নেটওয়ার্কসমূহ"উদাহরণস্বরূপ: _«127.0.0.\*;192.168.0.*»_  
সক্রিয় করুন "স্বয়ংক্রিয় ব্যাকআপ"  
হার্ডওয়্যার / ডিভাইসগুলি: অক্ষম করুন "নতুন ডিভাইস গ্রহণ করুন"  
ক্লিক "সেটিংস প্রয়োগ করুন".  

এখন আমাদের হার্ডওয়্যার যুক্ত করতে হবে।  
দেখা <https://www.domoticz.com/wiki/Getting_started>

আরো বিস্তারিত জানার জন্য,
দেখা <https://www.domoticz.com/wiki/Raspberry_Pi>
