��            )   �      �     �  A   �  )   �       �     ;   �  �      V   �     C  !   W  B   y  �   �  +   �     �     �  8   �          6     <  H   ?  &   �     �     �     �  !   �  �       �     �	    �	     �
  A   �
  )   !     K  �   _  F   )  �   p  X   ,     �  "   �  C   �  �      *   �     �       7   -     e     y     ~  H   �     �     �     �     �       �   ,    �     �                                      
                                                                                     	                 ID = b524.
 ![](/public/raspberry-cc.png "disposition _raspberry_ et _CC_") 
 ./cc_erase
./cc_write CC2531ZNP-Prod.hex
 ./cc_read save.hex
 Chargez la dernière version du coordonnateur zigbee sur ce site : <https://github.com/Koenkk/Z-Stack-firmware/raw/master/coordinator/Z-Stack_Home_1.2/bin/default/>, puis décompressez l'archive.
 Connectez ces lignes au gros connecteur du câble _CC_ :  
 Connectez quatre lignes _Dupont_ femelle à femelle aux broches 35,36,38 et 39 du _raspberry_. ( La broche 2 se trouve dans l'angle du _raspberry_, voir le site <https://pinout.xyz/> pour se repérer)  
 Consultez [ le site de _flash_cc2531_](https://jmichault.github.io/flash_cc2531-dok/)
 En cas de problème Programmer la clé _USB_ _CC2531_ Programmez le fichier _CC2531ZNP-Prod.hex_ dans la clé _CC2531_:
 Puis connectez la nappe de l'adaptateur vers la clé (regardez la photo pour le sens de branchement), et insérez la clé dans un des ports _USB_ :
![](/public/Raspberry-CC2531.jpg " _raspberry_ et _CC_") 
 Sauvegardez le contenu actuel de la clé :
 cd flash_cc2531
./cc_chipid
 connecter la clé exemple pour la version _CC2531_DEFAULT_20201127.zip_ :
 faire la programmation fonto fr git clone https://github.com/jmichault/flash_cc2531.git
cd flash_cc2531
 installer le logiciel de programmation post programi_cc2531 testez en exécutant ceci :
 télécharger le programme zigbee wget https://github.com/Koenkk/Z-Stack-firmware/raw/master/coordinator/Z-Stack_Home_1.2/bin/default/CC2531_DEFAULT_20201127.zip
unzip CC2531_DEFAULT_20201127.zip
 | broche _GPIO_          | broche _CC_  |
| ---------------------- | ------------ | 
| 39 ( _GND_ )           | 1 ( _GND_ )  |	
| 36 ( _wPi 27, BCM16_ ) | 3 ( _DC_ )   | 
| 38 ( _wPi 28, BCM20_ ) | 4 ( _DD_ )   | 
| 35 ( _wPi 24, BCM19_ ) | 7 ( _reset_ )| 
 Ça doit retourner:
 Project-Id-Version: 
PO-Revision-Date: 2021-02-13 13:09+0100
Last-Translator: jean <>
Language-Team: .
Language: eo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Generator: Poedit 2.2.1
   ID = b524.
 ![](/public/raspberry-cc.png "dispozicio _raspberry_ kaj _CC_") 
 ./cc_erase
./cc_write CC2531ZNP-Prod.hex
 ./cc_read save.hex
 Elŝutu la plej novan version de la zigbee-kunordiganto en ĉi tiu retejo: <https://github.com/Koenkk/Z-Stack-firmware/raw/master/coordinator/Z-Stack_Home_1.2/bin/default/>, tiam malzipigu la arkivon.
 Konektu ĉi tiujn liniojn al la granda konektilo de la kablo _CC_ :  
 Konekti kvar liniojn _Dupont_ inajn al inaj al pingloj 35,36,38 kaj 39 de _raspberry_. ( Pinglo 2 estas en la angulo de _raspberry_, vidu la retejon <https://pinout.xyz/> por lokalizi)  
 Konsultu [ la retejon de _flash_cc2531_](https://jmichault.github.io/flash_cc2531-dok/)
 En kazo de problemo Programi la USB-ŝlosilon _CC2531_ Programu la dosieron _CC2531ZNP-Prod.hex_ en la ŝlosilo _CC2531_:
 Poste konektu la adaptilan kablon al la ŝlosilo (rigardu la foton pri la direkto de konekto), kaj enmetu la ŝlosilon en unu el la havenoj _USB_ :
![](/public/Raspberry-CC2531.jpg " _raspberry_ kaj _CC_") 
 Konservu la nunan enhavon de la ŝlosilo:
 cd flash_cc2531
./cc_chipid
 konekti la ŝlosilon ekzemplo por la versio _CC2531_DEFAULT_20201127.zip_ :
 faru la programadon auto eo git clone https://github.com/jmichault/flash_cc2531.git
cd flash_cc2531
 instali fulman programaron post programi_cc2531 provu per ĉi tio:
 elŝutu la zigbee-programaron wget https://github.com/Koenkk/Z-Stack-firmware/raw/master/coordinator/Z-Stack_Home_1.2/bin/default/CC2531_DEFAULT_20201127.zip
unzip CC2531_DEFAULT_20201127.zip
 | pinglo _GPIO_          | pinglo _CC_  |
| ---------------------- | ------------ | 
| 39 ( _GND_ )           | 1 ( _GND_ )  |	
| 36 ( _wPi 27, BCM16_ ) | 3 ( _DC_ )   | 
| 38 ( _wPi 28, BCM20_ ) | 4 ( _DD_ )   | 
| 35 ( _wPi 24, BCM19_ ) | 7 ( _reset_ )| 
 Ĝi devas reveni:
 