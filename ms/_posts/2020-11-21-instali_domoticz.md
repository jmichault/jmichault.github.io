---
lang: ms
lang-niv: auto
lang-ref: instali-domoticz
layout: post
slug: 'Pasang domoticz.'
title: 'Pasang domoticz.'
---

Berikut adalah contoh pemasangan domoticz di bawah raspbian.

Kami mulakan dengan membuat pengguna yang berdedikasi, kemudian kami memasang domoticz:
```bash
sudo bash
adduser domoticz
cd /home/domoticz
curl -sSL install.domoticz.com | bash
```
Tekan Enter semasa persembahan ditunjukkan ( _\<OK>_ estas la sola elekto).  
  
  
Pemilihan perkhidmatan: biarkan _http_ dan _https_ diperiksa, pergi ke _OK_, tekan Enter.  
_«HTTP Port number:»_ tinggalkan 8080, pergi ke _OK_, tekan Enter.  
_«HTTPS Port number:»_ masukkan 8443, pergi ke _OK_, Enter.  
_«Installation Folder:»_ set _/home/domoticz/domoticz_, pergi ke _OK_, Enter.  
_«Installation Complete!»_  , Masukkan.


Sekarang kami membuat perkhidmatan _«systemd»_ , yang akan melancarkan domoticz:
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

_domoticz_ dipasang dan dapat diakses:
* dari pi: <http: // localhost: 8080> atau <https: / / localhost: 8443>
* rangkaian: <http: // alamat_IP_dari_pi:8080> aŭ <https://adreso_IP_de_pi: 8443>

beberapa konfigurasi:  
pergi ke _«Setup --> Settings»_  
tukar bahasa, tentukan lokasi  
tentukan keselamatan: nama pengguna dan kata laluan  
tentukan "Rangkaian Kawasan Setempat", contohnya: _«127.0.0.\*;192.168.0.*»_  
Aktifkan "Jimat automatik"  
Peranti perkakasan / sampingan: lumpuhkan "Terima peranti baru"  
Klik "Terapkan parameter".  

Sekarang kita perlu menambah perkakasan.  
lihat <https://www.domoticz.com/wiki/Getting_started>


Untuk keterangan lebih lanjut,
lihat <https://www.domoticz.com/wiki/Raspberry_Pi>

