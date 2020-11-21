---
layout: post
title: Instali domoticz.
slug: Instali domoticz.
lang: eo
lang-ref: bonvenon-al-mia-blogo
lang-niv: fonto
---

Jen ekzemplo de domoticz-instalado sub raspbian:

    sudo bash
    adduser domoticz
    cd /home/domoticz
    curl -sSL install.domoticz.com | bash

Premu Enter kiam prezentas (<OK> estas la sola elekto)  
Elekto de servoj: lasu http kaj https kontrolitajn, iru al OK, eniru.  
_«HTTP Port number:»_ forlasu 8080, iru al OK, premu Enter.  
_«HTTPS Port number:»_ metu 8443, iru al OK, enigu.  
_«Installation Folder:»_ metu _/home/domoticz/domoticz_, iru al OK, eniru.  
_«Installation Complete!»_  , Eniru.

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

domoticz estas instalita kaj alirebla ĉe:  
* de la pi: http: // localhost: 8080 aŭ https: // localhost: 8443
* de la reto: http: // adress_du_pi: 8080 aŭ https: // adress_du_pi: 8443

iu agordo:  
iru al Agordo -> Agordoj  
ŝanĝi lingvon, agordi lokon  
difini sekurecon: uzantnomon kaj pasvorton  
difinu la "Lokajn Retojn", ekzemple: 127.0.0.*; 192.168.0.*  
aktivigi "Aŭtomatan Sekurkopion"  
Aparataro / Aparatoj: malaktivigu "Akcepti novajn Aparatojn"  
alklaku "Apliki Agordojn".  

nun ni devas aldoni la aparataron.  
vidu https://www.domoticz.com/wiki/Getting_started


vidu https://www.domoticz.com/wiki/Raspberry_Pi
