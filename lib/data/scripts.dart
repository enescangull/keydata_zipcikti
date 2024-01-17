import 'package:flutter/material.dart';
import 'package:keydata_zipcikti/models/script_model.dart';

const scripts = [
  Script(
      "#!/bin/bash\n\nFSKontrol=`grep xxx.xxx.xxx /etc/fstab | wc -l`\nif [ \"\$FSKontrol\" == \"1\" ];then\n\techo \"FSKontrol Ayarlar Yapılı\"\nelse\n\tapt-get install cifs-utils -y\n\tmkdir /mnt/tibbi-sekreterlik\n\tln -s /mnt/tibbi-sekreterlik /etc/skel/Desktop/\n\tmount -t cifs //xxx.xxx.xxx/tibbi-sekreterlik /mnt/tibbi-sekreterlik -o username=tsuser,password=XXXXXXXXXXXXXXXX,noexec,rw,file_mode=0777,dir_mode=0777\n\techo \"username=tsuser\npassword=XXXXXXXXXXXXXXXX\" > /etc/samba/.smbcredentials\n\techo \"//xxx.xxx.xxx/tibbi-sekreterlik /mnt/tibbi-sekreterlik cifs nofail,credentials=/etc/samba/.smbcredentials,noexec,rw,file_mode=0777,dir_mode=0777 0 0\" >> /etc/fstab\n\tC=`ls /home/ | awk '{print \$1}' | wc -l`\n\tT=1\n\twhile [ \"\$T\" -le \"\$C\" ]; do\n\tUsers=`ls /home/ | awk '{print \$1}' | head -\$T | tail -1`\n\tln -s /mnt/tibbi-sekreterlik /home/\$Users/Desktop/\n\tT=\$[\$T+1]\n\tdone\n\techo \"FSKontrol Ayarlar Yapıldı\"\nfi"),
  Script(
      "#!/bin/bash\n\ncat <<EOF > /KEYDATA/Script/MountAuto.sh\n#!/bin/bash\n\nMountKontrol=`mount | grep xxx.xxx.xxx | wc -l`\n\nif [ \"\$MountKontrol\" == \"1\" ]; then\n\techo \"Çalışıyor\"\nelse\n\tmount -t cifs //xxx.xxx.xxx/tibbi-sekreterlik /mnt/tibbi-sekreterlik -o username=tsuser,password=XXXXXXXXXXXXXXXX,noexec,rw,file_mode=0777,dir_mode=0777\nfi\n\nexit 0\nEOF\n\nchmod 755 /KEYDATA/Script/MountAuto.sh\n\nCronKontrol=`cat /etc/crontab | grep MountAuto | wc -l`\n\nif [ \"\$CronKontrol\" == \"1\" ]; then\n\techo \"Eklenmiş\"\nelse\n\techo \"### İlgili Ortak Alanın Kilidi Açılmıştır. Kullanıcıya F5 ile yenilemesini söyle! ###\n*/5 * * * * root /KEYDATA/Script/MountAuto.sh\" >> /etc/crontab\nfi"),
  Script(
      'wget --no-check-certificate -P /tmp/ https://keyos.XXXXXXXXX.com:xxxx/Script/Kernel.sh && chmod 755 /tmp/Kernel.sh && /tmp/Kernel.sh && rm -rf /tmp/Kernel.sh'),
  Script(
      'wget --no-check-certificate -P /tmp/ https://keyos.XXXXXXXXX.com:xxxx/Script/Guncelleme/Duzeltme.sh && chmod 755 /tmp/Duzeltme.sh && /tmp/Duzeltme.sh && rm -rf /tmp/Duzeltme.sh\nls -la /home/kullanici.adi/\n/KEYDATA/Script/Cleanup.sh'),
  Script(
      'ipa-client-install --domain=XXXXXXXXX.local --enable-dns-updates --mkhomedir -p XXXXXXXXX -w XXXXXXXXXXXX --realm=KOCAELİSH.LOCAL --unattended --ntp-server=10.241.1.11 --force-join\n/KEYDATA/Script/Calistir.sh'),
  Script(
      '#!/bin/bash\n\nrm -rf /KEYDATA/Script/akisyuklendi\nrm -rf /KEYDATA/Script/libakisyuklendi\n\n### Akis Kontrol ve Güncelleme Start ###\n\nAkisKontrol="cat /KEYDATA/Script/akisyuklendi | grep akis-2.0 | wc -l"\n\nif [ "\$AkisKontrol" == "0" ];then\n\twget -P /tmp/ https://keyos.XXXXXXXXX.com:xxxx/Script/Arksigner/akis_2.0_amd64.deb\n\tsleep 2\n\tdpkg -i /tmp/akis_2.0_amd64.deb\n\tapt-get -f install -y\n\tapt-get autoremove -y\n\tsleep 2\n\trm -rf /tmp/akis_2.0_amd64.deb\n\ttouch /KEYDATA/Script/akisyuklendi\n\techo "akis-2.0" > /KEYDATA/Script/akisyuklendi\nelse\n\techo "Update Yapılı"\nfi\n\n### Akis Kontrol ve Güncelleme End ###\n\n### Lib ACS Akis Kontrol ve Güncelleme Start ###\n\nAkisKontrol="cat /KEYDATA/Script/libakisyuklendi | grep libakis-1.1.8 | wc -l"\nif [ "\$AkisKontrol" == "0" ];then\n\twget -P /tmp/ https://keyos.XXXXXXXXX.com:xxxx/Script/Arksigner/libacsccid1_1.1.8-1~ubuntu16.04.1_amd64.deb\n\tsleep 2\n\tdpkg -i /tmp/libacsccid1_1.1.8-1~ubuntu16.04.1_amd64.deb\n\tapt-get -f install -y\n\tapt-get autoremove -y\n\tsleep 2\n\trm -rf /tmp/libacsccid1_1.1.8-1~ubuntu16.04.1_amd64.deb\n\ttouch /KEYDATA/Script/libakisyuklendi\n\techo "libakis-1.1.8" > /KEYDATA/Script/libakisyuklendi\nelse\n\techo "Update Yapılı"\nfi\n\n### Lib ACS Akis Kontrol ve Güncelleme End ###'),
];

const tabs = [
  Tab(
    text: "Panel Fix",
    icon: Icon(Icons.auto_fix_high_outlined),
  ),
  Tab(
    text: "İkinci Ekran",
    icon: Icon(Icons.desktop_windows_sharp),
  ),
  Tab(
    text: "Domain Fix",
    icon: Icon(Icons.domain_sharp),
  ),
  Tab(
    text: "Akis",
    icon: Icon(Icons.sim_card_outlined),
  )
];
