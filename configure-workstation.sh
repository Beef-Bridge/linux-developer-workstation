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

# Définition des variables
# -----------------------
rouge='\e[1;31m'
vert='\e[1;32m'
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

# Fonctions
# ---------
function cmd_print {
    cmdLine="$1"
    cmdStringProcess=`printf "%-45s" "$2"`
    cmdString=`printf "%-50s" "$2"`

    echo -ne "*** $cmdStringProcess${bleu}[PROCESS]${neutre} ***"
    eval $cmdLine $redirect
    if [ $? -eq 0 ]
    then
        echo -e "\r*** $cmdString${vert}[OK]${neutre} ***"
    else
        echo -e "\r*** $cmdString${rouge}[KO]${neutre} ***"
    fi
}

# Mise à jour de la distribution utilisée
# ---------------------------------------
clear
echo "******************************************************************************"
echo "***                                                                        ***"
echo -e "*** ${bleu}Update and upgrade software sources${neutre}                                    ***"
echo "***                                                                        ***"
echo "******************************************************************************"
cmd_print "apt-get -qq -y --force-yes update" "-> apt-get update"
cmd_print "apt-get -qq -y --force-yes upgrade" "-> apt-get upgrade"
cmd_print "apt-get -qq -y --force-yes dist-upgrade" "-> apt-get dist-upgrade"

# Nettoyage de l'installation
# ---------------------------
echo "******************************************************************************"
echo "***                                                                        ***"
echo -e "*** ${bleu}Clean cache & remove installation files : ${neutre}                                    ***"
echo "***                                                                        ***"
echo "******************************************************************************"
cmd_print "apt-get -qq clean" "-> apt-get clean"
cmd_print "apt-get -qq --yes autoremove --purge" "-> apt-get autoremove"

# prompt for a reboot
# -------------------
#clear
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
