obj-m += hid-joycon.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

install:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules_install
	depmod -A

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
