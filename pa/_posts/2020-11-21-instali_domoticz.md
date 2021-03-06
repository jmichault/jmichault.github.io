---
lang: pa
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'ਡੋਮੋਟਿਕਜ਼ ਸਥਾਪਿਤ ਕਰੋ.'
title: 'ਡੋਮੋਟਿਕਜ਼ ਸਥਾਪਿਤ ਕਰੋ.'
---

ਇਹ ਰਸਪਬੀਅਨ ਦੇ ਅਧੀਨ ਡੋਮੋਟਿਕਜ਼ ਸਥਾਪਨਾ ਦੀ ਇੱਕ ਉਦਾਹਰਣ ਹੈ.

ਅਸੀਂ ਇੱਕ ਸਮਰਪਿਤ ਉਪਭੋਗਤਾ ਬਣਾ ਕੇ ਅਰੰਭ ਕਰਦੇ ਹਾਂ, ਫਿਰ ਅਸੀਂ ਡੋਮੋਟਿਕਜ਼ ਸਥਾਪਤ ਕਰਦੇ ਹਾਂ:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
ਜਦੋਂ ਪ੍ਰਸਤੁਤੀ ਪ੍ਰਦਰਸ਼ਿਤ ਹੁੰਦੀ ਹੈ ਤਾਂ ਐਂਟਰ ਦਬਾਓ ( _\<OK>_ estas la sola elekto).  
  
  
ਸੇਵਾਵਾਂ ਦੀ ਚੋਣ: ਛੁੱਟੀ _http_ ਅਤੇ _https_ ਚੈੱਕ ਕੀਤੀ ਗਈ, ਤੇ ਜਾਓ (° 5 to), ਐਂਟਰ ਦਬਾਓ.  
_«HTTP Port number:»_ 8080 ਛੱਡੋ, _OK_ਤੇ ਜਾਓ, ਐਂਟਰ ਦਬਾਓ.  
_«HTTPS Port number:»_ 8443 ਦਰਜ ਕਰੋ, ( _OK_'ਤੇ ਜਾਓ, ਐਂਟਰ ਕਰੋ.  
_«Installation Folder:»_ ਸੈੱਟ _/home/domoticz/domoticz_, ਤੇ ਜਾਓ _OK_, ਐਂਟਰ ਕਰੋ.  
_«Installation Complete!»_  , ਦਰਜ ਕਰੋ.


ਹੁਣ ਅਸੀਂ ਸੇਵਾ _«systemd»_ ਬਣਾਉਂਦੇ ਹਾਂ, ਜੋ ਡੋਮੋਟਿਕਜ਼ ਲਾਂਚ ਕਰੇਗੀ:
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

_domoticz_ ਸਥਾਪਤ ਹੈ ਅਤੇ ਪਹੁੰਚਯੋਗ ਹੈ:
* pi ਤੋਂ: <http: // ਲੋਕਲਹੋਸਟ: 8080> ਜਾਂ <https: / / ਲੋਕਲਹੋਸਟ: ਨੈਟਵਰਕ ਦਾ 8443>
* :_pi:8080> aŭ <https://adreso_IP_pi:8080> aŭ <https://adreso_IP_de_ਦਾ http: // ਐਡਰੈੱਸ_IP_ਪਾਈ: 8443>

ਕੁਝ ਕੌਨਫਿਗਰੇਸ਼ਨ:  
ਵੱਲ ਜਾ _«Setup --> Settings»_  
ਭਾਸ਼ਾ ਬਦਲੋ, ਨਿਰਧਾਰਿਤ ਸਥਾਨ  
ਸੁਰੱਖਿਆ ਨੂੰ ਪ੍ਰਭਾਸ਼ਿਤ ਕਰੋ: ਉਪਭੋਗਤਾ ਨਾਮ ਅਤੇ ਪਾਸਵਰਡ  
 "ਸਥਾਨਕ ਏਰੀਆ ਨੈਟਵਰਕ"ਪਰਿਭਾਸ਼ਤ ਕਰੋ, ਉਦਾਹਰਣ ਵਜੋਂ: _«127.0.0.\*;192.168.0.*»_  
ਸਕਿਰਿਆ ਬਣਾਓ "ਆਟੋ ਸੇਵ"  
ਹਾਰਡਵੇਅਰ / ਸਾਈਡ ਉਪਕਰਣ: ਅਯੋਗ "ਨਵੇਂ ਉਪਕਰਣ ਸਵੀਕਾਰ ਕਰੋ"  
ਕਲਿਕ ਕਰੋ "ਪੈਰਾਮੀਟਰ ਲਾਗੂ ਕਰੋ".  

ਹੁਣ ਸਾਨੂੰ ਹਾਰਡਵੇਅਰ ਜੋੜਨ ਦੀ ਜ਼ਰੂਰਤ ਹੈ.  
ਵੇਖੋ <https://www.domoticz.com/wiki/Getting_started>


ਵਧੇਰੇ ਜਾਣਕਾਰੀ ਲਈ,
ਵੇਖੋ <https://www.domoticz.com/wiki/Raspberry_Pi>

