#!/bin/bash
# ---------------------------------------------------------------------------- #
#
#              _______      __________             .__
#              \      \     \______   \____ _______|__| ______
#              /   |   \     |     ___|__  \\_  __ \  |/  ___/
#             /    |    \    |    |    / __ \|  | \/  |\___ \
#             \____|__  / /\ |____|   (____  /__|  |__/____  >
#                     \/  \/               \/              \/
#
# ---------------------------------------------------------------------------- #

# Définiton des variables
# -----------------------
rouge='\e[1;31m'
bleu='\e[1;34m'
neutre='\e[0;m'


NOW=$(date +"%m-%d-%Y")

# Vérification que le script est bien executé en tant que 'root'
# --------------------------------------------------------------
if [[ $EUID -ne 0 ]]; then
    clear
    echo "******************************************************************************"
    echo "***                                                                        ***"
    echo "***                                                                        ***"
    echo -e "***                 ${rouge}!!! This script must be run as root !!!${neutre}                ***"
    echo "***                                                                        ***"
    echo "***                                                                        ***"
    echo -e "*** ${rouge}You must run the script with the command 'sudo'${neutre}                        ***"
    echo -e "*** ${rouge}Make sure you have read and understood this script before executing it${neutre} ***"
    echo "******************************************************************************"
    1>&2
	exit 1
fi

# Création d'un fichier de log
# ----------------------------
logFile="/tmp/configure-workstation-$NOW"
touch $logFile
redirect="2>&1 >> $logFile"

# Mise à jour de la distribution utilisée
# ---------------------------------------
clear
echo "******************************************************************************"
echo "***                                                                        ***"
echo -e "*** ${bleu}Update and upgrade software sources${neutre}                                    ***"
echo "***                                                                        ***"
echo "******************************************************************************"
#apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

# Nettoyage de l'installation
# ---------------------------
apt-get clean
apt-get -q --yes autoremove --purge

# prompt for a reboot
# -------------------
clear
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
