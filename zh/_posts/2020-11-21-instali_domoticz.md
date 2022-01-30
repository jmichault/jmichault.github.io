---
komentoj_id: 3.
lang: zh
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 安装domoticz。
title: 安装domoticz。
---

这是在raspbian下安装domoticz的示例。

我们首先创建一个专用用户，然后安装domoticz：
```bash
sudo bash
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
显示演示文稿时按Enter ( _\<OK>_ estas la sola elekto).  
  
  
服务选择：选中 _http_ 和 _https_ ，转到 _OK_，按Enter。  
_«HTTP Port number:»_ 离开8080，转到 _OK_，按Enter。  
_«HTTPS Port number:»_ 输入8443，转到 _OK_，输入。  
_«Installation Folder:»_   PUT   _/home/domotiko/domoticz_  GO   _OK_，输入键。    
 _«Installation Complete!»_  ，进来。 


现在我们创建服务 _«systemd»_ ，它将启动domoticz：
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

_domoticz_ 已安装并可从以下位置访问：
* 从pi： <http：//本地主机：8080> 或 <https：/ /本地主机：8443>
* 网络： <http：//地址_IP_的_pi:8080> aŭ <https://adreso_IP_de_pi：8443>

一些配置：  
去 _«Setup --> Settings»_  
更改语言，定义位置  
定义安全性：用户名和密码  
定义 "局域网"，例如： _«127.0.0.\*;192.168.0.*»_  
激活 "自动保存"  
硬件/侧面设备：禁用 "接受新设备"  
单击 "应用参数"。  

现在我们需要添加硬件。  
看到 <https://www.domoticz.com/wiki/Getting_started>


更多细节，
看到 <https://www.domoticz.com/wiki/Raspberry_Pi>

