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
echo -e "$rot ==================================================="
echo -e "$gelb Webseiten Verschluesseln / SSL"
echo -e ""
echo -e "$cyan Soll der Server geupdatet werden? Y=Ja, N=Nein" $gruen read antwort
echo -e "$rot ===================================================$gruen"
sleep 2
clear
if [[ "$antwort" == "Y" || "$antwort" == "y" ]]; then
    echo -e "$rot ==================================================="
    echo -e "$gruen Server wird aktualisiert..."
    echo -e "$rot ==================================================="
    sudo apt update && sudo apt upgrade -y
    echo -e "$rot ==================================================="
    echo -e "$gruen Update abgeschlossen!"
    echo -e "$rot ==================================================="
    sleep 3
    clear
elif [[ "$antwort" == "N" || "$antwort" == "n" ]]; then
    echo "Update abgebrochen."
    sleep 4
    clear
else
    echo "Ungültige Eingabe. Bitte Y oder N eingeben."
    sleep 4
    clear
fi
clear
echo -e "$rot ==================================================="
echo -e "$gelb Webseiten Verschluesseln / SSL"
echo -e ""
echo -e "$cyan Bitte gib die Domain ein:" $gruen read domain
echo -e "$rot ===================================================$gruen"
sleep 2
clear
echo -e "$rot ==================================================="
echo -e "$gelb Webseiten Verschluesseln / SSL"
echo -e ""
echo -e "$cyan Bitte gib fuer $domain den Gewuenschten Certnamen"
echo -e "$cyan ein:" $gruen read ordner
echo -e "$rot ===================================================$gruen"
sleep 3
clear
sudo certbot certonly --authenticator standalone --cert-name $ordner --pre-hook "systemctl stop apache2.service" --post-hook "systemctl start apache2.service" -d $domain
sleep 5
systemctl restart apache2
clear
echo -e "$rot ==================================================="
echo -e "$gelb Webseiten Verschluesseln / SSL"
echo -e ""
echo -e "$blau $domain $cyan mit dem Certnamen $blau $ordner $gruen erstellt!"
echo -e "$rot ==================================================="
sleep 5
clear
echo -e "$rot ==================================================="
echo -e "$gelb Webseiten Verschluesseln / SSL"
echo -e ""
echo -e "$cyan $Deine Webseite ist unter folgende Domain erreichbar"
echo -e "                $gruen https://$domain"
echo -e "$rot ==================================================="
sleep 5
