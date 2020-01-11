# linux-hid-joycon
This is a kernel module for add the Switch controllers driver.
This driver is an improvement of the basic hid driver from Daniel J. Ogorchock <djogorchock@gmail.com> that can be found on https://github.com/DanielOgorchock/linux

The goal was to provide the same thing as the daemon joycond from the same developper but directly inside the main driver.
It may be easier to install and use for a common user who just need to compile and install the module and get everything done in the kernel.

This is my first linux kernel program (so, my mod) and I can make some errors. I'm learning.
Thanks for your comprehension and your help. 

## Installation :
1) get the correct kernel header for your linux distribution. For a debian based distribution:
` sudo apt install linux-headers-$(uname -r) `

2) clone or download this repository

3) Compile the driver : open a command line in the folder where you put the download files and type:
` make `

4) load the module : *this operation need to be executed on all reboots! * go in the folder where is the driver and type:
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
