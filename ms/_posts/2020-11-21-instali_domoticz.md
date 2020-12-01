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
Tekan Enter semasa dibentangkan (\<OK> estas la sola elekto).  
Pilihan perkhidmatan: biarkan http dan https dicentang, pergi ke OK, masukkan.  
_«HTTP Port number:»_ jalan keluar 8080, pergi ke OK, tekan Enter.  
_«HTTPS Port number:»_ masukkan 8443, pergi ke OK, masukkan.  
_«Installation Folder:»_ saya juga _/home/domoticz/domoticz_, pergi ke OK, masukkan.  
_«Installation Complete!»_  , Masukkan.


Sekarang kita membuat _«systemd»_ perkhidmatan yang akan melancarkan domoticz:
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

domoticz dipasang dan boleh diakses di:
* pi: <http://localhost:8080> atau <https://localhost:8443>
* rangkaian: <http://ip-adreso_de_la_pi:8080> atau <https://ip-adreso_de_la_pi:8443>

sebarang konfigurasi:  
pergi ke _«Setup --> Settings»_  
tukar bahasa, tetapkan lokasi  
tentukan keselamatan: nama pengguna dan kata laluan  
tentukan "Rangkaian Kawasan Setempat", contoh: _«127.0.0.\*;192.168.0.*»_  
aktifkan "Sandaran Automatik"  
Perkakasan / Peranti: lumpuhkan "Terima Peranti baru"  
klik "Gunakan Tetapan".  

Sekarang kita perlu menambah perkakasan.  
lihat <https://www.domoticz.com/wiki/Getting_started>

Untuk keterangan lebih lanjut,
lihat <https://www.domoticz.com/wiki/Raspberry_Pi>
