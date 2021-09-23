---
lang: pt
lang-niv: auto
lang-ref: instali_raspbian
layout: post
slug: 'instalar o raspbian'
title: 'instalar _raspbian_ no _Raspberry_'
---

Vamos gravar o sistema _raspbian_ no cartão micro-SD, depois faremos algumas configurações básicas do sistema. 


# Para preparar o cartão Micro-SD.

Neste exemplo, optei por preparar o cartão micro-SD para meu _raspberry pi 3_ computador Debian Linux e a partir da linha de comando.

Se isso não atender aos seus desejos, você encontrará facilmente outros métodos na internet, por exemplo, na web <https://howtoraspberrypi.com/>.

 1. **obtenha a versão mais recente de _raspbian_ no site oficial:**



    ```bash
    wget http://raspberry-pi.fr/download/raspbian_latest.zip -O raspbian.zip
    unzip raspbian.zip
    ```
Anote o nome do arquivo extraído do arquivo zip.
    
 2. **identificar os discos presentes:**


    
    ```bash
    ls -lrt /dev/sd?
    ```
Observe o resultado do comando.
3. **insira o cartão no computador**
    
    em seguida, identifique o caminho do cartão:
    
    ```bash
    ls -lrt /dev/sd?
    ```
esta é geralmente a última linha.  
    **AVISO** : verifique se este dispositivo não estava presente antes \(veja o que foi mostrado na etapa 2\) **!!!**

 4. **escrever uma imagem em um cartão**



    Execute o comando abaixo, substituindo _vojo\_raspbian_ pelo nome anotado na etapa 1 e _vojo\_karto_ pelo nome anotado na etapa 3.
    
    ```bash
    sudo dd bs=1M if=vojo_raspbian of=vojo_karto status=progress conv=fsync
    ```
    (duração: ~40 minutos)
    
    ```bash
    sync
    eject vojo_karto
    ``` 


# primeiro início de _raspberry_
Conecte o teclado, o mouse e a tela, insira o cartão micro-SD em _raspberry_.  
Conecte a alimentação ao _raspberry_.

O _raspberry_ é inicializado e o utilitário de configuração é iniciado. Deixe-se guiar para configurar o país, a senha, a rede wi-fi.

Aconselho você a dar um endereço IP fixo ao seu _raspberry_. Você pode fazer isso em seu servidor DHCP, se tiver um, ou na configuração de _raspberry_.  
Para fazer isso no nível de _raspberry_, basta modificar o arquivo _/etc/dhcpcp.conf_, por exemplo com _nano_ :

```bash
sudo nano /etc/dhcpcd.conf
```

Então você precisa modificar ou adicionar a configuração da interface que lhe interessa (eth0 para a rede cabeada, wlan0 para a rede wifia). Por exemplo, para atribuir o endereço IP 192.168.0.101 a uma rede cujo roteador é 192.168.0.1:

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
```
Você também pode especificar os servidores de nomes (DNS). 

```
interface eth0
static ip_address=192.168.0.101/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1 8.8.8.8
```
se você quiser acessar a linha de comando remotamente, habilite ssh:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Para manter o _raspberry_ dentro do prazo, instale o ntp:

```bash
sudo apt install ntp
```

Se você não precisar, remoção de:
Purge APT Wolfram-motor WolframScript LibreOffice*
Apt pure tudo (° 5 ° 5 ° 5 ° 5 °
