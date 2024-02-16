#!/bin/bash/
#Erstellt von x_PlayerGamer_01

#Farben

rot='\033[0;31m'
gruen='\033[0;32m'
gelb='\033[0;33m'
blau='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#Server wird als erstes Upgedatet
apt update -y && apt-upgrade -y
echo -e "$rot ==================================================="
echo -e "$gelb Webseiten Verschluesseln / SSL"
echo -e ""
echo -e "$cyan Bitte gib die Domain ein"
echo -e "$rot ===================================================$gruen"
read domain

echo -e "$rot ==================================================="
echo -e "$gelb Webseiten Verschluesseln / SSL"
echo -e ""
echo -e "$cyan Bitte gib fuer $domain den Gewuenschten Certnamen"
echo -e "$cyan ein"
echo -e "$rot ===================================================$gruen"
read ordner
clear
sudo certbot certonly --authenticator standalone --cert-name $ordner --pre-hook "systemctl stop apache2.service" --post-hook "systemctl start apache2.service" -d $domain
sleep 5
systemctl restart apache2
clear
echo -e "$rot ==================================================="
echo -e "$gelb Webseiten Verschluesseln / SSL"
echo -e ""
echo -e "$cyan $blau $domain $cyan mit dem Certnamen $blau $ordner $gruen erstellt!"
echo -e "$rot ==================================================="
sleep 5
clear
echo -e "$rot ==================================================="
echo -e "$gelb Webseiten Verschluesseln / SSL"
echo -e ""
echo -e "$cyan $Deine Webseite ist unter folgende Domain erreichbar"
echo -e "                $gruen https://$domain"
echo -e "$rot ==================================================="

