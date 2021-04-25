---
lang: ja
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: raspbianをインストールします
title: ' _Raspberry_に _raspbian_ をインストールします'
---

システム _raspbian_ をmicro-SDカードに書き込んでから、いくつかの基本的なシステム設定を行います。 


# micro-SDカードを準備します。

この例では、 _raspberry pi 3_ DebianLinuxコンピューター用にコマンドラインからmicro-SDカードを準備することを選択しました。

これがあなたの希望に合わない場合は、インターネット上で他の方法を簡単に見つけることができます。たとえば、Web <https://howtoraspberrypi.com/>です。

 1. **公式ウェブサイトから _raspbian_ の最新バージョンを入手してください：**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
zipファイルから抽出されたファイルの名前をメモします。
    
 2. **現在のディスクを識別します：**


    
    ```bash
    ls -lrt /dev/sd?
    ```
コマンドの結果に注意してください。
3. **カードをコンピューターに挿入します**
    
    次に、カードのパスを特定します：
    
    ```bash
    ls -lrt /dev/sd?
    ```
これは通常最後の行です。  
    **警告** ：このデバイスが前に存在していなかったことを確認してください \(ステップ2\) **で示されたものを参照してください!!!**

 4. **カードに画像を書き込む**



    以下のコマンドを実行し、 _vojo\_raspbian_ を手順1でメモした名前に置き換え、 _vojo\_karto_ を手順3でメモした名前に置き換えます。
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (期間： ~40分)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


#  _raspberry_の最初の開始
キーボード、マウス、ディスプレイを接続し、micro-SDカードを _raspberry_に挿入します。  
電源を _raspberry_に接続します。

 _raspberry_ が起動し、構成ユーティリティが起動します。国、パスワード、wifiネットワークを設定するためのガイドをご利用ください。

 _raspberry_に固定IPアドレスを指定することをお勧めします。これは、DHCPサーバーがある場合はそれを使用するか、 _raspberry_の構成で実行できます。  
 _raspberry_のレベルでこれを行うには、ファイル _/etc/dhcpcp.conf_を、たとえば _nano_ で変更するだけです。

```bash
sudo nano /etc/dhcpcd.conf
```

次に、関心のあるインターフェイス構成を変更または追加する必要があります (有線ネットワークの場合はeth0、wifiaネットワークの場合はwlan0)。たとえば、ルーターが192.168.0.1であるネットワークにIPアドレス192.168.0.101を割り当てるには：

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
ネームサーバー (DNS)を指定することもできます。 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
コマンドラインにリモートでアクセスする場合は、sshを有効にします：

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

 _raspberry_ を時間どおりに保つには、ntpをインストールします：

```bash
sudo apt install ntp
```

必要ない場合は、
の除去：
パージAPT Wolfram-Motor WolframScript LibreOffice*
APT純粋なすべて
