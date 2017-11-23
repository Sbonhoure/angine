#!/bin/bash
# pause2.sh : appuyer sur une touche pour continuer un script


echo "Afin de commencer l'installation, votre mot de passe vous sera demandé.."
echo "Appuyer sur une touche pour continuer"
read touche
case $touche in
esac

		sudo apt-get install -y vagrant
		sudo apt-get install -y virtualbox

echo "vagrant et virtualbox sont désormais installé"
echo "Appuyer sur une touche pour continuer"
read touche
case $touch in
esac

echo "Un fichier vagrantfile va être généré !"
echo "Appuyer sur une touche pour continuer"
read touche
case $touch in
esac

[ ! -f Vagrantfile ];
vagrant init 1>/dev/null
echo "Votre fichier à bien été crée"

echo "Vous allez maintenant pouvoir créer une VagrantBox"
echo "Appuyer sur une touche pour continuer"
read touche
case $touch in
esac

echo
echo "Veuillez choisir votre VagrantBox"
echo -e "\t 1. ubuntu/xenial64"
echo -e "\t 2. ubuntu/trusty64"
read -p "Choix : " box
echo

case $box in

1)

sed -i -e 's/base/ubuntu\/xenial64/g' Vagrantfile
echo "Vous avez choisi : ubuntu/xenial64"
echo
;;

2)

sed -i -e 's/base/ubuntu\/trusty64/g' Vagrantfile
echo "vous avez choisi : ubuntu/trusty64"
echo
;;

*)
echo "Choix incorrecte"
rm Vagrantfile
exit 0
;;

esac

box="ubuntu\/xenial64";

 sed -i -e "s/config.vm.box = \"base\"/config.vm.box = \"$box\"/g" Vagrantfile;

	 read -p "Saisissez le nom du dossier 'data' : " dossier;

		read -p "Saisissez le chemin (ex: /var/www/html) : " chemin;

			sed -i -e "s=config.vm.synced_folder \"..\/data\", \"\/vagrant_data\"=config.vm.synced_folder \"$dossier\", \"$chemin\"=g" Vagrantfile;

			sed -i "/private_network/s/^  # /  /g" Vagrantfile


#echo "ok"

#box="ubuntu\/trusty64";

# sed -i -e "s/config.vm.box = \"base\"/config.vm.box = \"$box\"/g" Vagrantfile;
	 
#	 read -p "Saississez le nom du dossier 'data' : "dossier;

#		read -p "Saissisez le chemin (ex: /var/www/html) : " chemin;

#			sed -i -e "s=config.vm.synced_folder \"..\/data\", \"\/vagrant_data\"=config.vm.synced_folder \"$dossier\", \"$chemin\"=g" Vagrantfile;

#			sed -i "/private_network/s/^  # /  /g" Vagrantfile

vagrant up
vagrant ssh
virtualbox

