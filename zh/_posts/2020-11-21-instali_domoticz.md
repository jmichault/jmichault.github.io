---
lang: zh
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: '安装 domoticz.'
title: '安装 domoticz.'
---

这是在raspbian下安装domoticz的示例。

我们首先创建一个专用用户，然后安装domoticz：
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
出现时按Enter (\<OK> estas la sola elekto).  
服务选择：选中http和https，转到OK，输入。  
_«HTTP Port number:»_ 退出8080，转到OK，然后按Enter。  
_«HTTPS Port number:»_ 放8443，转到OK，输入。  
_«Installation Folder:»_ 梅图 _/home/domoticz/domoticz_，转到OK，输入。  
_«Installation Complete!»_  ，输入。


现在我们创建 _«systemd»_ 将启动domoticz的服务：
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

domoticz已安装并可在以下位置访问：
* 的pi： <http://localhost:8080> 要么 <https://localhost:8443>
* 网络的： <http://ip-adreso_de_la_pi:8080> 要么 <https://ip-adreso_de_la_pi:8443>

任何配置：  
去 _«Setup --> Settings»_  
更改语言，设置位置  
定义安全性：用户名和密码  
定义 "局域网络"，例如： _«127.0.0.\*;192.168.0.*»_  
启用 "自动备份"  
硬件/设备：禁用 "接受新设备"  
点击 "套用设定".  

现在我们需要添加硬件。  
看到 <https://www.domoticz.com/wiki/Getting_started>

更多细节，
看到 <https://www.domoticz.com/wiki/Raspberry_Pi>
