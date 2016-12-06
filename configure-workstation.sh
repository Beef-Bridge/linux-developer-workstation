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

# Vérification que le script est bien executé en tant que 'root'
# --------------------------------------------------------------
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

# Mise à jour de la distribution utilisée
# ---------------------------------------
echo "Update & upgrade"
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
