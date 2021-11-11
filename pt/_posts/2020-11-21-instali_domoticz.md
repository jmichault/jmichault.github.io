---
komentoj_id: 3.
lang: pt
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Instale o domoticz.'
title: 'Instale o domoticz.'
---

Aqui está um exemplo de uma instalação domoticz sob raspbian.

Começamos criando um usuário dedicado, depois instalamos domoticz:
```bash
sudo bash
adduser domotiko
cd /home/domotiko
curl -sSL install.domoticz.com | bash
```
Pressione Enter quando a apresentação for exibida ( _\<OK>_ estas la sola elekto).  
  
  
Seleção de serviços: deixe _http_ e _https_ marcados, vá para _OK_, pressione Enter.  
_«HTTP Port number:»_ saia de 8080, vá para _OK_, pressione Enter.  
_«HTTPS Port number:»_ insira 8443, vá para _OK_, insira.  
_«Installation Folder:»_   Coloque   _/home/domotiko/domoticz_  Go   _OK_, entrada.    
 _«Installation Complete!»_  , entre. 


Agora criamos o serviço _«systemd»_ , que vai lançar domoticz:
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

_domoticz_ está instalado e acessível:
* do pi: <http: // localhost: 8080> ou <https: / / localhost: 8443>
* da rede: <http: // endereço_IP_de_pi:8080> aŭ <https://adreso_IP_de_pi: 8443>

alguma configuração:  
vamos para _«Setup --> Settings»_  
alterar idioma, definir localização  
definir segurança: nome de usuário e senha  
definir as "Redes Locais", por exemplo: _«127.0.0.\*;192.168.0.*»_  
Ativar "Salvar automaticamente"  
Hardware / Dispositivos laterais: desabilitar "Aceitar novos dispositivos"  
Clique em "Aplicar parâmetros".  

Agora precisamos adicionar o hardware.  
Vejo <https://www.domoticz.com/wiki/Getting_started>


Para mais detalhes,
Vejo <https://www.domoticz.com/wiki/Raspberry_Pi>

