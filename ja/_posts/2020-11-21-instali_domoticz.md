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
プレゼンテーションが表示されたらEnterキーを押します ( _\<OK>_ estas la sola elekto).  
  
  
サービスの選択： _http_ と _https_ をチェックしたままにし、 _OK_に移動して、Enterキーを押します。  
_«HTTP Port number:»_ 8080を離れ、 _OK_に移動し、Enterキーを押します。  
_«HTTPS Port number:»_ 8443と入力し、 _OK_に移動して入力します。  
_«Installation Folder:»_ セット _/home/domoticz/domoticz_、 _OK_に移動、入力します。  
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

_domoticz_ がインストールされ、アクセス可能：
* パイから： <http：//ローカルホスト：8080> または <https：/ / localhost：8443>
* のネットワーク： <http：//アドレス_IP_の_pi:8080> aŭ <https://adreso_IP_de_pi：8443>

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

