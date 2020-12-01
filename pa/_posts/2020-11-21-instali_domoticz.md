---
lang: pa
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'ਸਥਾਪਿਤ ਕਰੋ domoticz.'
title: 'ਸਥਾਪਿਤ ਕਰੋ domoticz.'
---

ਇਹ ਰਸਪਬੀਅਨ ਦੇ ਅਧੀਨ ਡੋਮੋਟਿਕਜ਼ ਸਥਾਪਨਾ ਦੀ ਇੱਕ ਉਦਾਹਰਣ ਹੈ.

ਅਸੀਂ ਇੱਕ ਸਮਰਪਿਤ ਉਪਭੋਗਤਾ ਬਣਾ ਕੇ ਅਰੰਭ ਕਰਦੇ ਹਾਂ, ਫਿਰ ਅਸੀਂ ਡੋਮੋਟਿਕਜ਼ ਸਥਾਪਤ ਕਰਦੇ ਹਾਂ:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
ਪੇਸ਼ ਕਰਨ ਤੇ ਐਂਟਰ ਦਬਾਓ (\<OK> estas la sola elekto).  
ਸੇਵਾਵਾਂ ਦੀ ਚੋਣ: ਛੱਡੋ http ਅਤੇ https ਨੂੰ ਚੈੱਕ ਕਰੋ, ਠੀਕ ਹੈ ਤੇ ਜਾਓ, ਐਂਟਰ ਕਰੋ.  
_«HTTP Port number:»_ 8080 ਬੰਦ ਕਰੋ, ਠੀਕ ਹੈ ਤੇ ਜਾਓ, ਐਂਟਰ ਦਬਾਓ.  
_«HTTPS Port number:»_ 8443 ਪਾਓ, ਠੀਕ ਹੈ ਤੇ ਜਾਓ, ਐਂਟਰ ਕਰੋ.  
_«Installation Folder:»_ ਮੀਟੂ _/home/domoticz/domoticz_, ਠੀਕ ਹੈ ਤੇ ਜਾਓ, ਐਂਟਰ ਕਰੋ.  
_«Installation Complete!»_  , ਦਰਜ ਕਰੋ.


ਹੁਣ ਅਸੀਂ ਬਣਾਉਂਦੇ ਹਾਂ _«systemd»_ ਸੇਵਾ ਜੋ ਡੋਮੋਟਿਕਜ਼ ਲਾਂਚ ਕਰੇਗੀ:
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

ਡੋਮੋਟਿਕਜ਼ ਸਥਾਪਤ ਹੈ ਅਤੇ ਇਸ ਤੇ ਪਹੁੰਚਯੋਗ ਹੈ:
* pi ਦੇ: <http://localhost:8080> ਜਾਂ <https://localhost:8443>
* ਨੈੱਟਵਰਕ ਦੇ: <http://ip-adreso_de_la_pi:8080> ਜਾਂ <https://ip-adreso_de_la_pi:8443>

ਕੋਈ ਵੀ ਸੰਰਚਨਾ:  
ਵੱਲ ਜਾ _«Setup --> Settings»_  
ਭਾਸ਼ਾ ਬਦਲੋ, ਨਿਰਧਾਰਿਤ ਸਥਾਨ  
ਸੁਰੱਖਿਆ ਨੂੰ ਪ੍ਰਭਾਸ਼ਿਤ ਕਰੋ: ਉਪਭੋਗਤਾ ਨਾਮ ਅਤੇ ਪਾਸਵਰਡ  
ਪਰਿਭਾਸ਼ਤ "ਸਥਾਨਕ ਏਰੀਆ ਨੈਟਵਰਕ", ਉਦਾਹਰਣ: _«127.0.0.\*;192.168.0.*»_  
ਸਰਗਰਮ "ਆਟੋਮੈਟਿਕ ਬੈਕਅਪ"  
ਹਾਰਡਵੇਅਰ / ਜੰਤਰ: ਅਯੋਗ "ਨਵੇਂ ਉਪਕਰਣ ਸਵੀਕਾਰ ਕਰੋ"  
ਕਲਿਕ ਕਰੋ "ਸੈਟਿੰਗ ਲਾਗੂ ਕਰੋ".  

ਹੁਣ ਸਾਨੂੰ ਹਾਰਡਵੇਅਰ ਜੋੜਨ ਦੀ ਜ਼ਰੂਰਤ ਹੈ.  
ਵੇਖੋ <https://www.domoticz.com/wiki/Getting_started>

ਵਧੇਰੇ ਜਾਣਕਾਰੀ ਲਈ,
ਵੇਖੋ <https://www.domoticz.com/wiki/Raspberry_Pi>
