---
lang: ja
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'インストール domoticz.'
title: 'インストール domoticz.'
---

これは、raspbianでのdomoticzインストールの例です。

専用ユーザーを作成することから始め、次にdomoticzをインストールします。
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
表示されたらEnterキーを押します (\<OK> estas la sola elekto).  
サービスの選択：httpとhttpsをオンのままにし、[OK]に移動して、入力します。  
_«HTTP Port number:»_ 8080を終了し、[OK]に移動して、Enterキーを押します。  
_«HTTPS Port number:»_ 8443を入力し、[OK]に移動して、入力します。  
_«Installation Folder:»_ メトゥ _/home/domoticz/domoticz_、OKに移動し、入力します。  
_«Installation Complete!»_  、 入る。


今、私たちは作成します _«systemd»_ domoticzを起動するサービス：
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

domoticzは次の場所にインストールされ、アクセスできます。
* パイの： <http://localhost:8080> または <https://localhost:8443>
* ネットワークの： <http://ip-adreso_de_la_pi:8080> または <https://ip-adreso_de_la_pi:8443>

任意の構成：  
に行く _«Setup --> Settings»_  
言語を変更し、場所を設定する  
セキュリティを定義する：ユーザー名とパスワード  
を定義する "ローカルエリアネットワーク"、例： _«127.0.0.\*;192.168.0.*»_  
アクティベート "自動バックアップ"  
ハードウェア/デバイス：無効にする "新しいデバイスを受け入れる"  
クリック "設定を適用する".  

次に、ハードウェアを追加する必要があります。  
見る <https://www.domoticz.com/wiki/Getting_started>

詳細については、
見る <https://www.domoticz.com/wiki/Raspberry_Pi>
