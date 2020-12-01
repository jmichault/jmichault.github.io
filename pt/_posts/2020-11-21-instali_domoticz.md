---
lang: pt
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Instalar domoticz.'
title: 'Instalar domoticz.'
---

Aqui está um exemplo de uma instalação domoticz sob raspbian.

Começamos criando um usuário dedicado e, em seguida, instalamos o domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Pressione Enter quando apresentado (\<OK> estas la sola elekto).  
Escolha de serviços: deixe http e https marcados, vá em OK, entre.  
_«HTTP Port number:»_ saia 8080, vá para OK, pressione Enter.  
_«HTTPS Port number:»_ coloque 8443, vá em OK, entre.  
_«Installation Folder:»_ metu _/home/domoticz/domoticz_, vá para OK, entre.  
_«Installation Complete!»_  , Entrar.


Agora criamos o _«systemd»_ serviço que lançará domoticz:
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

domoticz está instalado e acessível em:
* do pi: <http://localhost:8080> ou <https://localhost:8443>
* da rede: <http://ip-adreso_de_la_pi:8080> ou <https://ip-adreso_de_la_pi:8443>

qualquer configuração:  
vamos para _«Setup --> Settings»_  
alterar idioma, definir localização  
definir segurança: nome de usuário e senha  
Defina a "Redes Locais", exemplo: _«127.0.0.\*;192.168.0.*»_  
ativar "Backup Automático"  
Hardware / Dispositivos: desativar "Aceitar novos dispositivos"  
clique "Aplicar configurações".  

Agora precisamos adicionar o hardware.  
Vejo <https://www.domoticz.com/wiki/Getting_started>

Para mais detalhes,
Vejo <https://www.domoticz.com/wiki/Raspberry_Pi>
