export THEOS_DEVICE_IP=192.168.1.32
include theos/makefiles/common.mk

TWEAK_NAME = pacman
pacman_FILES = Tweak.xm mains.m Pacman.m Noname.m
pacman_FRAMEWORKS = UIKit QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
