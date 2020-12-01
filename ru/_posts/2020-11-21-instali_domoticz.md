---
lang: ru
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Установить domoticz.'
title: 'Установить domoticz.'
---

Вот пример установки domoticz под raspbian.

Мы начинаем с создания выделенного пользователя, затем устанавливаем domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Нажмите Enter, когда появится (\<OK> estas la sola elekto).  
Выбор услуг: оставьте http и https отмеченными, нажмите ОК, введите.  
_«HTTP Port number:»_ выйдите из 8080, перейдите в ОК, нажмите Enter.  
_«HTTPS Port number:»_ ставим 8443, идем в ОК, вводим.  
_«Installation Folder:»_ мету _/home/domoticz/domoticz_, перейдите в ОК, введите.  
_«Installation Complete!»_  , Войти.


Теперь создадим _«systemd»_ сервис, который запустит домотик:
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

domoticz установлен и доступен по адресу:
* числа пи: <http://localhost:8080> или <https://localhost:8443>
* сети: <http://ip-adreso_de_la_pi:8080> или <https://ip-adreso_de_la_pi:8443>

любая конфигурация:  
перейти к _«Setup --> Settings»_  
изменить язык, установить местоположение  
определить безопасность: имя пользователя и пароль  
определить "Локальные сети", пример: _«127.0.0.\*;192.168.0.*»_  
активировать "Автоматическое резервное копирование"  
Оборудование / Устройства: отключить "Принять новые устройства"  
щелкнуть "Применить настройки".  

Теперь нам нужно добавить оборудование.  
увидеть <https://www.domoticz.com/wiki/Getting_started>

Больше подробностей,
увидеть <https://www.domoticz.com/wiki/Raspberry_Pi>
