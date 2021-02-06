---
lang: ja
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: domoticzをインストールします。
title: domoticzをインストールします。
---

これは、raspbianでのdomoticzインストールの例です。

専用ユーザーを作成することから始め、次にdomoticzをインストールします：
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
プレゼンテーションが表示されたらEnterキーを押します (\<OK> が唯一の選択肢)です。  
サービスの選択：httpとhttpsをオンのままにし、[OK]に移動して、Enterキーを押します。  
_«HTTP Port number:»_ 8080を終了し、[OK]に移動して、Enterキーを押します。  
_«HTTPS Port number:»_ 8443と入力し、[OK]に移動して、[Enter]をクリックします。  
_«Installation Folder:»_ 設定 _/home/domoticz/domoticz_、[OK]に移動し、Enterキーを押します。  
_«Installation Complete!»_  、 入る。


次に、domoticzを起動するサービス _«systemd»_ を作成します：
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

domoticzがインストールされ、アクセス可能：
* from pi： <http：// localhost：8080> または <https：// localhost：8443（ネットワークの°6°）
* ： <http：//_pi:8080> ou <https://adresse_IP_du_のアドレス_IP_pi：8443>

いくつかの構成：  
に行く _«Setup --> Settings»_  
言語を変更し、場所を定義します  
セキュリティの定義：ユーザー名とパスワード  
 "ローカルエリアネットワーク"を定義します。例： _«127.0.0.\*;192.168.0.*»_  
アクティブ化 "自動保存"  
ハードウェア/サイドデバイス：無効 "新しいデバイスを受け入れる"  
クリック "パラメータの適用"。  

次に、ハードウェアを追加する必要があります。  
見る <https://www.domoticz.com/wiki/Getting_started>


詳細については、
見る <https://www.domoticz.com/wiki/Raspberry_Pi>

