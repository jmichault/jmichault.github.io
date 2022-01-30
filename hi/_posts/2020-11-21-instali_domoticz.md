---
komentoj_id: 3
lang: hi
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'अधिवास स्थापित करें।'
title: 'अधिवास स्थापित करें।'
---

यहाँ रास्पबियन के तहत एक डोमोटिकज़ इंस्टॉलेशन का एक उदाहरण है।

हम एक समर्पित उपयोगकर्ता बनाकर शुरू करते हैं, फिर हम डोमोटिकज़ स्थापित करते हैं:
```bash
sudo bash
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
प्रेजेंटेशन प्रदर्शित होने पर एंटर दबाएं ( _\<OK>_ estas la sola elekto).  
  
  
सेवाओं का चयन: छुट्टी _http_ और _https_ की जाँच की, _OK_पर जाएँ, Enter दबाएँ।  
_«HTTP Port number:»_ 8080 छोड़ें, _OK_पर जाएँ, Enter दबाएँ।  
_«HTTPS Port number:»_ 8443 दर्ज करें, _OK_पर जाएं, दर्ज करें।  
_«Installation Folder:»_     _/home/domotiko/domoticz_  जाओ   _OK_, इनपुट कुंजी रखें।    
 _«Installation Complete!»_  , अंदर आओ। 


अब हम सेवा _«systemd»_ बनाते हैं, जो domoticz लॉन्च करेगी:
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

_domoticz_ स्थापित है और सुलभ है:
* पी से: <http: // localhost: 8080> या <https: // / लोकलहोस्ट: नेटवर्क का 8443>
*  <http: // पता_IP__pi:8080> aŭ <https://adreso_IP_de_पी: 8443>

कुछ विन्यास:  
के लिए जाओ _«Setup --> Settings»_  
भाषा बदलें, स्थान परिभाषित करें  
सुरक्षा परिभाषित करें: उपयोगकर्ता नाम और पासवर्ड  
उदाहरण के लिए "स्थानीय क्षेत्र नेटवर्क"को परिभाषित करें: _«127.0.0.\*;192.168.0.*»_  
सक्रिय करें "ऑटो सहेजें"  
हार्डवेयर / साइड डिवाइस: अक्षम "नए उपकरणों को स्वीकार करें"  
क्लिक करें "पैरामीटर लागू करें"।  

अब हमें हार्डवेयर जोड़ने की आवश्यकता है।  
देख <https://www.domoticz.com/wiki/Getting_started>


अधिक जानकारी के लिए,
देख <https://www.domoticz.com/wiki/Raspberry_Pi>

