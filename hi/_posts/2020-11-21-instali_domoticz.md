---
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
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
प्रेस दर्ज करें जब प्रस्तुति प्रदर्शित होती है (\<ठीक है> एकमात्र विकल्प)है।  
सेवाओं की पसंद: http और https चेक किया हुआ छोड़ें, ठीक पर जाएँ, Enter दबाएँ।  
_«HTTP Port number:»_ 8080 से बाहर निकलें, ओके पर जाएं, एंटर दबाएं।  
_«HTTPS Port number:»_ 8443 दर्ज करें, ठीक है, दर्ज करें।  
_«Installation Folder:»_ सेट _/home/domoticz/domoticz_, ठीक पर जाएं, दर्ज करें।  
_«Installation Complete!»_  , दर्ज।


अब हम सेवा _«systemd»_ बनाते हैं, जो domoticz लॉन्च करेगी:
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
* pi से: <http: // localhost: 8080> या <https: // localhost: 8443>
* नेटवर्क का: <http: // पता_IP_का_pi:8080> ou <https://adresse_IP_du_pi: 844318 °)

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

