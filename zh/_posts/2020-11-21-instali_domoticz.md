---
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
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
显示演示文稿时按Enter (\<OK> 是唯一选择)。  
服务选择：选中http和https，转到OK，然后按Enter。  
_«HTTP Port number:»_ 退出8080，转到OK，然后按Enter。  
_«HTTPS Port number:»_ 输入8443，转到OK，输入。  
_«Installation Folder:»_ 设置 _/home/domoticz/domoticz_，转到OK，输入。  
_«Installation Complete!»_  ，输入。


现在我们创建服务 _«systemd»_ ，它将启动domoticz：
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

domoticz已安装并可以从以下位置访问：
* from pi： <http：//本地主机：8080> 或 <https：//本地主机：8443（网络的°6°）
* ： <http：//地址_pi:8080> ou <https://adresse_的_IP_IP_du_pi：8443>

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

