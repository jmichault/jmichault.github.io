---
lang: fr
lang-niv: fonto
layout: post
lang-ref: instali_rf_gpio
slug: instali rf_gpio
title: installer rf_gpio sur le raspberry
---
installer rf_gpio
  cd /home/pi
  git clone https://github.com/jmichault/rf_gpio.git
  cd rf_gpio
  sudo cp -p rf_gpio.sh /etc/init.d
## changer le port :
  sudo vi /etc/init.d/rf_gpio.sh
## --> remplacer 10000 par 1963 sur la ligne DAEMON_ARGS
  sudo systemctl enable rf_gpio.sh
  sudo systemctl start rf_gpio.sh
##konekti la ricevilon al :
##   datoj : gpio2 bcm27 (pinglo 13)
##   minus : 0v (pinglo 9)
##   plus : 3.3v (pinglo 1 aŭ pinglo 17)
##konekti la dissendilon al gpio0 bcm17 (pinglo 11)
##   datoj : gpio0 bcm17 (pinglo 11)
##   minus : 0v (pinglo 6)
##   plus : 5v (pinglo 4 aŭ pinglo 2)
  ## si première installation, dans domoticz :
# aldonu RFLink-enirejon kun LAN-interfaca tipo-aparataro
# fora adreso: 127.0.0.1
# haveno: 10000 (1963 si changé)
# se la aparataro estas rekonita, la integriĝo kun domoticz estas simpla: simple uzu la butonon "aŭtomata detekto" de la langeto "ŝaltiloj", aŭ enŝaltu la opcion "permesi dum 5 minutoj"
# le thermomètre apparaitra tout seul.
# pour la prise connectée, appuyer sur les boutons on/off de la prise.
  

