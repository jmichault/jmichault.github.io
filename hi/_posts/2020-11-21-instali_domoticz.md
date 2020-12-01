---
lang: hi
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'इंस्टॉल _omoticz.'
title: 'इंस्टॉल _omoticz.'
---

यहाँ रास्पबियन के तहत एक डोमोटिकज़ इंस्टॉलेशन का एक उदाहरण है।

हम एक समर्पित उपयोगकर्ता बनाकर शुरू करते हैं, फिर हम डोमोटिकज़ स्थापित करते हैं:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
प्रस्तुत करने पर Enter दबाएँ (\<OK> estas la sola elekto).  
सेवाओं की पसंद: http और https चेक किया हुआ छोड़ें, ठीक पर जाएं, दर्ज करें।  
_«HTTP Port number:»_ 8080 से बाहर निकलें, ओके पर जाएं, एंटर दबाएं।  
_«HTTPS Port number:»_ 8443 डालें, ओके पर जाएं, एंटर करें।  
_«Installation Folder:»_ मैं भी _/home/domoticz/domoticz_, ठीक है, दर्ज करें।  
_«Installation Complete!»_  , दर्ज।


अब हम बनाते हैं _«systemd»_ सेवा है कि अधिवास का शुभारंभ करेंगे:
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

डोमोटिकज़ स्थापित और सुलभ है:
* पी के: <http://localhost:8080> या <https://localhost:8443>
* नेटवर्क का: <http://ip-adreso_de_la_pi:8080> या <https://ip-adreso_de_la_pi:8443>

कोई भी कॉन्फ़िगरेशन:  
के लिए जाओ _«Setup --> Settings»_  
भाषा बदलें, स्थान निर्धारित करें  
सुरक्षा को परिभाषित करें: उपयोगकर्ता नाम और पासवर्ड  
को परिभाषित करो "स्थानीय क्षेत्र नेटवर्क", उदाहरण: _«127.0.0.\*;192.168.0.*»_  
सक्रिय "स्वचालित बैकअप"  
हार्डवेयर / उपकरण: अक्षम करें "नए उपकरणों को स्वीकार करें"  
क्लिक "सेटिंग लागू करें".  

अब हमें हार्डवेयर जोड़ने की आवश्यकता है।  
देख <https://www.domoticz.com/wiki/Getting_started>

अधिक जानकारी के लिए,
देख <https://www.domoticz.com/wiki/Raspberry_Pi>
