# linux-hid-joycon
This is a kernel module for add the Switch controllers driver.
This driver is an improvement of the basic hid driver from Daniel J. Ogorchock <djogorchock@gmail.com> that can be found on https://github.com/DanielOgorchock/linux

The goal was to provide the same thing as the daemon joycond from the same developper but directly inside the main driver.
It may be easier to install and use for a common user who just need to compile and install the module and get everything done in the kernel.

This is my first linux kernel program (exactly it is more a fork than a complete module) and I can make some errors. I'm learning.
Thanks for your comprehension and your help. 

## Installation :
1) get the correct kernel header for your linux distribution. For a debian based distribution:
` sudo apt install linux-headers-$(uname -r) `

2) clone or download this repository

3) Compile the driver : open a command line in the folder where you put the download files and type:
` make `

4) load the module : *this operation needs to be executed on all reboots!* go in the folder where is the driver and type:
` sudo insmod hid-joycon.ko `

## Use :
1) pair in bluetooth your Switch controller. (the pro controller can also be used by USB)
2) connect your joystick, for the pro controller it's fine.
For the joycons: the players leds just start blinking
Now just press in the same time the triger buttons to choose between one joycon only or combined controller (exactly like on the Nintendo Switch)
You will be able to use your joystick ;)

Note: if you combine two joycons, when one was disconnect, the second return in pairing mode with leds blinking

/!\ The driver can't support more than 8 players using switch controllers in the same time.

/!\ This version is the first one and may have some bugs (like computer freeze), using it at own risk !

Sorry for my english, I'm a French student.
you can join me on my e-mail: bladeur13@free.fr

-------------------------------------------------------------------------------------------------------------------------------
 
# FR : Pilote de joycon pour le noyau linux
  hid-joycon est un pilote de périphérique pour les systèmes linux qui permet l'utilisation des manettes Nintendo Switch, pro controller et joycons sur votre ordinateur. Il se distingue du pilote natif par la possibilité d'avoir les joysticks analogiques et de pouvoir combiner ensemble les joycons droit et gauche en une unique manette. Le tout directement au travers du noyau linux.
  
  Ce module pour le noyau est une amélioration du pilote dans sa version la plus basique développé par Daniel J. Ogorchock que vous pouvez retrouver à l'adresse: https://github.com/DanielOgorchock/linux . Le but était d'implémenter des fonctionnalités similaires à son logiciel joycond qui permet de combiner deux joycons en une manette virtuelle dans l'espace utilisateur, mais directement à travers le noyau.
  Ainsi ce module se contente du pilote basique pour gérer les joysticks et les boutons. Il ne dispose pas pour le moment des fonctionnalités supplémentaires comme le rumble (vibrations) ou encore le gyroscope/accéléromètre. Il s'adresse principalement aux joueurs qui veulent pouvoir jouer facilement et dans des conditions correctes à leurs jeux sous linux dans la limite de 8 manettes switchs en même temps.
  
  Il s'agit enfin de mon premier projet sur le noyau linux et de l'une de mes premières applications en C. De plus il s'agit d'une première version et tous les bugs ont pu ne pas être décelés. Utiliser donc ce module à vos risques (par exemple risque de plantage du noyau, et par extension de l'ordinateur). Je vous remercie de votre comprehension. Vous pouvez me contacter pour des retours à mon adresse bladeur13@free.fr .
  
## Installation
1) Pour pouvoir compiler ce module assurez-vous que les en-têtes du noyau actuel sont installées sur votre système. Pour une distribution basée sur debian, il suffit de lancer la commande:
` sudo apt install linux-headers-$(uname -r) `

2) Téléchargez les fichiers présents dans ce dépot et extraire l'archive obtenue dans un nouveau dossier.
Si vous avez installé le paquet `git` vous pouver également cloner le dépot avec la commande:
`git clone https://github.com/Jo-Blade/linux-hid-joycon.git`

3) Placez vous dans le dossier nouvellement créé: `cd linux-hid-joycon`

4) Compilez le module avec la commande `make`

5) Insérez le module dans le noyau: placez vous dans le dossier contenant le pilote et lancez la commande:
` sudo insmod hid-joycon.ko `
**/!\ Cette dernière opération est à répéter à chaque redémarrage de l'ordinateur**

6) Pour éviter les problèmes de dépendances liées à insmod, vous pouvez installer le module. Placez-vous dans le fichier et:
 `sudo make install`
 Vous insérez alors le module dans le noyau avec `sudo modprobe hid-joycon` (cette dernière commande est à répéter à chaque redémarrage)

## Utilisation
Connectez vos manettes switch à votre ordinateur par bluetooth. Le pro-controller peut également être utilisé par liaison filaire. Le pro-controller peut être utilisé directement après la connexion. Pour les joycons, les leds vont se mettre à clignoter: vous devez appuyer en même temps sur les gachettes des manettes pour choisir le mode de connection comme sur votre nintendo Switch.
 L'appui sur Sr et Sl connectera la manette en configuration manette unique. L'appui sur L du joycon gauche et R du joycon droit va quant à lui connecter ces deux manettes en configuration partagée (elles ne contituerons qu'une unique manette dans vos jeux). Les leds vont alors changer et montrer votre joueur actuel comme sur la console.
 Dans cette seconde configuration, lors de la deconnexion d'une des deux manettes, la seconde passera de nouveau en attente avec les leds qui clignotent.
