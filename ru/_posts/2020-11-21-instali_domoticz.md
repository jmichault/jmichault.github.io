---
komentoj_id: 3.
lang: ru
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Установите domoticz.'
title: 'Установите domoticz.'
---

Вот пример установки domoticz под raspbian.

Мы начинаем с создания выделенного пользователя, затем устанавливаем domoticz:
```bash
sudo bash
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
Нажмите Enter при отображении презентации ( _\<OK>_ estas la sola elekto).  
  
  
Выбор услуг: оставьте _http_ и _https_ отмеченными, перейдите к _OK_, нажмите Enter.  
_«HTTP Port number:»_ оставить 8080, перейти к _OK_, нажать Enter.  
_«HTTPS Port number:»_ введите 8443, перейдите к _OK_, введите.  
_«Installation Folder:»_   Поместите   _/home/domotiko/domoticz_  go   _OK_, ввод.    
 _«Installation Complete!»_   войти. 


Теперь создаем сервис _«systemd»_ , который будет запускать domoticz:
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

_domoticz_ установлен и доступен:
* из pi: <http: // localhost: 8080> или <https: / / localhost: 8443>
* сети: <http: // адрес_IP_из_pi:8080> aŭ <https://adreso_IP_de_пи: 8443>

некоторая конфигурация:  
перейти к _«Setup --> Settings»_  
изменить язык, определить местоположение  
определить безопасность: имя пользователя и пароль  
определить "локальные вычислительные сети", например: _«127.0.0.\*;192.168.0.*»_  
Активировать "Автосохранение"  
Оборудование / Боковые устройства: отключить "Принять новые устройства"  
Щелкните "Применить параметры".  

Теперь нам нужно добавить оборудование.  
увидеть <https://www.domoticz.com/wiki/Getting_started>


Больше подробностей,
увидеть <https://www.domoticz.com/wiki/Raspberry_Pi>

