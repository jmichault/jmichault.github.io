---
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
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Нажмите Enter, когда отображается презентация (\<ОК> - единственный выбор).  
Выбор услуг: оставьте http и https отмеченными, перейдите в ОК, нажмите Enter.  
_«HTTP Port number:»_ выйдите из 8080, перейдите в ОК, нажмите Enter.  
_«HTTPS Port number:»_ введите 8443, нажмите OK, Enter.  
_«Installation Folder:»_ установите _/home/domoticz/domoticz_, нажмите OK, Enter.  
_«Installation Complete!»_  , Войти.


Теперь создаем сервис _«systemd»_ , который будет запускать domoticz:
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

domoticz установлен и доступен:
* из числа pi: <http: // localhost: 8080> или <https: // localhost: 8443>
* сети: <http: // адрес_IP_из_pi:8080> ou <https://adresse_IP_du_pi: 8443>

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

