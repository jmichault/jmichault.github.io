---
lang: zh
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 安装树莓派
title: '在 _Raspberry_上安装 _raspbian_ '
---

我们将系统 _raspbian_ 写入micro-SD卡，然后进行一些基本的系统设置。 


# 准备Micro SD卡。

在此示例中，我选择从命令行为 _raspberry pi 3_ Debian Linux计算机准备微型SD卡。

如果这不符合您的意愿，您可以在Internet上轻松找到其他方法，例如在Web <https://howtoraspberrypi.com/>上。

 1. **从官方网站获取 _raspbian_ 的最新版本：**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
记下从zip文件提取的文件的名称。
    
 2. **识别当前磁盘：**


    
    ```bash
    ls -lrt /dev/sd?
    ```
注意命令的结果。
3. **将卡插入计算机**
    
    然后确定卡的路径：
    
    ```bash
    ls -lrt /dev/sd?
    ```
这通常是最后一行。  
    **警告** ：检查该设备是否不存在 \(才能看到步骤2\) **中显示的内容！**

 4. **将图像写入卡**



    运行以下命令，将 _vojo\_raspbian_ 替换为步骤1中的名称，将 _vojo\_karto_ 替换为步骤3中的名称。
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (时长： ~40分钟)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


#  _raspberry_的首次启动
连接键盘，鼠标和显示器，将Micro SD卡插入 _raspberry_。  
将电源连接到 _raspberry_。

 _raspberry_ 启动，并且配置实用程序启动。让您自己指导设置国家/地区，密码和wifi网络。

我建议您为 _raspberry_提供一个固定的IP地址。您可以在DHCP服务器（如果有）上或在 _raspberry_的配置中执行此操作。  
要在 _raspberry_级别执行此操作，只需修改文件 _/etc/dhcpcp.conf_，例如使用 _nano_ ：

```bash
sudo nano /etc/dhcpcd.conf
```

然后，您需要为有线网络修改或添加您感兴趣的接口配置 (eth0，对于wifia网络)则需要wlan0。例如，将IP地址192.168.0.101分配给路由器为192.168.0.1的网络：

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
您还可以指定名称服务器 (DNS)。 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
如果要远程访问命令行，请启用ssh：

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

要保持 _raspberry_ 的时间不变，请安装ntp：

```bash
sudo apt install ntp
```

