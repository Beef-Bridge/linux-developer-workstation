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

# Vérification que le script est bien executé en tant que 'root'
# --------------------------------------------------------------
if [[ $EUID -ne 0 ]]; then
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

# Mise à jour de la distribution utilisée
# ---------------------------------------
echo "                                                                              "
echo "                                                                              "
echo "                                                                              "
echo "******************************************************************************"
echo "***                                                                        ***"
echo -e "*** ${bleu}Update and upgrade software sources${neutre}                                    ***"
echo "***                                                                        ***"
echo "******************************************************************************"
#apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
